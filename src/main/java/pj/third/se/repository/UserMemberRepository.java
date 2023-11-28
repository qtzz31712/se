package pj.third.se.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import pj.third.se.Vo.UserMemberVo;

import java.util.List;

@Mapper
public interface UserMemberRepository {


//  유저 회원 가입
    Boolean saveUser(UserMemberVo userMemberVo);
    
//  유저 정보 열람
    List<UserMemberVo> selectMyInfo(int u_no);
UserMemberVo selectUser(String u_id, String u_name, String u_mail){
userMemberVos =  selectUser(u_id, u_name, u_mail);

}
    // 로그인

}
