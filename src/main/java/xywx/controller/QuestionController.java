package xywx.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;

import xywx.dao.Question;
import xywx.dao.Topicoption;
import xywx.dao.saveQuestionParam;
import xywx.service.QuestionService;

@Controller
@RequestMapping("question")
public class QuestionController {
	@Autowired
	QuestionService service;
	@RequestMapping("manaQuestion")
	public String m1(Map<String, Object> map,@RequestParam(value="pageNo",defaultValue="1")String pageNo,Question question,@RequestParam(value="pagenum",defaultValue="10")String pagenum){
		Map<String, Object> qMap=service.questionList(pageNo,question,pagenum);
		Page page=((Page)qMap.get("page"));
		map.put("pagenum", pagenum);
		map.put("question", question);
		map.put("questions",page.getResult());
		map.put("totalPage", page.getTotal());
		map.put("currentPage", page.getPageNum());
		return "question/questionList";
	}
	
	@RequestMapping("editQuestion")
	public String m2(Map<String, Object> map,String pageNo,String questionid){
		//根据questionid查出question数据，再根据questionid查出具体topicoption数据
		Map<String, Object> dataMap= service.editInto(questionid);
		map.put("question", dataMap.get("question"));
		map.put("topicOptions", dataMap.get("topicOptions"));
		return "question/editQuestion";
	}
	
	@RequestMapping("saveEdit")
	public String m3(saveQuestionParam param){
		service.saveEdit(param);
		return "redirect:manaQuestion";
	}
	
	@ResponseBody
	@RequestMapping("disableQuestion")
	public String m4(String id){
		Question question=new Question();
		question.setId(Integer.valueOf(id));
		if (service.disableQuestion(question)==0) {
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("createQuestion")
	public String m5(){
		
		return "question/createQuestion";
	}
	
	@RequestMapping("saveCreate")
	public String m6(saveQuestionParam param){
		service.saveCreate(param);
		return "redirect:manaQuestion";
	}
	
	@RequestMapping("deleteQuestion")
	public String m7(String id){
		service.deleteQuestion(id);
		return "redirect:manaQuestion";
	}

}
