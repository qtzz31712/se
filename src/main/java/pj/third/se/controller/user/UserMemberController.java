package pj.third.se.controller.user;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pj.third.se.Vo.UserMemberVo;
import pj.third.se.service.UserMemberService;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/user/member")
public class UserMemberController {

    @Autowired
    UserMemberService userMemberService;

    @GetMapping("/createAccount")
    public String createAccountForm() {
        String nextPage;
        nextPage = "user/member/createAccountForm";
        return nextPage;
    }

    @PostMapping("/createAccountConfirm")
    public String createAccountConfirm(UserMemberVo userMemberVo) {
        String nextPage;
        Boolean result = userMemberService.createAccountConfirm(userMemberVo);

        log.info("result --> : {}", result);
        if (result)
            nextPage = "user/member/create_account_ng";

        nextPage = "index";
        return nextPage;
    }

    @GetMapping("/myInfo")
    public String myInfo(@RequestParam("u_no") int u_no, UserMemberVo userMemberVo, Model model) {
        String nextPage;
        log.info("u_no --> : {}", u_no);
        nextPage = "user/member/myInfo";
        List<UserMemberVo> userMemberVos = userMemberService.myInfo(u_no);
        model.addAttribute("userMemberVos", userMemberVos);
        return nextPage;
    }

    @RequestMapping(value = "/loginForm", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginForm() {
        String nextPage;
        System.out.println("로그인호출");
        nextPage = "user/member/login_form";
        return nextPage;
        Boolean result = userMemberService.loginConfirm();

    }

    @PostMapping("/loginConfirm")
    public String loginConfirm(UserMemberVo userMemberVo, HttpSession session) {
        String nextPage = "/index";

        UserMemberVo loginedUserMemberVo = userMemberService.loginConfirm(userMemberVo);

        if (loginedUserMemberVo == null) {
            nextPage = "user/member/login_ng";

        } else {
            session.setAttribute("loginedUserMemberVo", loginedUserMemberVo);
            session.setMaxInactiveInterval(60 * 30);

        }
    }


}
