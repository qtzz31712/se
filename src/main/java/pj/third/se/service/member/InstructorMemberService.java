package pj.third.se.service.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.Vo.member.InstructorMemberVo;
import pj.third.se.repository.member.InstructorMemberRepository;

@Slf4j
@Service
public class InstructorMemberService {
    @Autowired
    InstructorMemberRepository instructorMemberRepository;

    public boolean createAccountConfirm(InstructorMemberVo instructorMemberVo) {
        return instructorMemberRepository.saveInstructor(instructorMemberVo);
    }

    public InstructorMemberVo loginConfirm(InstructorMemberVo instructorMemberVo) {
        return instructorMemberRepository.selectInstructor(instructorMemberVo);
    }

    public InstructorMemberVo myInfo(int t_no) {
    return instructorMemberRepository.selectMyInfo(t_no);
    }

    public int modifyInstructorMember(InstructorMemberVo instructorMemberVo) {
    return instructorMemberRepository.updateInstructor(instructorMemberVo);
    }

    public int deleteInstructorMember(int t_no) {

        return instructorMemberRepository.deleteInstructor(t_no);
    }


}
