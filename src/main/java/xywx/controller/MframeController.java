package xywx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import xywx.dao.Coach;
import xywx.dao.User;
import xywx.mapping.CoachDao;
import xywx.service.UserService;



@Controller
@RequestMapping("MController")
public class MframeController {
	
	@Autowired
	UserService service;
	@RequestMapping("basePage")
	public String t1(){
//		Coach coach=coachDao.selectAll();
//		System.out.println("name:"+coach.getName());
		return "/login";
	}
	
	@RequestMapping("menuframe")
	public String t4(){
		
		return "/menuFrame";
	}
	
	
	@RequestMapping("login")
	public String t3(ModelMap map,User user,HttpServletRequest request, HttpServletResponse response){
		boolean result=service.login(user,request,response);
		if (result) {
			return "redirect:menuframe";
		}
		return "redirect:basePage";
	}
	
	@RequestMapping("updatepassword")
	public String t5(ModelMap map,String message){
		
		map.addAttribute("message",message);
		return "/updatePassword";
	}
	
	@RequestMapping("editpassword")
	public String t7(String oldPass,String newPass,String newPassConfirm,RedirectAttributes attr){
		boolean result=service.updatePassword(oldPass, newPass, newPassConfirm);
		if (result) {
			attr.addAttribute("message","修改密码成功！");
			
		}else{
		attr.addAttribute("message","你输入的旧密码不正确，修改密码失败！");
		}
		return "redirect:updatepassword";
	}
	
	
	
	@RequestMapping("logout")
	public String t6(){
		
		return "redirect:basePage";
	}
	
	

}
