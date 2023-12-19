package pj.third.se.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.repository.user.UserClassRepository;
import pj.third.se.vo.instructor.ClassInfoVo;
import pj.third.se.vo.user.RegisterClassVo;

import java.util.List;

@Service
public class UserClassService {


    @Autowired
    UserClassRepository userClassRepository;

    public List<ClassInfoVo> listUpAllClass() {
        return userClassRepository.listUpAllClass();
    }

    public ClassInfoVo classInfoDetail(int cls_no) {
    return userClassRepository.classInfoDetail(cls_no);
    }

    public int registerClassConfirm(RegisterClassVo registerClassVo) {
        return userClassRepository.saveRegisterClass(registerClassVo);
    }

    public List<RegisterClassVo> listUpRegisterClass(int u_no) {
        return userClassRepository.listUpRegisterClass(u_no);
    }

    public int checkDuplicate(int cls_no, int u_no) {
    return userClassRepository.checkDuplicate(cls_no,u_no);
    }

    public int deleteRegisterClass(int rc_no) {
        return userClassRepository.deleteRegisterClass(rc_no);
    }


}
