package pj.third.se.vo.instructor;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChapterVo {

    int chap_no;
    int chap_cls_no;
    int chap_num;
    String chap_title;
    String chap_sub;
    String chap_reference;
    String chap_textbook;
    String chap_file;
    String chap_reg_date;
    String chap_mod_date;
    ClassInfoVo classInfoVo;

}
