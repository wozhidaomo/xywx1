package xywx.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;

import xywx.dao.Customer;
import xywx.dao.Statistics;
import xywx.service.StatisticsService;

@Controller
@RequestMapping("statistics")
public class StatisticsController {

	@Autowired
	StatisticsService service;
	@RequestMapping("list")
	public String s1(Map<String, Object> map,@RequestParam(value="pageNo",defaultValue="1")String pageNo,Statistics statistics,String statisticName,@RequestParam(value="pagenum",defaultValue="10")String pagenum){
		System.out.println("---------------------------------------------------------"+statisticName);
		statistics.setName(statisticName);
		Page page=service.statistics(pageNo,statistics,pagenum);
		map.put("pagenum", pagenum);
		map.put("statistic", statistics);
		map.put("statistics",page.getResult());
		map.put("totalPage", page.getTotal());
		map.put("currentPage", page.getPageNum());
		return "/statistics/statisticList";
	}
}
