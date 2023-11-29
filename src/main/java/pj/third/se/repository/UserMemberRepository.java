package pj.third.se.repository;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.Vo.UserMemberVo;
import java.util.List;

@Mapper
public interface UserMemberRepository {


    //  유저 회원 가입
    boolean saveUser(UserMemberVo userMemberVo);

  

    // 로그인
    UserMemberVo selectUser(UserMemberVo userMemberVo);

    //  유저 정보 열람
    List<UserMemberVo> selectMyInfo(int u_no);
    
    // 유저 정보 수정
    int updateUser(UserMemberVo userMemberVo);

    int deleteUser(int u_no);
}
