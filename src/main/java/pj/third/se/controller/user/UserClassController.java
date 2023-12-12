package pj.third.se.controller.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pj.third.se.service.user.UserClassService;
import pj.third.se.vo.instructor.ClassInfoVo;

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
        return "user/class/all_class";
    }
}
