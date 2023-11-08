package com.fc.service;

import com.fc.dto.notice_TableDto;
import com.fc.dto.qqq_TableDto;

import java.util.List;

public interface mostqService {
      List<qqq_TableDto> getMostqList();
    
      public int mostq_insert(qqq_TableDto qqq_tableDto);
//    
      public int mostq_update(qqq_TableDto qqq_tableDto);
//    
      public int mostq_delete(qqq_TableDto qqq_tableDto);
//    
      qqq_TableDto foundMostQService(qqq_TableDto qqq_tableDto);
      
      qqq_TableDto foundMostQService(int mostqboardNo);
//    
//    notice_TableDto foundNoticeService2(int noticeboardNo);
    
}