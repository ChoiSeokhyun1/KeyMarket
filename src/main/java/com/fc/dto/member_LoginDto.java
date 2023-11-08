package com.fc.dto;

import lombok.Data;

@Data
public class member_LoginDto {
    String loginID; // 문자와 숫자를 모두 포함할 수 있는 아이디
    String loginPW; // 문자와 숫자를 모두 포함할 수 있는 비밀번호
}