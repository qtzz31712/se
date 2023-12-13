package pj.third.se.repository.instructor;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

import java.util.List;

@Mapper
public interface InstructorClassRepository {

    int saveClassInfo(ClassInfoVo classInfoVo);

    List<ClassInfoVo>listMyClass(int cls_t_no);

    ClassInfoVo classInfoDetail(int cls_no);

    int modifyClassConfirm(ClassInfoVo classInfoVo);

    void toggleApproval(int cls_no, int cls_approval);

    List<RegisterClassVo> listUpHopeUser(int t_no);

    RegisterClassVo selectHopeUser(int rc_no);
}
