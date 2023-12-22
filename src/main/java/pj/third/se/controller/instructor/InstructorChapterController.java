package pj.third.se.controller.instructor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pj.third.se.service.insturctor.InstructorChapterService;
import pj.third.se.vo.instructor.ChapterVo;

import java.util.List;


@Slf4j
@Controller
@RequestMapping("/instructor/chapter")
public class InstructorChapterController {

    @Autowired
    InstructorChapterService instructorChapterService;

    @GetMapping("/registerChapterForm")
    public String registerChapterForm(@RequestParam("cls_no") int cls_no, @ModelAttribute("message") String message, Model model) {
        model.addAttribute("cls_no", cls_no);
        int chapNumbers = instructorChapterService.getChapterNumbers(cls_no);
        log.info("chapNumber -->{}", chapNumbers);
        model.addAttribute("chapNumbers", chapNumbers);
        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }
        return "instructor/chapter/register_chapter_form";
    }

    @PostMapping("/registerChapterConfirm")
    public String registerChapterConfirm(ChapterVo chapterVo, RedirectAttributes redirectAttributes) {
        int result;
        String nextPage;
        int checkDuplicateChapter;
        checkDuplicateChapter = instructorChapterService.checkDuplicateChapter(chapterVo);
        if (checkDuplicateChapter == 0) {
            result = instructorChapterService.saveChapter(chapterVo);
            if (result == 1) {
                redirectAttributes.addFlashAttribute("message", "수업 등록에 성공하였습니다");
                nextPage = "redirect:/instructor/chapter/allChapter?cls_no=" + chapterVo.getChap_cls_no();
            } else {
                redirectAttributes.addFlashAttribute("message", "수업등록에 실패하였습니다.");
                nextPage = "redirect:/instructor/chapter/registerChapterForm?cls_no=" + chapterVo.getChap_cls_no();
            }
        } else {
            redirectAttributes.addFlashAttribute("message", "이미 등록된 회차입니다");
            nextPage = "redirect:/instructor/chapter/registerChapterForm?cls_no=" + chapterVo.getChap_cls_no();
        }
        return nextPage;
    }

    @RequestMapping(value = "/allChapter", method = {RequestMethod.GET, RequestMethod.POST})
    public String ChapterList(@RequestParam("cls_no") int cls_no, Model model, @ModelAttribute("message") String message) {
        model.addAttribute("cls_no", cls_no);
        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }
        return "instructor/chapter/chapter_list_form";
    }

    @GetMapping("/listUpChapter/{chap_cls_no}")
    public String listUpChapter(@PathVariable("chap_cls_no") int chap_cls_no, Model model) {
        List<ChapterVo> chapterVos = instructorChapterService.listUpChapter(chap_cls_no);
        if (chapterVos != null) {
            model.addAttribute("chapterVos", chapterVos);
        } else {
            model.addAttribute("message", "해당 수업을 찾을수 없습니다");
        }
        return "instructor/chapter/chapter_list";
    }

    @GetMapping("/chapterDetail")
    public String chapterDetail(@RequestParam("chap_no") int chap_no, Model model) {
        ChapterVo chapterVos = instructorChapterService.selectChapter(chap_no);
        if (chapterVos != null) {
            model.addAttribute("chapterVos", chapterVos);
        } else {
            model.addAttribute("message", "수업을 불러올수 없습니다.");
        }
        return "instructor/chapter/chapter_detail";
    }

    @GetMapping("/modifyChapterForm")
    public String modifyChapterForm(@RequestParam("chap_no") int chap_no, Model model, @ModelAttribute("message") String message) {
        ChapterVo chapterVos = instructorChapterService.selectChapter(chap_no);
        int chapNumbers = instructorChapterService.getChapterNumbers(chapterVos.getChap_cls_no());
        log.info("chapNumber -->{}", chapNumbers);
        model.addAttribute("chapNumbers", chapNumbers);
        model.addAttribute("chapterVos", chapterVos);
        if (message != null && !message.isEmpty()) {
            model.addAttribute("message", message);
        }
        return "instructor/chapter/modify_chapter_form";
    }

    @PostMapping("/modifyChapterConfirm")
    public String modifyChapterConfirm(ChapterVo chapterVo, RedirectAttributes redirectAttributes) {
        int result;
        result = instructorChapterService.modifyChapter(chapterVo);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수업 수정을 완료하였습니다.");
            return "redirect:/instructor/chapter/allChapter?cls_no=" + chapterVo.getChap_cls_no();
        } else {
            redirectAttributes.addFlashAttribute("message", "수업 수정에 실패하였습니다.");
            return "redirect:/instructor/chapter/modifyChapterForm?chap_no=" + chapterVo.getChap_no();
        }
    }

    @GetMapping("/deleteChapter")
    public String deleteChapterConfirm(@RequestParam("chap_no") int chap_no, RedirectAttributes redirectAttributes) {
        int result;
   int cls_no;
        ChapterVo chapterVo= instructorChapterService.selectChapter(chap_no);
        cls_no = chapterVo.getChap_cls_no();
        result = instructorChapterService.deleteChapter(chap_no);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수업을 삭제하였습니다");
            return "redirect:/instructor/chapter/allChapter?cls_no="+cls_no;
        } else {
            redirectAttributes.addFlashAttribute("message", "수업 삭제에 실패하였습니다.");
            return "redirect:/instructor/chapter/modifyChapterForm?chap_no="+chap_no;
        }


    }


}
