package pj.third.se.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

    @RequestMapping(value = "/se", method = {RequestMethod.GET, RequestMethod.POST})
    public String homeController() {
        System.out.println("홈 컨트롤러 호출");
        String nextPage;
        nextPage = "index";
        return nextPage;
    }
    @RequestMapping(value = "/se/join", method = {RequestMethod.GET, RequestMethod.POST})
    public String joinType() {
        String nextPage;
        nextPage = "common/member/select_create_account_type";
        return nextPage;
    }
    @RequestMapping(value = "/se/loginForm", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginForm() {
        String nextPage;
        System.out.println("로그인호출");
        nextPage = "common/member/login_form";
        return nextPage;
    }


}
