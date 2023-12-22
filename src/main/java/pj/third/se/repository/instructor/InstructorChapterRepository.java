package pj.third.se.repository.instructor;

import org.apache.ibatis.annotations.Mapper;
import pj.third.se.vo.instructor.ChapterVo;
import java.util.List;

@Mapper
public interface InstructorChapterRepository {
    int saveChapter(ChapterVo chapterVo);

    int getChapterNumber(int cls_no);

    List<ChapterVo> listUpChapter(int chap_cls_no);

    int checkDuplicateChapter(ChapterVo chapterVo);

    ChapterVo selectChapter(int chap_no);

    int deleteChapter(int chap_no);

    int modifyChapter(ChapterVo chapterVo);
}
