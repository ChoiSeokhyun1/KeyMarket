<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>style 1</title>
    <c:set var="path" value="${pageContext.request.contextPath}"></c:set>
    <link href="${path}/css/member_Join.css" rel="stylesheet" type="text/css" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
	<script type="text/javascript">
    var isIdAvailable = false; // 아이디 중복 여부를 저장하는 변수

    // 중복 체크 함수
    function checkDuplicate() {
    var loginId = document.userInfo.loginId.value;
    if (!loginId) {
        alert("아이디를 입력하세요.");
        return;
    }
    
    // 아이디 유효성 검사
    var idRegex = /^[a-zA-Z0-9]{5,12}$/;
    if (!idRegex.test(loginId)) {
        alert("아이디는 영문 또는 숫자로 최소 5글자에서 12글자 이내로 작성해야 합니다.");
        return false;
    }

    // AJAX 요청 보내기
    $.ajax({
        type: "POST",
        url: "idCheckDuplicate",
        data: { loginId: loginId },
        dataType: "text", // JSON 형식으로 응답을 기대
        success: function(response) {
        	if (response === "1") {
        	    // 중복이 없으면 가입 버튼 활성화
        	    isIdAvailable = true;
        	    document.getElementById("joinButton").disabled = false;
        	    alert("사용 가능한 아이디입니다.");
        	} else {
        	    isIdAvailable = false;
        	    alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력하세요.");
        	}
        },
        error: function() {
            alert("중복 체크 중 오류가 발생했습니다.");
        }
    });
}

    // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
    function checkValue() {
    	var loginId = document.userInfo.loginId.value;
        var loginPw = document.userInfo.loginPw.value;
        var loginPwCheck = document.userInfo.loginPwCheck.value;
        var email2 = document.userInfo.email2.value;
        var name2 = document.userInfo.name2.value;
        var phone2 = document.userInfo.phone2.value;

        // 이메일 유효성 검사
        var idRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!idRegex.test(email2)) {
            alert("이메일 주소 형식이 맞지 않습니다.");
            return false;
        }
        
        if (name2.trim() === "") {
            alert("이름을 작성해주세요.");
            return false;
        }
        
        if (phone2.trim() === "") {
            alert("핸드폰 번호를 작성해주세요.");
            return false;
        }

        // 패스워드 유효성 검사
        var pwRegex = /^(?=.*[a-zA-Z])(?=.*\d).{5,12}$/;
        if (!pwRegex.test(loginPw)) {
            alert("비밀번호는 영문과 숫자의 조합으로 최소 5글자에서 12글자 이내로 작성해야 합니다.");
            return false;
        }

        if (loginPw !== loginPwCheck) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }

        // 중복 체크를 하지 않은 경우 알림을 표시하고 폼 전송을 막음
        if (!isIdAvailable) {
            alert("아이디 중복 체크를 먼저 진행해주세요.");
            return false;
        }    
        
        return true;
    }
    
    // 취소 버튼 클릭시 로그인 화면으로 이동
    function goLoginForm() {
        location.href = "main.jsp";
    }
</script>
   
</head>

<body>
    	<%@ include file="main_nav.jsp" %>
        
       <div id="wrap">

        <h1>회원 가입</h1>
        <br>
        <br>
        <p>1. 약관동의&nbsp;&nbsp;>&nbsp;&nbsp;<strong>2. 정보입력&nbsp;&nbsp;>&nbsp;&nbsp;</strong>3. 가입완료</p>

        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form action="member_Joinn" method="post" name="userInfo" onsubmit="return checkValue();">
            <table>
                <tr>
			    	<td id="title" class="required-field">아이디</td>    	  	
				    <td>
				    	<input type="text" class="dis tdMargin" name="loginId" id="login_Id" />
			      	  	<button type="button" id="idCheck" class="" onclick="checkDuplicate()">중복체크</button>
			      	  	<br>
				        <span class="tdMargin" style="font-size: 12px;">* 아이디는 영문 또는 숫자로 최소 5글자에서 12글자 이내로 작성해야 합니다.</span>
				    </td>
				</tr>
				
                <tr>
                    <td id="title" class="required-field">비밀번호</td>
                    <td>
                         <input type="text" class="dis tdMargin" name="loginPw" id="login_Pw" maxlength="20" />
                         <br>
                         <span class="tdMargin" style="font-size: 12px;">* 비밀번호는 영문과 숫자의 조합으로 최소 5글자에서 12글자 이내로 작성해야 합니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td id="title" class="required-field">비밀번호 확인</td>
                    <td>
                         <input type="text" class="dis tdMargin" name="loginPwCheck" id="login_PwCheck" maxlength="20" />
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" class="required-field">이름</td>
                    <td>
                        <input class="dis tdMargin" type="text" name="name2" maxlength="50">
                    </td>
                </tr>
              
                <tr>
                    <td id="title" class="required-field">이메일</td>
                    <td>
                        <input class="dis tdMargin" type="text" name="email2" id="EMAIL" maxlength="50">
                        <br>
                        <span class="tdMargin" style="font-size: 12px; color: blue;">* 결제시 이메일로 인증키가 발송되오니 정확한 이메일을 작성해주세요.</span>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" class="required-field">휴대전화</td>
                    <td>
                        <input class="dis tdMargin" type="text" name="phone2" />
                    </td>
                </tr>
            </table>
            <br>
            <input type="hidden" name="termsEmail" value="${termsEmail}">
			<input type="hidden" name="termsSms" value="${termsSms}">
		    <!-- 가입 버튼 -->
		    <div class="buttonCenter">
    		   <input type="button" value="취소" onclick="goLoginForm()" class="lastbutton leftbutton">
    		   <input type="submit" value="가입" id="joinButton" class="lastbutton rightbutton" />
    		</div>
        </form>
    </div>

		<%@ include file="main_footer.jsp" %>	
</body>

</html>








