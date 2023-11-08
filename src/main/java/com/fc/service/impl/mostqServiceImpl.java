package com.fc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.service.mostqService;
import com.fc.service.noticeService;
import com.fc.dao.noticeListDao;
import com.fc.dao.mostqListDao;
import com.fc.dto.notice_TableDto;
import com.fc.dto.qqq_TableDto;

import java.util.List;

@Service
public class mostqServiceImpl implements mostqService {
    
    @Autowired
    private mostqListDao mostqListDao;

    @Override
    public List<qqq_TableDto> getMostqList() {
        return mostqListDao.selectMostqList();
    }

	@Override
	public int mostq_insert(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		return mostqListDao.insertMostq(qqq_tableDto);
	}
//	
	@Override
	public int mostq_update(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		return mostqListDao.updateMostQ(qqq_tableDto);
	}
	
	@Override
	public int mostq_delete(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		return mostqListDao.deleteMostQ(qqq_tableDto);
	}

	@Override
	public qqq_TableDto foundMostQService(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		return mostqListDao.foundMostQService(qqq_tableDto);
	}
	
	@Override
	public qqq_TableDto foundMostQService(int mostqboardNo) {
		// TODO Auto-generated method stub
		return mostqListDao.foundMostQService(mostqboardNo);
	}
	
//	@Override
//	public notice_TableDto foundNoticeService2(int noticeboardNo) {
//		// TODO Auto-generated method stub
//		return noticeListDao.foundNoticeService2(noticeboardNo);
//	}


}