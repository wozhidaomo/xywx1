package xywx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import xywx.dao.Statistics;
import xywx.mapping.StatisticsDao;
import xywx.service.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	StatisticsDao dao;
	@Override
	public Page statistics(String pageNo,Statistics statistics,String pagenum) {
		PageHelper.startPage(Integer.parseInt(pageNo),Integer.parseInt(pagenum));
		Page page=dao.selectStatistics(statistics);
		return page;
	}
	
	

}
