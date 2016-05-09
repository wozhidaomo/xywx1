package xywx.controller;

import java.sql.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xywx.service.TestService;

@Controller
@RequestMapping("test")
public class TestController {

	@Autowired
	TestService testservice;
	@RequestMapping("customerTestDetail")
	public String customerTestDetail(String cusname,String testid,String testtime,String score,Map<String, Object> map ){
		map.put("cusname", cusname);
		map.put("testtime", testtime);
		map.put("score", score);
		map.put("testdetails", testservice.testDetail(testid));
		return "/test/testList";
	}
}
