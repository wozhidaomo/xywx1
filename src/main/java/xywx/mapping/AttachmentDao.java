package xywx.mapping;

import org.apache.ibatis.annotations.Param;

import xywx.dao.Attachment;

public interface AttachmentDao {

	Attachment selAttachment(@Param("id")String id,@Param("effect")String effect);
	
	void insertAttachment(Attachment attachment);
	
	void updateAttchment(Attachment attachment);
}
