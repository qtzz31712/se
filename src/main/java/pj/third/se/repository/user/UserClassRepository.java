package pj.third.se.repository.user;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.vo.instructor.ClassInfoVo;

import java.util.List;

@Mapper
public interface UserClassRepository {

   List<ClassInfoVo> listUpAllClass();
}
