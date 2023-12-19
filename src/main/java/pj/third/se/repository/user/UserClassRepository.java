package pj.third.se.repository.user;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

import java.util.List;

@Mapper
public interface UserClassRepository {

   List<ClassInfoVo> listUpAllClass();

    ClassInfoVo classInfoDetail(int cls_no);

    int saveRegisterClass(RegisterClassVo registerClassVo);

    List<RegisterClassVo> listUpRegisterClass(int u_no);

    int checkDuplicate(int cls_no, int u_no);

    int deleteRegisterClass(int rc_no);
}
