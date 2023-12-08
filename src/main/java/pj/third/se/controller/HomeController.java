package pj.third.se.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
public class HomeController {

    @RequestMapping(value = "/se", method = {RequestMethod.GET, RequestMethod.POST})
    public String homeController() {
        System.out.println("홈 컨트롤러 호출");
        String nextPage;
        nextPage = "index";
        return nextPage;
    }
    @RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
    public String joinType() {
        String nextPage;
        nextPage = "common/member/select_create_account_type";
        return nextPage;
    }
    @RequestMapping(value = "/loginForm", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginForm() {
        String nextPage;
        System.out.println("로그인호출");
        nextPage = "common/member/login_form";
        return nextPage;
    }

    @GetMapping("/checkSession")
    @ResponseStatus(HttpStatus.OK)
    public void checkSessionValidity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session;
        session = request.getSession(false);

        if (session == null || session.getAttribute("loginedInstructorMemberVo") == null && "loginedUserMemberVo" == null) {
            // 세션이 만료되었거나 로그인된 정보가 없는 경우
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);;
        }
    }


}
