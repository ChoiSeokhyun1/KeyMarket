package com.fc.dao;

import java.util.Map;

import com.fc.dto.member_TableDto;

public interface idFindDao {

	public String idFindEmail(member_TableDto member_tableDto);
	
	public String idFindPhone(member_TableDto member_tableDto);
	
	public Map<String, Object> pwFindEmail(member_TableDto member_tableDto);
	
	public Map<String, Object> pwFindPhone(member_TableDto member_tableDto);
	
}
