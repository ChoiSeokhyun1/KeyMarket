package com.fc.service;

import com.fc.dto.member_TableDto;

public interface idCheckDuplicateService  {

	//아이디 중복 검사
	public int checkDuplicateId(String loginId);
	
	public int member_insert(member_TableDto member_tabledto);
	
	public int loginCheck(member_TableDto member_tabledto);
	
}
