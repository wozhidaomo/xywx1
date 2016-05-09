package xywx.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;

import xywx.dao.Coach;
import xywx.service.CoachService;

@Controller
@RequestMapping("coach")
public class CoachController {
	
	@Autowired
	CoachService service;
	@RequestMapping("list")
	public String c1(Map<String, Object> map,@RequestParam(value="pageNo",defaultValue="1")String pageNo,Coach coach,@RequestParam(value="pagenum",defaultValue="10")String pagenum){
		Map<String, Object> maps=service.list(pageNo, coach,pagenum);
		Page page=(Page)maps.get("page");
		map.put("pagenum", pagenum);
		map.put("coach", coach);
		map.put("coachs",page.getResult());
		map.put("totalPage", page.getTotal());
		map.put("currentPage", page.getPageNum());
		return "/coach/coachList";
	}
	
	@RequestMapping("editCoach")
	public String c2(String id,Map<String, Object> map){
		
		Map<String, Object> cmap=service.selectForEdit(id);
		map.put("coach", cmap.get("coach"));
		map.put("attachment", cmap.get("attachment"));
		return "/coach/editCoach";
	}
	
	@ResponseBody
	@RequestMapping("saveFaceImg")
	public String c3(MultipartFile faceImg,HttpServletRequest request){
		String path= request.getServletContext().getRealPath("/");
		String name=service.saveImg(faceImg,path,true);
		return name;
	}
	
	@RequestMapping("saveEdit")
	public String c4(MultipartFile faceImg,HttpServletRequest request,Coach coach){
		String path= request.getServletContext().getRealPath("/");
		service.saveEdit(coach, faceImg, path);
		return "redirect:list";
	}
	
	@RequestMapping("createCoach")
	public String c5(){
		
		return "/coach/createCoach";
	}
	
	@RequestMapping("saveCreate")
	public String c6(MultipartFile faceImg,HttpServletRequest request,Coach coach){
		String path= request.getServletContext().getRealPath("/");
		service.saveCoach(coach, faceImg, path);
		return "redirect:list";
	}
	
	@ResponseBody
	@RequestMapping("disableCoach")
	public String c7(String id){
		String result=service.disableCoach(id);
		return result;
	}
	
	@RequestMapping("deleteCoach")
	public String c8(String id){
		service.deleteCoach(id);
		return "redirect:list";
	}
	

}
