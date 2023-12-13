package pj.third.se.service.insturctor;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.repository.instructor.InstructorClassRepository;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

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


    public ClassInfoVo classInfoDetail(int cls_no) {
        return instructorClassRepository.classInfoDetail(cls_no);
    }

    public int modifyClassConfirm(ClassInfoVo classInfoVo) {
    return instructorClassRepository.modifyClassConfirm(classInfoVo);
    }

    public void toggleApproval(int cls_no, int cls_approval) {
        instructorClassRepository.toggleApproval(cls_no, cls_approval);
    }

    public List<RegisterClassVo> listUpHopeUser(int t_no) {
        return instructorClassRepository.listUpHopeUser(t_no);
    }

    public RegisterClassVo selectHopeUser(int rc_no) {
    return instructorClassRepository.selectHopeUser(rc_no);
    }
}