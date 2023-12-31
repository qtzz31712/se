package pj.third.se.controller.user;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pj.third.se.vo.user.UserMemberVo;
import pj.third.se.service.user.UserMemberService;

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


    @PostMapping("/loginConfirm")
    public String loginConfirm(UserMemberVo userMemberVo, HttpSession session) {
        String nextPage = "redirect:/se";

        UserMemberVo loginedUserMemberVo = userMemberService.loginConfirm(userMemberVo);

        if (loginedUserMemberVo == null) {
            nextPage = "common/member/login_ng";
        } else {
            session.setAttribute("loginedUserMemberVo", loginedUserMemberVo);
            session.setMaxInactiveInterval(60 * 30);
        }
        return nextPage;
    }

    //회원 정보 열람 및 수정
    @RequestMapping(value = "/myInfo", method = { RequestMethod.POST, RequestMethod.GET })
    public String myInfo(@RequestParam("u_no") int u_no, Model model) {
        String nextPage;
        log.info("u_no --> : {}", u_no);
        UserMemberVo userMemberVos = userMemberService.myInfo(u_no);
        if (userMemberVos != null) {
            model.addAttribute("userMemberVos", userMemberVos);
            nextPage = "user/member/myInfo";
        } else {
            // null인 경우에 대한 처리 (예: 에러 메시지 설정 등)
            model.addAttribute("error", "유저 정보를 가져 오는데 실패 했습니다");
            nextPage = "/se";
        }
        return nextPage;
    }
   @RequestMapping(value = "/modifyAccountForm", method = {RequestMethod.POST, RequestMethod.GET} )
   public String modifyAccountForm(@RequestParam("u_no") int u_no,Model model){
       String nextPage;
       UserMemberVo userMemberVos = userMemberService.myInfo(u_no);
       if (userMemberVos != null) {
           model.addAttribute("userMemberVos", userMemberVos);
           nextPage = "user/member/modifyAccountForm";
       } else {
           // null인 경우에 대한 처리 (예: 에러 메시지 설정 등)
           model.addAttribute("error", "유저 정보를 가져 오는데 실패 했습니다");
           nextPage ="/se";
       }
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

    //로그아웃
    @GetMapping("/logoutConfirm")
    public String logoutConfirm(HttpSession session) {
        String nextPage = "redirect:/se";
        session.invalidate();
        return nextPage;
    }

    //회원 탈퇴
    @RequestMapping(value = "/deleteAccountConfirm", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteAccountConfirm(@RequestParam("u_no") int u_no){
        String nextPage;
        int result = userMemberService.deleteUserMember(u_no);
        nextPage = "redirect:/se";
        return nextPage;
        }



}
