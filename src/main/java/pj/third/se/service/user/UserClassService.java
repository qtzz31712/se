package pj.third.se.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.repository.user.UserClassRepository;
import pj.third.se.vo.instructor.ClassInfoVo;

import java.util.List;

@Service
public class UserClassService {

    @Autowired
    UserClassRepository userClassRepository;

    public List<ClassInfoVo> listUpAllClass() {
        return userClassRepository.listUpAllClass();
    }

}
