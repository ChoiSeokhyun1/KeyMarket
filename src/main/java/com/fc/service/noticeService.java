package com.fc.service;

import com.fc.dto.notice_TableDto;

import java.util.List;

public interface noticeService {
    List<notice_TableDto> getNoticeList(int page);
    
    public int notice_insert(notice_TableDto notice_tableDto);
    
    public int notice_update(notice_TableDto notice_tableDto);
    
    public int notice_delete(notice_TableDto notice_tableDto);
    
    notice_TableDto foundNoticeService(notice_TableDto notice_tableDto);
    
    notice_TableDto foundNoticeService2(int noticeboardNo);
    
}