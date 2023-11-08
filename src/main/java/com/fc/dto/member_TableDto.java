package com.fc.dto;

import lombok.Data;

@Data
public class member_TableDto {
    String loginId; // 문자와 숫자를 모두 포함할 수 있는 아이디
    String loginPw; // 문자와 숫자를 모두 포함할 수 있는 비밀번호
	String name2; //문자만
	String email2;  // 문자와 숫자를 모두 포함할 수 있는 비밀번호
	String phone2; // 문자와 숫자를 모두 포함할 수 있는 비밀번호
	String admins2;
	String termsEmail;
	String termsSms;
}


