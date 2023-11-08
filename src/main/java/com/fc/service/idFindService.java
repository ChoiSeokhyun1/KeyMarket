package com.fc.service;

import java.util.Map;

import com.fc.dto.member_TableDto;

public interface idFindService {
    
    public String idFindEmailService(member_TableDto member_tableDto);
    
    public String idFindPhoneService(member_TableDto member_tableDto);

    public Map<String, Object> pwFindEmailService(member_TableDto member_tableDto);
    
    public Map<String, Object> pwFindPhoneService(member_TableDto member_tableDto);
    
}