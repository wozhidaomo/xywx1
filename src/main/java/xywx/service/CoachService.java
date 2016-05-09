package xywx.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import xywx.dao.Coach;

public interface CoachService {

	Map<String, Object> list(String pageNo,Coach coach,String pagenum);
	
	Map<String, Object> selectForEdit(String id);
	
	String saveImg(MultipartFile file,String path,Boolean isTemp);
	
	String saveCoach(Coach coach,MultipartFile file,String path);
	
	String saveEdit(Coach coach,MultipartFile file,String path);
	
	String disableCoach(String id);
	
	void deleteCoach(String id);
}
