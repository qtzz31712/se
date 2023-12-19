package pj.third.se.controller.user;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pj.third.se.service.user.UserClassService;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

import java.util.List;


@Slf4j
@Controller
@RequestMapping("/user/class")
public class UserClassController {

    @Autowired
    UserClassService userClassService;

    // 전체 강의 리스트
    @GetMapping("/allClassList")
    public String allClassList() {
        String nextPage;
        nextPage = "user/class/all_class_list";
        return nextPage;
    }

    @GetMapping("/listUpAllClass")
    public String listUpAllClass(Model model) {
        List<ClassInfoVo> classInfoVos = userClassService.listUpAllClass();
        model.addAttribute("classInfoVos", classInfoVos);
        log.info("classInfoVos.instructorMemberVo.t_name --> {}:", classInfoVos);
        return "user/class/all_class";
    }

    // 강의 정보 상세
    @RequestMapping(value = "/classInfoDetail", method = {RequestMethod.GET, RequestMethod.POST})
    public String classInfoDetail(@RequestParam("cls_no") int cls_no, Model model) {
        log.info("cls_no --> {}:", cls_no);
        ClassInfoVo classInfoVos = userClassService.classInfoDetail(cls_no);
        model.addAttribute("classInfoVos", classInfoVos);
        log.info("classInfoVos --> {}:", classInfoVos);
        return "user/class/class_detail";
    }

    // 수강 신청
    @GetMapping("/registerClassForm")
    public String registerClassForm(@RequestParam("cls_no") int cls_no, @RequestParam("u_no") int u_no, Model model, RedirectAttributes redirectAttributes) {
        int checkDuplicate;
        String nextPage;
        checkDuplicate = userClassService.checkDuplicate(cls_no, u_no);
        if (checkDuplicate == 1) {
            redirectAttributes.addFlashAttribute("message", "이미 수강신청 한 강의입니다");
            nextPage = "redirect:/user/class/registerClassList";
        } else {
            nextPage = "user/class/register_class_form";
            ClassInfoVo classInfoVos = userClassService.classInfoDetail(cls_no);
            model.addAttribute("classInfoVos", classInfoVos);
        }
        return nextPage;
    }

    @PostMapping("/registerClassConfirm")
    public String registerClassConfirm(RegisterClassVo registerClassVo, RedirectAttributes redirectAttributes) {
        String nextPage;
        int result = userClassService.registerClassConfirm(registerClassVo);
        if (result == 0) {
            redirectAttributes.addFlashAttribute("message", "이미 수강 신청한 강의 입니다.");
        } else {
            redirectAttributes.addFlashAttribute("message", "수강신청이 완료되었습니다.");
        }
        nextPage = "redirect:/user/class/registerClassList";
        return nextPage;
    }

    @GetMapping("/registerClassList")
    public String registerClassList(Model model, @ModelAttribute("message") String message) {
        String nextPage = "user/class/register_class_list_form";

        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }

        return nextPage;
    }

    @GetMapping("/listUpRegisterClass/{u_no}")
    public String listUpRegisterClass(@PathVariable("u_no") int u_no, Model model) {
        log.info("u_no --> {}:", u_no);
        List<RegisterClassVo> registerClassVos = userClassService.listUpRegisterClass(u_no);
        model.addAttribute("registerClassVos", registerClassVos);
        return "user/class/register_class_list";
    }

    @RequestMapping(value = "/deleteRegisterClass/{rc_no}", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteRegisterClass(@PathVariable("rc_no") int rc_no, RedirectAttributes redirectAttributes) {
        log.info("rc_no --> {}:", rc_no);
        String message = "";
        int result;
        result = userClassService.deleteRegisterClass(rc_no);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수강신청이 취소되었습니다");
        }
        return "redirect:/user/class/registerClassList";
    }


}
