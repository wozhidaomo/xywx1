package xywx.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xywx.dao.User;

public interface UserService {

	public boolean login(User user,HttpServletRequest request, HttpServletResponse response);
	
	public boolean updatePassword(String oldPass,String newPass,String newPassConfirm);
}
