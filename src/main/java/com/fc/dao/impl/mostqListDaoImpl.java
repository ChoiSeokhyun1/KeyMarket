package com.fc.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.mostqListDao;
import com.fc.dao.noticeListDao;
import com.fc.dto.notice_TableDto;
import com.fc.dto.qqq_TableDto;

import java.util.List;

@Repository
public class mostqListDaoImpl implements mostqListDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<qqq_TableDto> selectMostqList() {
        // MyBatis 매퍼를 통해 쿼리 실행
    	List<qqq_TableDto> mostqList =
    	sqlSessionTemplate.selectList("mostq_mapper.mostqList"); 
        
        return mostqList;
    }

	@Override
	public int insertMostq(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("mostq_mapper.insertMostq", qqq_tableDto);
		
		return result;
	}
//	
	@Override
	public int updateMostQ(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("mostq_mapper.updateMostq", qqq_tableDto);
		
		return result;
	}
	
	@Override
	public int deleteMostQ(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.delete("mostq_mapper.deleteMostq", qqq_tableDto);
		
		return result;
	}

	@Override
	public qqq_TableDto foundMostQService(qqq_TableDto qqq_tableDto) {
		// TODO Auto-generated method stub
			
		 return sqlSessionTemplate.selectOne("mostq_mapper.selectMostQView", qqq_tableDto);
	}
	
	@Override
	public qqq_TableDto foundMostQService(int mostqboardNo) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("mostq_mapper.selectMostQView2", mostqboardNo);
	}

//	@Override
//	public notice_TableDto foundNoticeService2(int noticeboardNo) {
//		// TODO Auto-generated method stub
//		
//		return sqlSessionTemplate.selectOne("notice_mapper.selectNoticeView2", noticeboardNo);
//	}
}

