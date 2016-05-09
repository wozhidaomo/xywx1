package xywx.mapping;

import com.github.pagehelper.Page;

import xywx.dao.Question;

public interface QuestionDao {

	public Page selectQuestions(Question question);
	
	public Question selectQuestionById(String id);
	
	public void updateQuestion(Question question);
	
	public void updateQuestionState(Question question);
	
	public void insertQuestion(Question question);
	
	public void deleteQuestion(String id);
}
