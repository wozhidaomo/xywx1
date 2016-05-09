package xywx.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.Page;

import xywx.dao.Customer;

public interface CustomerDao {

	Page selectCustomers(Customer customer);//查询所有cstomer
	
	Customer selChooseCustomer(@Param("id")String id);//根据id查询具体用户
}
