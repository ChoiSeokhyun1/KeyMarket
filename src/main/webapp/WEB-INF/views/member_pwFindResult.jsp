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
    	


		
    <div id="wrap">
        <h1>아이디 찾기 결과</h1>
        <br>
        <br>
        <p>회원 아이디: ${foundId}</p>
        

	<form action="member_Login" method="post">
        <!-- 더 많은 입력 필드나 요소를 여기에 추가할 수 있습니다 -->
        <div class="buttonCenter">
            <input type="submit" value="로그인 페이지" class="lastbutton" />
        </div>
    </form>
		       
    </div>

		<%@ include file="main_footer.jsp" %>	
</body>

</html>








