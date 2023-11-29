package pj.third.se.controller.user;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
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

    final
    UserMemberService userMemberService;

    public UserMemberController(UserMemberService userMemberService) {
        this.userMemberService = userMemberService;
    }

    //회원 가입 관련
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
        nextPage = "index";
        return nextPage;
    }

// 로그인 관련
    @RequestMapping(value = "/loginForm", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginForm() {
        String nextPage;
        System.out.println("로그인호출");
        nextPage = "user/member/login_form";
        return nextPage;
    }

    @PostMapping("/loginConfirm")
    public String loginConfirm(UserMemberVo userMemberVo, HttpSession session) {
        String nextPage = "redirect:/se";

        UserMemberVo loginedUserMemberVo = userMemberService.loginConfirm(userMemberVo);

        if (loginedUserMemberVo == null) {
            nextPage = "user/member/login_ng";
        } else {
            session.setAttribute("loginedUserMemberVo", loginedUserMemberVo);
            session.setMaxInactiveInterval(60 * 30);
        }
        return nextPage;
    }

    //회원 정보 열람 및 수정
    @RequestMapping(value = "/myInfo", method = { RequestMethod.POST, RequestMethod.GET })
    public String myInfo(@RequestParam("u_no") int u_no,Model model) {
        String nextPage;
        log.info("u_no --> : {}", u_no);
        nextPage = "user/member/myInfo";
        List<UserMemberVo> userMemberVos = userMemberService.myInfo(u_no);
        model.addAttribute("userMemberVos", userMemberVos);
        return nextPage;
    }
   @RequestMapping(value = "/modifyAccountForm", method = {RequestMethod.POST, RequestMethod.GET} )
   public String modifyAccountForm(@RequestParam("u_no") int u_no,Model model){
       String nextPage;
       List<UserMemberVo> userMemberVos = userMemberService.myInfo(u_no);
       model.addAttribute("userMemberVos", userMemberVos);
       nextPage = "user/member/modifyAccountForm";
       return nextPage;
   }

    @PostMapping(value = "/modifyAccountConfirm")
    public String modifyAccountConfirm(UserMemberVo userMemberVo) {
        String nextPage;
        int result = userMemberService.modifyUserMember(userMemberVo);
        if (result == 1) {
            nextPage = "redirect:/se";
        } else {
            nextPage ="redirect:/user/modifyAccountForm";
        }
        return nextPage;
    }

    //회원 삭제
//    @RequestMapping(value = "/deleteAccountForm", method = {RequestMethod.GET, RequestMethod.POST})
//    public String deleteAccountForm (@RequestParam("u_no") int u_no, Model model){
//        String nextPage;
//        model.addAttribute("u_no", u_no);
//        nextPage = "user/member/deleteAccountForm";
//        return nextPage;
//    }

    @RequestMapping(value = "/deleteAccountConfirm", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteAccountConfirm(@RequestParam("u_no") int u_no){
        String nextPage;
        int result = userMemberService.deleteUserMember(u_no);
        nextPage = "redirect:/se";
        return nextPage;
        }



}
