package pj.third.se.service.insturctor;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.repository.instructor.InstructorClassRepository;
import pj.third.se.vo.instructor.ClassInfoVo;

import java.util.List;

@Service
public class InstructorClassService {

    @Autowired
    InstructorClassRepository instructorClassRepository;

    public int createClassInfo(ClassInfoVo classInfoVo) {
        return instructorClassRepository.saveClassInfo(classInfoVo);
    }

    public List<ClassInfoVo> listMyClass(int cls_t_no) {
return instructorClassRepository.listMyClass(cls_t_no);
    }
}
