package com.fc.dao;

import com.fc.dto.member_TableDto;
import com.fc.dto.notice_TableDto;

import java.util.List;

public interface noticeListDao {
	
	List<notice_TableDto> selectNoticeList(int page);
	
	public int insertNotice(notice_TableDto notice_tableDto);
	
	public int updateNotice(notice_TableDto notice_tableDto);
	
	public int deleteNotice(notice_TableDto notice_tableDto);
	
	notice_TableDto foundNoticeService(notice_TableDto notice_tableDto);
	
	notice_TableDto foundNoticeService2(int noticeboardNo);
}
