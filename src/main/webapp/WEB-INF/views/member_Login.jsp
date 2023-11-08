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
    <link href="${path}/css/member_login.css" rel="stylesheet" type="text/css" />
    


</head>

<body>
    	<%@ include file="main_nav.jsp" %>
    	
    <script>
        // Flash 속성에서 메시지를 가져와서 alert로 표시
        var message = "${message}";
        if (message) {
            alert(message);
        }
    </script>
		
       <div id="wrap">

        <h1>로그인</h1>
        </br>

        <form action="member_LoginOK" method="post" name="userInfo";>

			<input type="text" class="" name="loginId" id="login_Id" placeholder="아이디" />
            <input type="text" class="" name="loginPw" id="login_Pw" maxlength="20"  placeholder="비밀번호"/>  
            
		    <!-- 가입 버튼 -->
		    <div class="buttonCenter">
		       <input type="submit" value="로그인" id="joinButton" class="lastbutton" />
		    </div>
		    <div class="remember-me">
		    	<input type="checkbox" id="rememberCheckbox" /> <!-- 체크박스 -->
		    	<label for="rememberCheckbox">아이디/비밀번호 저장</label>
			</div>
		    <div class="buttonCenter">
    		   <a href="member_idFind" class="idFind">아이디 찾기</a>
    		   <span class="separator"></span>
    		   <a href="member_pwFind" class="pwFind">비밀번호 찾기</a>
    		</div>
        </form>
    </div>
    
   <script>
document.addEventListener("DOMContentLoaded", function() {
  // 폼 요소, 아이디, 비밀번호, 체크박스를 가져옵니다.
  var loginForm = document.forms["userInfo"];
  var rememberCheckbox = document.getElementById("rememberCheckbox");
  var loginIdInput = document.getElementById("login_Id");
  var loginPwInput = document.getElementById("login_Pw");

  // 페이지 로드 시, 세션 스토리지에서 아이디, 비밀번호, 체크박스 상태를 가져와서 입력란 및 체크박스에 채웁니다.
  if (rememberCheckbox && sessionStorage.getItem("rememberMe")) {
    var storedLoginId = sessionStorage.getItem("loginId");
    var storedLoginPw = sessionStorage.getItem("loginPw");
    var storedRememberMe = sessionStorage.getItem("rememberMe");

    if (storedLoginId) {
      loginIdInput.value = storedLoginId;
    }

    if (storedLoginPw) {
      loginPwInput.value = storedLoginPw;
    }

    if (storedRememberMe === "true") {
      rememberCheckbox.checked = true;
    } else {
      rememberCheckbox.checked = false;
    }
  }

  // 폼이 제출될 때, 아이디, 비밀번호, 체크박스 상태를 세션 스토리지에 저장합니다.
  if (loginForm) {
    loginForm.addEventListener("submit", function(event) {
      var loginId = loginIdInput.value;
      var loginPw = loginPwInput.value;
      var rememberMe = rememberCheckbox.checked;

      if (loginId) {
        sessionStorage.setItem("loginId", loginId);
      }

      if (loginPw) {
        sessionStorage.setItem("loginPw", loginPw);
      }

      if (rememberMe) {
        sessionStorage.setItem("rememberMe", "true");
      } else {
        sessionStorage.removeItem("rememberMe");
      }
    });
  }
});
</script>
    
   
        
		<%@ include file="main_footer.jsp" %>	
</body>

</html>








