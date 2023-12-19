package pj.third.se.vo.user;

import lombok.Getter;
import lombok.Setter;
import pj.third.se.vo.instructor.ClassInfoVo;

@Getter
@Setter
public class RegisterClassVo {

int rc_no;
int rc_cls_no;
int rc_u_no;
String rc_reg_time;
String rc_sub;
int rc_approval;
int checkDuplicate;
UserMemberVo userMemberVo;
ClassInfoVo classInfoVo;

}
