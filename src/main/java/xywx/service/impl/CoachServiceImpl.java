package xywx.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import xywx.dao.Attachment;
import xywx.dao.Coach;
import xywx.mapping.AttachmentDao;
import xywx.mapping.CoachDao;
import xywx.service.CoachService;

@Service
public class CoachServiceImpl implements CoachService {

	@Autowired
	CoachDao coachdao;
	@Autowired
	AttachmentDao attachmentdao;
	@Override
	public Map<String, Object> list(String pageNo,Coach coach,String pagenum) {
		Map<String, Object> map=new HashMap<>(10);
		try {
			PageHelper.startPage(Integer.parseInt(pageNo),Integer.parseInt(pagenum));
			Page page=coachdao.selectAll(coach);
			map.put("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	@Override
	public Map<String, Object> selectForEdit(String id) {
		Coach coach = new Coach();
		Map<String, Object> maps=new HashMap<>();
		try {
			 coach=coachdao.selectById(id);
			 Attachment attachment=attachmentdao.selAttachment(id,"coach");
			 maps.put("coach", coach);
			 maps.put("attachment", attachment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maps;
	}
	
	
	/**
	 * 淇濆瓨鍥剧墖锛宼emp鏂囦欢澶圭敤浜庡瓨鏀惧ご鍍忛瑙堟枃浠�
	 */
	@Override
	public String saveImg(MultipartFile file,String path,Boolean isTemp) {
		String filename="";
		try {
			 filename=String.valueOf(System.currentTimeMillis())+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."), file.getOriginalFilename().length());
			if (isTemp) {
				path+="attachment/temp/"+filename;
			}else {
				path+="attachment/"+filename;

			}
			 
			File fileto=new File(path);
			file.transferTo(fileto);
		} catch (Exception e) {
			filename="error";
			e.printStackTrace();
		}
		
		return filename;
	}
	
	@Override
	public String saveEdit(Coach coach, MultipartFile file, String path) {
		String result="ok";
		Attachment attachment=new Attachment();
		try {
			if (file.getSize()!=0) {
				String filename= saveImg(file, path, false);
				attachment.setLocation(filename);
				attachment.setLocalName(file.getOriginalFilename());
				attachment.setPid(coach.getId().toString());
				attachment.setEffect("coach");
				Attachment a= attachmentdao.selAttachment(coach.getId().toString(), "coach");
				if (a!=null) {
					attachmentdao.updateAttchment(attachment);//淇敼鏂囦欢淇℃伅
				}else {
					attachmentdao.insertAttachment(attachment);//鏂板鏂囦欢鏁版嵁
				}
			}
			coach.setOptime(new Date());
			coachdao.updateCoach(coach);//淇敼coach鏁版嵁
		} catch (Exception e) {
			result="error";
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public String saveCoach(Coach coach,MultipartFile file,String path) {
		// TODO Auto-generated method stub
		try {
			coach.setState("0");
			coach.setOptime(new Date());
			coachdao.insertCoach(coach);
			if (file.getSize()!=0) {
				String filename= saveImg(file, path, false);
				Attachment attachment=new Attachment();
				attachment.setPid(coach.getId().toString());
				attachment.setType("img");
				attachment.setLocation(filename);
				attachment.setEffect("coach");
				attachment.setLocalName(file.getOriginalFilename());
				attachmentdao.insertAttachment(attachment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ok";
	}
	
	
	@Override
	public String disableCoach(String id) {
		String result="success";
		try {
			coachdao.disableCoach(id);
			
		} catch (Exception e) {
			result="fail";
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public void deleteCoach(String id) {
		try {
			coachdao.deleteCoach(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
