package pj.third.se.controller.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pj.third.se.Vo.UserMemberVo;
import pj.third.se.service.UserMemberService;

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


/*    @ResponseBody
    @PostMapping("/createAccountConfirm")
    public ResponseEntity<UserMemberVo> createAccountConfirm(@RequestBody UserMemberVo userMemberVo) {
        String nextPage;

      //  nextPage = "user/member/create_account_ok";
        return ResponseEntity<>( , HttpStatus.BAD_REQUEST );
    }*/

}
