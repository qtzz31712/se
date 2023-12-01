package pj.third.se.controller.member;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pj.third.se.vo.member.InstructorMemberVo;
import pj.third.se.service.member.InstructorMemberService;

@Slf4j
@Controller
@RequestMapping("/instructor/member")
public class InstructorMemberController {

    @Autowired
    InstructorMemberService instructorMemberService;

    //회원 가입 관련
    @GetMapping("/createAccount")
    public String createAccountForm() {
        String nextPage;
        nextPage = "instructor/member/createAccountForm";
        return nextPage;
    }

    @PostMapping("/createAccountConfirm")
    public String createAccountConfirm(InstructorMemberVo instructorMemberVo) {
        String nextPage;
        System.out.println("가입컨트롤러호출");
        Boolean result = instructorMemberService.createAccountConfirm(instructorMemberVo);
        log.info("result --> : {}", result);
        nextPage = "index";
        return nextPage;
    }

    // 로그인 관련

    @PostMapping("/loginConfirm")
    public String loginConfirm(InstructorMemberVo instructorMemberVo, HttpSession session) {
        String nextPage = "redirect:/se";

        InstructorMemberVo loginedInstructorMemberVo = instructorMemberService.loginConfirm(instructorMemberVo);

        if (loginedInstructorMemberVo == null) {
            nextPage = "common/member/login_ng";
        } else {
            session.setAttribute("loginedInstructorMemberVo", loginedInstructorMemberVo);
            session.setMaxInactiveInterval(60 * 30);
        }
        return nextPage;
    }

    //회원 정보 열람 및 수정
    @RequestMapping(value = "/myInfo", method = {RequestMethod.POST, RequestMethod.GET})
    public String myInfo(@RequestParam("t_no") int t_no, Model model) {
        String nextPage;
        log.info("t_no --> : {}", t_no);
        InstructorMemberVo instructorMemberVos = instructorMemberService.myInfo(t_no);
        if (instructorMemberVos != null) {
            model.addAttribute("instructorMemberVos", instructorMemberVos);
            nextPage = "instructor/member/myInfo";
        } else {
            // null인 경우에 대한 처리 (예: 에러 메시지 설정 등)
            model.addAttribute("error", "유저 정보를 가져 오는데 실패 했습니다");
            nextPage = "/se";
        }
        return nextPage;
    }

    @RequestMapping(value = "/modifyAccountForm", method = {RequestMethod.POST, RequestMethod.GET})
    public String modifyAccountForm(@RequestParam("t_no") int t_no, Model model) {
        String nextPage;
        InstructorMemberVo instructorMemberVos = instructorMemberService.myInfo(t_no);
        if (instructorMemberVos != null) {
            model.addAttribute("instructorMemberVos", instructorMemberVos);
            nextPage = "instructor/member/modifyAccountForm";
        } else {
            // null인 경우에 대한 처리 (예: 에러 메시지 설정 등)
            model.addAttribute("error", "유저 정보를 가져 오는데 실패 했습니다");
            nextPage = "/se";
        }
        return nextPage;
    }

    @PostMapping(value = "/modifyAccountConfirm")
    public String modifyAccountConfirm(InstructorMemberVo instructorMemberVo) {
        String nextPage;
        int result = instructorMemberService.modifyInstructorMember(instructorMemberVo);
        if (result == 1) {
            nextPage = "redirect:/se";
        } else {
            nextPage = "redirect:/instructor/modifyAccountForm";
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
    public String deleteAccountConfirm(@RequestParam("t_no") int t_no) {
        String nextPage;
        int result = instructorMemberService.deleteInstructorMember(t_no);
        nextPage = "redirect:/se";
        return nextPage;
    }


}
