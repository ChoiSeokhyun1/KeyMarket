package com.fc.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dao.idCheckDuplicateDao;
import com.fc.dto.member_TableDto;
import com.fc.service.idCheckDuplicateService;


@Service
public class idCheckDuplicateServiceImpl implements idCheckDuplicateService { // 클래스 이름도 변경

    @Autowired
    private idCheckDuplicateDao idCheckDuplicateDao; // 빈 이름을 idCheckDuplicateDaoImpl로 변경

    @Override
    public int checkDuplicateId(String loginId) {
    	
        return idCheckDuplicateDao.isDuplicateId(loginId);
    }
    
    @Override
    public int member_insert(member_TableDto member_tabledto) {
        // insert 성공하면 1 아니면 0 리턴
        int result = idCheckDuplicateDao.member_insert(member_tabledto);

        return result; // 회원가입 성공 시 1, 실패 시 0을 반환
    }

	@Override
	public int loginCheck(member_TableDto member_tabledto) {
		
		return idCheckDuplicateDao.member_Login(member_tabledto);
	}
    
    
    
}