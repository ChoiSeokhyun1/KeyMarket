package com.fc.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.idCheckDuplicateDao;
import com.fc.dto.member_TableDto;

@Repository
public class idCheckDuplicateDaoImpl implements idCheckDuplicateDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int isDuplicateId(String loginId) {
		
		int result = sqlSessionTemplate.selectOne("member_mapper.duplicate_id", loginId);
	    return result;
	}
	
	@Override
	public int member_insert(member_TableDto member_tabledto) {
		int result = sqlSessionTemplate.insert("member_mapper.insertMember", member_tabledto);
		
		return result;
	}

	@Override
	public int member_Login(member_TableDto member_tabledto) {
		
		int result = sqlSessionTemplate.selectOne("member_mapper.member_Login", member_tabledto);
		
	    return result;
	}
	
	
	
}
