package pj.third.se.controller.instructor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pj.third.se.service.insturctor.InstructorClassService;
import pj.third.se.service.insturctor.InstructorMemberService;
import pj.third.se.vo.instructor.ClassInfoVo;

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

    @RequestMapping(value = "/myClassList", method = {RequestMethod.GET, RequestMethod.POST})
    public String listMyClassList(@RequestParam("cls_t_no") String cls_t_no, Model model) {
        model.addAttribute("cls_t_no", cls_t_no);
        String nextPage;
        nextPage = "instructor/class/my_class_list";
        return nextPage;
    }

    @RequestMapping(value = "/instructor/listUpClass/{cls_t_no}", method = {RequestMethod.GET, RequestMethod.POST})
    public String listUpClass(@PathVariable("cls_t_no") String cls_t_no, Model model) {
        log.info("cls_t_no --> {}:", cls_t_no);
        List<ClassInfoVo> classInfoVos = instructorClassService.listMyClass(cls_t_no);
        model.addAttribute("classInfoVos", classInfoVos);
        return "instructor/class/class_list";
    }


}
