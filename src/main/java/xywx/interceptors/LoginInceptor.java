package xywx.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String username =  (String)request.getSession().getAttribute("username");   
        if(username == null){  
        	request.getSession().invalidate();
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);  
            return false;  
        }else  
            return true;   
	}
}
