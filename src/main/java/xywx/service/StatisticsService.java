package xywx.service;

import com.github.pagehelper.Page;

import xywx.dao.Statistics;

public interface StatisticsService {

	 Page statistics(String pageNo,Statistics statistics,String pagenum);
}
