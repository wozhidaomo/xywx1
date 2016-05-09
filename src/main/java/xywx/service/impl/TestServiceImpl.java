package xywx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xywx.dao.Testdetails;
import xywx.mapping.TestdetailsDao;
import xywx.service.TestService;

@Service
public class TestServiceImpl implements TestService {
	@Autowired
	TestdetailsDao testdetailDao;
	@Override
	public List<Testdetails> testDetail(String testid ) {
		
		return testdetailDao.selectTestDetails(testid);
	}

}
