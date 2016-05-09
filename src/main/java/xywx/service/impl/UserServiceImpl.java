package xywx.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xywx.dao.User;
import xywx.mapping.UserDao;
import xywx.service.UserService;
import xywx.util.loginUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userdao;
	@Override
	public boolean login(User user,HttpServletRequest request, HttpServletResponse response) {
		boolean result=false;
		try {
			user.setPassword(new loginUtil().getDigestOfString(user.getPassword().getBytes())); //先计算sha1加密后的密码然后进行匹配
			User loguser= userdao.selectByNameAndPassWord(user);
			if (loguser!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("username", loguser.getName());
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public boolean updatePassword(String oldPass, String newPass, String newPassConfirm) {
		boolean result=false;
		try {
			
			User user=new User();
			user.setLoginname("admin");
			user.setPassword(new loginUtil().getDigestOfString(oldPass.getBytes()));
			User loginuser=userdao.selectByNameAndPassWord(user);
			if (loginuser!=null) {
				loginuser.setPassword(new loginUtil().getDigestOfString(newPass.getBytes()));
				userdao.updateByid(loginuser);
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
