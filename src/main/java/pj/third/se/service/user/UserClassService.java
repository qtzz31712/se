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

    public void registerClassConfirm(RegisterClassVo registerClassVo) {
        userClassRepository.saveRegisterClass(registerClassVo);
    }

    public List<RegisterClassVo> listUpRegisterClass(int u_no) {
        return userClassRepository.listUpRegisterClass(u_no);
    }
}
