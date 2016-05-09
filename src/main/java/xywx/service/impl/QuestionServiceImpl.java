package xywx.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import xywx.dao.Question;
import xywx.dao.Topicoption;
import xywx.dao.saveQuestionParam;
import xywx.mapping.QuestionDao;
import xywx.mapping.TopicoptionDao;
import xywx.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questiondao;
	@Autowired
	TopicoptionDao topicOptiondao;
	@Override
	public Map<String, Object> questionList(String pageNo,Question question,String pagenum) {
		Map<String, Object> map=new HashMap<>();
		PageHelper.startPage(Integer.parseInt(pageNo),Integer.parseInt(pagenum));
		Page page=questiondao.selectQuestions(question);
		map.put("page", page);
		return map;
	}
	
	@Override
	public Map<String, Object> editInto(String id) {
		Map<String, Object> map=new HashMap<>();
		try {
		Question question=questiondao.selectQuestionById(id);
		List<Topicoption> topicOptions=topicOptiondao.selectTopicOptionByQid(id);
		if (topicOptions.get(0).getOptionvalue()>=topicOptions.get(1).getOptionvalue()) {
			Topicoption t=new Topicoption();
			t=topicOptions.get(0);
			topicOptions.set(0, topicOptions.get(1));
			topicOptions.set(1, t);
		}
		map.put("question", question);
		map.put("topicOptions", topicOptions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@Override
	public Map<String, Object> saveEdit(saveQuestionParam param) {
		//淇敼question銆佷慨鏀箃opicOption
		try {
			param.getQuestion().setOptime(new Date());
			questiondao.updateQuestion(param.getQuestion());
			for (Topicoption t : param.getTopicoptions()) {
				topicOptiondao.updateTopicOption(t);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 杩斿洖鏄惁鎴愬姛0涓烘垚鍔燂紝1涓哄け璐�
	 * 
	 */
	@Override
	public int disableQuestion(Question question) {
		int result=0;
		try {
			questiondao.updateQuestionState(question);
		} catch (Exception e) {
			e.printStackTrace();
			result=1;
		}
		
		return result;
	}
	
	@Override
	public void saveCreate(saveQuestionParam param) {
		Question question=param.getQuestion();
		question.setOptime(new Date());
		List<Topicoption> topicoptions=param.getTopicoptions();
		try {
			
			questiondao.insertQuestion(question);
			for (Topicoption topicoption : topicoptions) {
				topicoption.setQid(question.getId());
				topicOptiondao.insertTopicOption(topicoption);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteQuestion(String id) {
		try {
			questiondao.deleteQuestion(id);
			topicOptiondao.deleteTopicoption(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
