package xywx.service;

import java.util.Map;

import com.github.pagehelper.Page;

import xywx.dao.Customer;

public interface CustomerService {

	
	public Page selectCustomers(String pageNo,Customer customer,String pagenum);
	
	public Map<String,Object> customerDetail(String id,String pageNo,String pagenum);
}
