package com.fc.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dto.member_TableDto;
import com.fc.service.idFindService;
import com.fc.dao.idFindDao;

@Service
public class idFindServiceImpl implements idFindService {
    
    @Autowired
    private idFindDao idFindDao;

    @Override
    public String idFindEmailService(member_TableDto member_tableDto) {
        String foundId = idFindDao.idFindEmail(member_tableDto);
        if (foundId != null && !foundId.isEmpty()) {
            return foundId;
        }
        return idFindPhoneService(member_tableDto);
    }

    @Override
    public String idFindPhoneService(member_TableDto member_tableDto) {
        String foundId = idFindDao.idFindPhone(member_tableDto);
        if (foundId != null && !foundId.isEmpty()) {
            return foundId;
        }
        return null; // 결과가 없는 경우 null 반환
    }
    
    @Override
    public Map<String, Object> pwFindEmailService(member_TableDto member_tableDto) {
    	Map<String, Object> foundPw = idFindDao.pwFindEmail(member_tableDto);
        if (foundPw != null && !foundPw.isEmpty()) {
            return foundPw;
        }
        return pwFindPhoneService(member_tableDto);
    }

    @Override
    public Map<String, Object> pwFindPhoneService(member_TableDto member_tableDto) {
    	Map<String, Object> foundPw = idFindDao.pwFindPhone(member_tableDto);
        if (foundPw != null && !foundPw.isEmpty()) {
            return foundPw;
        }
        return null; // 결과가 없는 경우 null 반환
    }


}
      

	
