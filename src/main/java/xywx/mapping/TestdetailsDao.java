package xywx.mapping;

import java.util.List;


import xywx.dao.Testdetails;

public interface TestdetailsDao {

	public List<Testdetails> selectTestDetails(String testid);
}
