package com.fc.dao;

import com.fc.dto.member_TableDto;

public interface idCheckDuplicateDao {
	
	public int isDuplicateId(String loginId);
	
	public int member_insert(member_TableDto member_tabledto);
	
	public int member_Login(member_TableDto member_tabledto);
	
}
