package xywx.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import xywx.dao.Attachment;
import xywx.dao.Customer;
import xywx.dao.Test;
import xywx.mapping.AttachmentDao;
import xywx.mapping.CustomerDao;
import xywx.mapping.TestDao;
import xywx.service.CustomerService;
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao customerdao;
	@Autowired
	AttachmentDao attachmentdao;
	@Autowired
	TestDao testdao;
	@Override
	public Page selectCustomers(String pageNo,Customer customer,String pagenum) {
		PageHelper.startPage(Integer.parseInt(pageNo),Integer.parseInt(pagenum));
		return customerdao.selectCustomers(customer);
	}
	
	@Override
	public Map<String,Object> customerDetail(String id,String pageNo,String pagenum) {
		Map<String,Object> details=new HashMap<String,Object>();
		try {
			Customer customer=customerdao.selChooseCustomer(id);
			Attachment attachment=attachmentdao.selAttachment(id,"customer");
			PageHelper.startPage(Integer.parseInt(pageNo),Integer.parseInt(pagenum));
			Page testsPage=testdao.selectTestByid(id);
			details.put("customer",customer);
			details.put("attachment",attachment);
			details.put("tests",(List<Test>)testsPage.getResult());
			details.put("totalPage",testsPage.getTotal());
			details.put("currentPage",testsPage.getPageNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return details;
	}

}
