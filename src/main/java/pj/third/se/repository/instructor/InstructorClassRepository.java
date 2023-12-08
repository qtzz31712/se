package pj.third.se.repository.instructor;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.vo.instructor.ClassInfoVo;

import java.util.List;

@Mapper
public interface InstructorClassRepository {

    int saveClassInfo(ClassInfoVo classInfoVo);

    List<ClassInfoVo>listMyClass(int cls_t_no);

}
