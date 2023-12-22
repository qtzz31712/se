package pj.third.se.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;
import java.util.UUID;

@Controller
public class FileUploadController {

    @Value("${amazon.aws.accesskey}")
    private String accessKey;

    @Value("${amazon.aws.secretkey}")
    private String secretKey;

    @Value("${amazon.aws.region}")
    private String region;

@Value("${amazon.aws.bucketName}")
    private String bucketName;

    @PostMapping("/upload")
    public String uploadFile(@ModelAttribute("file") MultipartFile file, Model model) {
        try {
            AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKey, secretKey);
            Region awsRegion = Region.of(region);
            S3Client s3Client = S3Client.builder()
                    .credentialsProvider(() -> credentials)
                    .region(awsRegion)
                    .build();

            InputStream inputStream = file.getInputStream();


            String keyName = "se_file_" + UUID.randomUUID().toString();

            PutObjectRequest objectRequest = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(keyName)
                    .build();

            s3Client.putObject(objectRequest, RequestBody.fromInputStream(inputStream, file.getSize()));
            String fileUrl = "https://" + bucketName + ".s3." + awsRegion + ".amazonaws.com/" + keyName;

            model.addAttribute("uploadedFileUrl", fileUrl);
            return "upload-success"; // 업로드 성공 페이지로 리다이렉트 또는 반환
        } catch (IOException e) {
            e.printStackTrace();
            return "upload-failure"; // 업로드 실패 페이지로 리다이렉트 또는 반환
        }
    }


    private File convertMultipartFileToFile(MultipartFile file) throws IOException {
        File convertedFile = new File(Objects.requireNonNull(file.getOriginalFilename()));
        file.transferTo(convertedFile);
        return convertedFile;
    }
}
