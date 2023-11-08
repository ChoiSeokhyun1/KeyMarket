package com.fc.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.noticeListDao;
import com.fc.dto.notice_TableDto;

import java.util.List;

@Repository
public class noticeListDaoImpl implements noticeListDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<notice_TableDto> selectNoticeList(int page) {
        // MyBatis 매퍼를 통해 쿼리 실행
    	List<notice_TableDto> noticeList =
    	sqlSessionTemplate.selectList("notice_mapper.noticeList2", page); 
        
        return noticeList;
    }

	@Override
	public int insertNotice(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("notice_mapper.insertNotice", notice_tableDto);
		
		return result;
	}
	
	@Override
	public int updateNotice(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("notice_mapper.updateNotice", notice_tableDto);
		
		return result;
	}
	
	@Override
	public int deleteNotice(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.delete("notice_mapper.deleteNotice", notice_tableDto);
		
		return result;
	}

	@Override
	public notice_TableDto foundNoticeService(notice_TableDto notice_tableDto) {
		// TODO Auto-generated method stub
			
		 return sqlSessionTemplate.selectOne("notice_mapper.selectNoticeView", notice_tableDto);
	}

	@Override
	public notice_TableDto foundNoticeService2(int noticeboardNo) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("notice_mapper.selectNoticeView2", noticeboardNo);
	}
}

