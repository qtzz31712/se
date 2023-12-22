package pj.third.se.service.insturctor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pj.third.se.repository.instructor.InstructorChapterRepository;
import pj.third.se.vo.instructor.ChapterVo;

import java.util.List;

@Service
public class InstructorChapterService {

    @Autowired
    InstructorChapterRepository instructorChapterRepository;
    public int saveChapter(ChapterVo chapterVo) {
        return instructorChapterRepository.saveChapter(chapterVo);
    }

    public int getChapterNumbers(int cls_no) {
        return instructorChapterRepository.getChapterNumber(cls_no);
    }

    public List<ChapterVo> listUpChapter(int chap_cls_no) {
        return instructorChapterRepository.listUpChapter(chap_cls_no);
    }

    public int checkDuplicateChapter(ChapterVo chapterVo) {
        return instructorChapterRepository.checkDuplicateChapter(chapterVo);
    }

    public ChapterVo selectChapter(int chap_no) {
    return instructorChapterRepository.selectChapter(chap_no);
    }

    public int deleteChapter(int chap_no) {
        return instructorChapterRepository.deleteChapter(chap_no);
    }

    public int modifyChapter(ChapterVo chapterVo) {
        return instructorChapterRepository.modifyChapter(chapterVo);
    }
}
