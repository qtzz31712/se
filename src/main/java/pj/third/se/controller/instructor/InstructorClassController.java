package pj.third.se.controller.instructor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pj.third.se.service.insturctor.InstructorClassService;
import pj.third.se.service.insturctor.InstructorMemberService;
import pj.third.se.vo.instructor.ChapterVo;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

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
    public String createClassConfirm(ClassInfoVo classInfoVo, RedirectAttributes redirectAttributes) {
        String nextPage;
        int result = instructorClassService.createClassInfo(classInfoVo);
        if (result == 1) {
            int cls_t_no = classInfoVo.getCls_t_no();
            nextPage = "redirect:/instructor/class/myClassList?cls_t_no="+ cls_t_no;
            redirectAttributes.addFlashAttribute("message", "강의 등록에 성공 하였습니다");
        } else {
            nextPage = "redirect:/instructor/class/createClassForm";
            redirectAttributes.addFlashAttribute("message", "강의 등록에 실패하였습니다.");
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

    //수강 중인 인원 목록
    @RequestMapping(value = "/enrolledUser", method = {RequestMethod.GET, RequestMethod.POST})
 public String enrolledUser(@RequestParam("cls_no")int cls_no, Model model){
        model.addAttribute("cls_no", cls_no);
        return "instructor/class/enrolled_user_form";
    }

    @RequestMapping(value = "/listUpEnrolledUser/{cls_no}", method = RequestMethod.GET)
    public String listUpEnrolledUser(@PathVariable("cls_no") int cls_no, Model model){
        List<RegisterClassVo> registerClassVos = instructorClassService.listUpEnrolledUser(cls_no);
        model.addAttribute("registerClassVos", registerClassVos);
        return "instructor/class/enrolled_user";
    }


    // 수강 신청 승인 관련

    @GetMapping("/hopeRegisterClassUser")
    public String hopeRegisterCourseUser(@ModelAttribute("message") String message, Model model) {
        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }
        return "instructor/class/hope_register_class_user_form";
    }

    @RequestMapping(value = "/listUpHopeUser/{t_no}", method= {RequestMethod.GET, RequestMethod.POST })
    public String listUpHopeUser(@PathVariable("t_no") int t_no, Model model) {
        List<RegisterClassVo> registerClassVos = instructorClassService.listUpHopeUser(t_no);
        model.addAttribute("registerClassVos", registerClassVos);
        return "instructor/class/hope_register_class_user";
    }

    @GetMapping("/hopeUserDetail")
    public String selectHopeUser(@RequestParam("rc_no") int rc_no, Model model, @ModelAttribute("message") String message) {
     RegisterClassVo registerClassVos = instructorClassService.selectHopeUser(rc_no);
     model.addAttribute("registerClassVos", registerClassVos);
        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }
     return "instructor/class/hope_user_detail";
    }

    @RequestMapping(value = "/approveUser/{rc_no}", method = {RequestMethod.GET, RequestMethod.POST})
    public String approveUser(@PathVariable("rc_no") int rc_no, RedirectAttributes redirectAttributes) {
        String nextPage;
        int result;
        result = instructorClassService.approveUser(rc_no);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수강 신청이 승인되었습니다");
        nextPage = "redirect:/instructor/class/hopeRegisterClassUser";
        } else {
        redirectAttributes.addFlashAttribute("message", "신청 승인에 실패하였습니다.");
        nextPage = "redirect:/instructor/class/hopeUserDetail?rc_no="+rc_no;
        }
       return nextPage;
    }

    @RequestMapping(value = "/rejectUser/{rc_no}", method = {RequestMethod.GET, RequestMethod.POST})
    public String rejectUser(@PathVariable("rc_no") int rc_no, RedirectAttributes redirectAttributes) {
        String nextPage;
        int result;
        result = instructorClassService.rejectUser(rc_no);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수강 신청이 거절되었습니다");
            nextPage = "redirect:/instructor/class/hopeRegisterClassUser";
        } else {
            redirectAttributes.addFlashAttribute("message", "신청 거절에 실패하였습니다.");
            nextPage = "redirect:/instructor/class/hopeUserDetail?rc_no="+rc_no;
        }
        return nextPage;
    }

    //개별 수업관련
    @GetMapping("/registerChapterForm")
    public String registerChapterForm(@RequestParam("cls_no") int cls_no, @ModelAttribute("message") String message,Model model){
        model.addAttribute("cls_no", cls_no);
        int chapNumbers = instructorClassService.getChapterNumbers(cls_no);
        log.info("chapNumber -->{}", chapNumbers);
        model.addAttribute("chapNumbers", chapNumbers);
        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }
        return "instructor/chapter/register_chapter_form";
    }

    @PostMapping("/registerChapterConfirm")
    public String registerChapterForm(ChapterVo chapterVo, RedirectAttributes redirectAttributes){
        int result;
        String nextPage;
        result = instructorClassService.saveChapter(chapterVo);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수업 등록에 성공하였습니다");
        nextPage ="redirect:/instructor/class/chapter_list_form";
        } else {
            redirectAttributes.addFlashAttribute("message", "수업등록에 실패하였습니다.");
        nextPage ="redirect:/instructor/class/register_chapter_form";
        }
        return nextPage;
    }

    @RequestMapping(value = "/allChapter", method = {RequestMethod.GET, RequestMethod.POST})
    public String ChapterList(@RequestParam("cls_no") int cls_no, Model model) {
      model.addAttribute("cls_no", cls_no);
        return "instructor/chapter/chapter_list_form";
}

@GetMapping("/listUpChapter/{chap_cls_no}")
public String listUpChapter(@PathVariable("chap_cls_no")int chap_cls_no, Model model){
List<ChapterVo> chapterVos = instructorClassService.listUpChapter(chap_cls_no);
        if (chapterVos != null) {
        model.addAttribute("chapterVos", chapterVos);
    }
        return "instructor/chapter/chapter_list";
}
}