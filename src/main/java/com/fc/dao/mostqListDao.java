package com.fc.dao;

import com.fc.dto.member_TableDto;
import com.fc.dto.notice_TableDto;
import com.fc.dto.qqq_TableDto;

import java.util.List;

public interface mostqListDao {
	
	List<qqq_TableDto> selectMostqList();
	
	public int insertMostq(qqq_TableDto qqq_tableDto);
//	
	public int updateMostQ(qqq_TableDto qqq_tableDto);
//	
	public int deleteMostQ(qqq_TableDto qqq_tableDto);
//	
	qqq_TableDto foundMostQService(qqq_TableDto qqq_tableDto);
	
	qqq_TableDto foundMostQService(int mostqboardNo);
//	
//	notice_TableDto foundNoticeService2(int noticeboardNo);
}
