package xywx.mapping;

import java.util.List;

import xywx.dao.Topicoption;

public interface TopicoptionDao {

	
	public List<Topicoption> selectTopicOptionByQid(String qid);
	
	public void updateTopicOption(Topicoption topicoption);
	
	public void insertTopicOption(Topicoption topicoption);
	
	public void deleteTopicoption(String id);
	
}
