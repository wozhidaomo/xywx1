package xywx.mapping;

import xywx.dao.User;

public interface UserDao {

	
	User selectByNameAndPassWord(User user);
	
	void updateByid(User user);
}
