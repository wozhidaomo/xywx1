package xywx.mapping;

import com.github.pagehelper.Page;

import xywx.dao.Statistics;

public interface StatisticsDao {

	Page selectStatistics(Statistics statistics);
}
