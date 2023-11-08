package com.fc.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.idFindDao;
import com.fc.dto.member_TableDto;

@Repository
public class idFindDaoImpl implements idFindDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

	@Override
	public String idFindEmail(member_TableDto member_tableDto) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("member_mapper.idFindEmail", member_tableDto);
	}
	
	@Override
	public String idFindPhone(member_TableDto member_tableDto) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("member_mapper.idFindPhone", member_tableDto);
	}
	
	
	@Override
	public Map<String, Object> pwFindEmail(member_TableDto member_tableDto) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("member_mapper.pwFindEmail", member_tableDto);
	}
	
	@Override
	public Map<String, Object> pwFindPhone(member_TableDto member_tableDto) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("member_mapper.pwFindPhone", member_tableDto);
	}
}

