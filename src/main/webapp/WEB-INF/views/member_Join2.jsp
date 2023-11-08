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
</head>

<body>
    	<%@ include file="main_nav.jsp" %>
        
       <div id="wrap">

        <h1>회원 가입</h1>
        <br>
        <br>
        <p><strong>1. 약관동의</strong>&nbsp;&nbsp;>&nbsp;&nbsp;2. 정보입력&nbsp;&nbsp;>&nbsp;&nbsp;3. 가입완료</p>

        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form action="member_Join" method="post" name="userInfo" onsubmit="return checkValue();">
        
            	<div id="all-check" class="border-bottom">
            	<input type="checkbox" id="all-checkbox" name="all-checkbox">
            	<label for="all-checkbox"><p class="fontsize"><strong>이용약관, 쇼핑정보 수신 동의 (선택)에 모두 동의합니다.</strong></p></label>
            	</div>
            	
                <div id="all-check">
            	<input type="checkbox" id="checkbox2" name="checkbox2">
            	<label for="checkbox2"><p class="fontsize">이용약관 동의 (필수)</p></label>
            	</div>
            	
            	<div id="terms-content">
            	<textarea id="terms-textarea">
            		<%@ include file="yakkwan.txt" %>
            	</textarea>
            	</div>
            	
            	<div id="all-check" class="border-bottom">
            	<input type="checkbox" id="checkbox3" name="checkbox3">
            	<label for="checkbox3"><p class="fontsize">쇼핑정보 수신 동의 (선택)</p></label>
            	</div>
            	
            	<div id="all-check" class="border-bottom">
            	<div class="checkbox4-1">
            	<input type="checkbox" id="checkbox4-1-1" name="checkbox4-1-1">
            	<label for="checkbox4-1-1"><p class="fontsize2">SMS 수신 동의 (선택)</p></label>
            	<div class="spacing"></div>
            	<input type="checkbox" id="checkbox4-1-2" name="checkbox4-1-2">
            	<label for="checkbox4-1-2"><p class="fontsize2">이메일 수신 동의 (선택)</p></label>
            	</div>
            	</div>
            	
            	<div id="terms-content">
            	<textarea id="terms-textarea">
            		<%@ include file="susin.txt" %>
            	</textarea>
            	</div>
            	
            <br>
		    <!-- 가입 버튼 -->
		    <div class="buttonCenter">
    		   <input type="button" value="취소" onclick="goLoginForm()" class="lastbutton leftbutton">
    		   <input type="submit" value="다음" id="joinButton" class="lastbutton rightbutton" />
    		</div>
        </form>
    </div>
    
    <script>
        function toggleCheckboxes() {
            var allCheckbox = document.getElementById("all-checkbox");
            var checkboxes = document.querySelectorAll("input[type='checkbox']");

            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = allCheckbox.checked;
            }
        }

        var allCheckbox = document.getElementById("all-checkbox");
        allCheckbox.addEventListener("change", toggleCheckboxes);
    </script>
    
    <script>
        function toggleCheckboxes3() {
            var checkbox3 = document.getElementById("checkbox3");
            var checkbox4_1_1 = document.getElementById("checkbox4-1-1");
            var checkbox4_1_2 = document.getElementById("checkbox4-1-2");

            if (checkbox3.checked) {
                checkbox4_1_1.checked = true;
                checkbox4_1_2.checked = true;
            } else {
                checkbox4_1_1.checked = false;
                checkbox4_1_2.checked = false;
            }
        }

        var checkbox3 = document.getElementById("checkbox3");
        checkbox3.addEventListener("change", toggleCheckboxes3);
    </script>
    
    <script>
    function checkValue() {
        var checkbox2 = document.getElementById("checkbox2");

        if (!checkbox2.checked) {
            alert("필수 동의를 체크하세요.");
            return false; // 폼 전송을 중단합니다.
        }
    }
        
        </script>
   
        
		<%@ include file="main_footer.jsp" %>	
</body>

</html>








