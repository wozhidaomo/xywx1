package xywx.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.Page;

import xywx.dao.Test;

public interface TestDao {
	
	Page selectTestByid(@Param("id")String id);//根据id查询有关测试

}
