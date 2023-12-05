package pj.third.se.repository.instructor;
import org.apache.ibatis.annotations.Mapper;
import pj.third.se.vo.instructor.InstructorMemberVo;


@Mapper
public interface InstructorMemberRepository {


    //  유저 회원 가입
    boolean saveInstructor(InstructorMemberVo instructorMemberVo);

    // 로그인
    InstructorMemberVo selectInstructor(InstructorMemberVo instructorMemberVo);

    //  유저 정보 열람
    InstructorMemberVo selectMyInfo(int t_no);

    // 유저 정보 수정
    int updateInstructor(InstructorMemberVo instructorMemberVo);

    //회원 탈퇴
    int deleteInstructor(int t_no);
}
