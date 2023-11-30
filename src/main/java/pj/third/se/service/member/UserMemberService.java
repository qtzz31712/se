package pj.third.se.service.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.Vo.member.UserMemberVo;
import pj.third.se.repository.member.UserMemberRepository;

@Slf4j
@Service
public class UserMemberService {

//    final static public int USER_ACCOUNT_ALREADY_EXIST = 0;
//    final static public int USER_ACCOUNT_CREATE_SUCCESS = 1;
//    final static public int USER_ACCOUNT_CREATE_FAIL = -1;

    @Autowired
    UserMemberRepository userMemberRepository;

    public Boolean createAccountConfirm(UserMemberVo userMemberVo) {

        log.info("userMemberVo --> : {}", userMemberVo.toString());

        return userMemberRepository.saveUser(userMemberVo);




//        if (!isMember) {
//            int result = userMemberRepository.insertUserAccount(userMemberVo);
//
//            if (result > 0)
//                return USER_ACCOUNT_CREATE_SUCCESS;
//
//            else
//                return USER_ACCOUNT_CREATE_FAIL;
//
//        } else {
//            return USER_ACCOUNT_ALREADY_EXIST;
//
//        }
    }

    public UserMemberVo myInfo(int u_no){
        log.info("u_no --> : {}", u_no);
        return userMemberRepository.selectMyInfo(u_no);
    }
public UserMemberVo loginConfirm(UserMemberVo userMemberVo) {
        return userMemberRepository.selectUser(userMemberVo);
}

    public int modifyUserMember(UserMemberVo userMemberVo) {
    return userMemberRepository.updateUser(userMemberVo);
    }

    public int deleteUserMember(int u_no) {
return userMemberRepository.deleteUser(u_no);
    }
}
