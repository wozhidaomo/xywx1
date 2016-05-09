package xywx.service;

import java.util.Map;

import xywx.dao.Question;
import xywx.dao.Topicoption;
import xywx.dao.saveQuestionParam;

public interface QuestionService {

	public Map<String, Object> questionList(String pageNo,Question question,String pagenum);
	
	public Map<String,Object> editInto(String id);
	
	public Map<String,Object> saveEdit(saveQuestionParam param);
	
	public int disableQuestion(Question question);
	
	public void saveCreate(saveQuestionParam param);
	
	public void deleteQuestion(String id);
}
