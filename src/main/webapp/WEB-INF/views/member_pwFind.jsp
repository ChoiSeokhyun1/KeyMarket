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
        var error = "${error}";
        if (error) {
            alert(error);
        }
    </script>
		
       <div id="wrap">

        <h1>비밀번호 찾기</h1>
        <br>
        <br>
        	<p>가입하신 이메일 또는 전화번호로 비밀번호 찾기가 가능합니다.</p>
        	<p>기억이 나지 않는 경우 <a href="" class="fontBold">Q&A 게시판</a>을 통해 문의해주세요.</p>
        	
        <form action="member_pwFindResult" method="post" name="userInfo";>
        
        <select name="loginOption" id="login_Option">
	    <option value="email" selected>이메일</option>
	    <option value="phone">전화번호</option>
	    
		</select>
			<input type="text" class="" name="loginId" id="login_Id" placeholder="아이디" />
			<input type="text" class="" name="name2" id="login_Name" placeholder="이름" />
			<input type="text" class="" name="email2" id="login_Email" placeholder="이메일" />
            <input type="text" class="" name="phone2" id="login_Phone" maxlength="20"  placeholder="전화번호"/>  
            
		    <!-- 가입 버튼 -->
		    <div class="buttonCenter">
		       <input type="submit" value="비밀번호 찾기" id="joinButton" class="lastbutton" />
		    </div>
		       
        </form>
    </div>
    
    
    <script>
    const loginOptionSelect = document.getElementById("login_Option");
    const emailInput = document.getElementById("login_Email");
    const phoneInput = document.getElementById("login_Phone");

    // 페이지 로드 시 이메일이 선택된 상태로 설정
    emailInput.style.display = "block";
    phoneInput.style.display = "none";

    loginOptionSelect.addEventListener("change", function () {
        const selectedOption = loginOptionSelect.value;
        if (selectedOption === "email") {
            emailInput.style.display = "block";
            phoneInput.style.display = "none";
        } else if (selectedOption === "phone") {
            emailInput.style.display = "none";
            phoneInput.style.display = "block";
        }
    });
</script>
   
		<%@ include file="main_footer.jsp" %>	
</body>

</html>








