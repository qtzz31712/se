package pj.third.se.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String homeController() {
        System.out.println("홈 컨트롤러 호출");
        String nextPage;
        nextPage = "index";
        return nextPage;
    }

}
