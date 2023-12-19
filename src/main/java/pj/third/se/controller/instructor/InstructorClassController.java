package pj.third.se.controller.instructor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pj.third.se.service.insturctor.InstructorClassService;
import pj.third.se.service.insturctor.InstructorMemberService;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

import java.security.PublicKey;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/instructor/class")
public class InstructorClassController {

    @Autowired
    InstructorClassService instructorClassService;
    @Autowired
    InstructorMemberService instructorMemberService;

    @GetMapping("/createClassForm")
    public String createClassForm() {
        String nextPage;
        nextPage = "/instructor/class/create_class_form";
        return nextPage;
    }

    @PostMapping("/createClassConfirm")
    public String createClassConfirm(ClassInfoVo classInfoVo) {
        String nextPage;
        int result = instructorClassService.createClassInfo(classInfoVo);
        if (result == 1) {
            nextPage = "redirect:/myClassList";
        } else {
            nextPage = "/instructor/class/create_class_fail";
        }
        return nextPage;
    }

    //내가 개설한 강의
    @RequestMapping(value = "/myClassList", method = {RequestMethod.GET, RequestMethod.POST})
    public String listMyClassList(@RequestParam("cls_t_no") int cls_t_no, Model model) {
        model.addAttribute("cls_t_no", cls_t_no);
        String nextPage;
        nextPage = "instructor/class/my_class_list";
        return nextPage;
    }

 
    @RequestMapping(value = "/listUpClass/{cls_t_no}", method = {RequestMethod.GET, RequestMethod.POST})
    public String listUpClass(@PathVariable("cls_t_no") int cls_t_no, Model model) {
        log.info("cls_t_no --> {}:", cls_t_no);
        List<ClassInfoVo> classInfoVos = instructorClassService.listMyClass(cls_t_no);
        model.addAttribute("classInfoVos", classInfoVos);
        return "instructor/class/class_list";
    }

    //강의정보 상세
    @RequestMapping(value = "/classInfoDetail", method = {RequestMethod.GET, RequestMethod.POST})
    public String classInfoDetail(@RequestParam("cls_no") int cls_no, Model model) {
        log.info("cls_no --> {}:", cls_no);
        ClassInfoVo classInfoVos = instructorClassService.classInfoDetail(cls_no);
        model.addAttribute("classInfoVos", classInfoVos);
        log.info("classInfoVos --> {}:", classInfoVos);
        return "instructor/class/class_detail";
    }

    //강의 수정
    @PostMapping("/modifyClassForm")
    public String modifyClassForm(@RequestParam("cls_no") int cls_no, Model model) {
        ClassInfoVo classInfoVos = instructorClassService.classInfoDetail(cls_no);
        model.addAttribute("classInfoVos", classInfoVos);
        return "instructor/class/modify_class_form";
    }

    @PostMapping("/modifyClassConfirm")
    public String modifyClassConfirm(ClassInfoVo classInfoVo) {
        log.info("classInfoVo--> {}", classInfoVo);
        int result = instructorClassService.modifyClassConfirm(classInfoVo);
        return "redirect:/instructor/class/myClassList?cls_t_no=" + classInfoVo.getCls_t_no();
    }

    //수강신청 가능상태
    @PostMapping("/toggleApproval")
    @ResponseBody
    public void toggleApproval(@RequestParam("cls_no") int cls_no,@RequestParam("cls_approval") int cls_approval) {
        log.info("cls_approval --> {}", cls_approval);
        instructorClassService.toggleApproval(cls_no, cls_approval);
    }

    // 수강 신청 희망 인원 승인
    @GetMapping("/hopeRegisterClassUser")
    public String hopeRegisterCourseUser() {
        return "instructor/class/hope_register_class_user_form";
    }

    @RequestMapping(value = "/listUpHopeUser/{t_no}", method= {RequestMethod.GET, RequestMethod.POST })
    public String listUpHopeUser(@PathVariable("t_no") int t_no, Model model) {
        List<RegisterClassVo> registerClassVos = instructorClassService.listUpHopeUser(t_no);
        model.addAttribute("registerClassVos", registerClassVos);
        return "instructor/class/hope_register_class_user";
    }

    @GetMapping("/hopeUserDetail")
    public String selectHopeUser(@RequestParam("rc_no") int rc_no, Model model) {
     RegisterClassVo registerClassVos = instructorClassService.selectHopeUser(rc_no);
     model.addAttribute("registerClassVos", registerClassVos);
     return "instructor/class/hope_user_detail";
    }


}
