package xywx.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;

import xywx.dao.Customer;
import xywx.dao.Test;
import xywx.service.CustomerService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	CustomerService service;
	@RequestMapping("list")
	public String c1(Map<String, Object> map,@RequestParam(value="pageNo",defaultValue="1")String pageNo,Customer customer,@RequestParam(value="pagenum",defaultValue="10")String pagenum){
		Page page=service.selectCustomers(pageNo,customer,pagenum);
		
		map.put("pagenum", pagenum);
		map.put("customer", customer);
		map.put("totalPage", page.getTotal());
		map.put("currentPage", page.getPageNum());
		map.put("customers", (List<Customer>)page.getResult());
		return "/customer/customerList";
	}
	
	@RequestMapping("detail")
	public String c2(String id,@RequestParam(value="pageNo",defaultValue="1")String pageNo,Map<String, Object> map,@RequestParam(value="pagenum",defaultValue="10")String pagenum){
		Map<String, Object> details=service.customerDetail(id,pageNo,pagenum);
		map.put("id", id);
		map.put("pagenum", details.get("pagenum"));
		map.put("customer", details.get("customer"));
		map.put("attachment", details.get("attachment"));
		map.put("tests", (List<Test>)details.get("tests"));
		map.put("totalPage", details.get("totalPage"));
		map.put("currentPage", details.get("currentPage"));
		return "/customer/customerDetail";
	}

}
