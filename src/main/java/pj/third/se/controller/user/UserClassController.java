package pj.third.se.controller.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
       nextPage ="user/class/all_class_list";
       return nextPage;
    }
    @GetMapping("/listUpAllClass")
    public String listUpAllClass(Model model) {
        List <ClassInfoVo> classInfoVos = userClassService.listUpAllClass();
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
    public String registerClassForm(@RequestParam("cls_no")int cls_no, Model model) {
        ClassInfoVo classInfoVos = userClassService.classInfoDetail(cls_no);
        model.addAttribute("classInfoVos", classInfoVos);
        return "user/class/register_class_form";
    }

    @PostMapping("/registerClassConfirm")
    public String registerClassConfirm(RegisterClassVo registerClassVo) {
        String nextPage;
         userClassService.registerClassConfirm(registerClassVo);
            nextPage = "redirect:/user/class/registerClassList";
            return nextPage;
        }
    @GetMapping("/registerClassList")
    public String registerClassList() {
        String nextPage;
        nextPage ="user/class/register_class_list_form";
        return nextPage;
    }
    @GetMapping("/listUpRegisterClass/{u_no}")
    public String listUpRegisterClass(@PathVariable("u_no") int u_no, Model model) {
        log.info("u_no --> {}:", u_no);
        List <RegisterClassVo> registerClassVos = userClassService.listUpRegisterClass(u_no);
        model.addAttribute("registerClassVos", registerClassVos);
        return "user/class/register_class_list";
    }


}
