package pj.third.se.repository;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.Vo.UserMemberVo;

@Mapper
public interface UserMemberRepository {

    Boolean saveUser(UserMemberVo userMemberVo);
}
