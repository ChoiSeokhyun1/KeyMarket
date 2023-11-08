package com.fc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.service.noticeService;
import com.fc.dao.noticeListDao;
import com.fc.dto.notice_TableDto;

import java.util.List;

@Service
public class noticeServiceImpl implements noticeService {
    
    @Autowired
    private noticeListDao noticeListDao;

    @Override
    public List<notice_TableDto> getNoticeList(int page) {
        return noticeListDao.selectNoticeList(page);
    }

	@Override
	public int notice_insert(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		return noticeListDao.insertNotice(notice_tableDto);
	}
	
	@Override
	public int notice_update(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		return noticeListDao.updateNotice(notice_tableDto);
	}
	
	@Override
	public int notice_delete(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		return noticeListDao.deleteNotice(notice_tableDto);
	}

	@Override
	public notice_TableDto foundNoticeService(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		return noticeListDao.foundNoticeService(notice_tableDto);
	}
	
	@Override
	public notice_TableDto foundNoticeService2(int noticeboardNo) {
		// TODO Auto-generated method stub
		return noticeListDao.foundNoticeService2(noticeboardNo);
	}


}