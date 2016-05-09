package xywx.mapping;

import com.github.pagehelper.Page;

import xywx.dao.Coach;

public interface CoachDao {

	
	public Page selectAll(Coach coach);
	
	public Coach selectById(String id);
	
	public void insertCoach(Coach coach);
	
	public void updateCoach(Coach coach);
	
	public void disableCoach(String id);
	
	public void deleteCoach(String id);
}
