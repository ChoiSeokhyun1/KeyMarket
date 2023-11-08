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
    <link href="${path}/css/view_Board.css" rel="stylesheet" type="text/css" />
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
	 	<h1>자주묻는 질문모음</h1>
	 </div>
	 
     <div id="wrap2">
     	<div class="title_Bar">
     		<span class="id">${foundMostQ.mostqboardname2}</span>
        	<span class="title">${foundMostQ.mostqboardTitle}</span>
        	<span class="date">${foundMostQ.mostqboardDate}</span>
     	</div>
    	<div class="content_Bar">	
    		<span>${foundMostQ.mostqboardContent}</span>
    	</div>
	 </div>
	 
	 <div id="wrap4">
	 	<div class="half_center">
	 		<button><a href="member_MostQ">목록으로</a></button>
	 	</div>
	 	<div class="half_end">
	 	
	 	<form id="updateForm" method="post" action="mostq_Update">
		    <!-- Add a hidden input field to pass the foundNotice object -->
		        <input type="hidden" name="mostqboardContent" value="${foundMostQ.mostqboardContent}">
			    <input type="hidden" name="mostqboardTitle" value="${foundMostQ.mostqboardTitle}">
			    <input type="hidden" name="mostqboardname2" value="${foundMostQ.mostqboardname2}">
			    <input type="hidden" name="mostqboardDate" value="${foundMostQ.mostqboardDate}">
			    <input type="hidden" name="mostqboardNo" value="${foundMostQ.mostqboardNo}">
		    <input type="submit" name="mostq_Update" id="mostq_Update" value="수정">
		</form>
		
		<form id="updateForm2" method="post" action="mostq_Delete">
		    <!-- Add a hidden input field to pass the foundNotice object -->
		        <input type="hidden" name="mostqboardContent" value="${foundMostQ.mostqboardContent}">
			    <input type="hidden" name="mostqboardTitle" value="${foundMostQ.mostqboardTitle}">
			    <input type="hidden" name="mostqboardname2" value="${foundMostQ.mostqboardname2}">
			    <input type="hidden" name="mostqboardDate" value="${foundMostQ.mostqboardDate}">
			    <input type="hidden" name="mostqboardNo" value="${foundMostQ.mostqboardNo}">
			    <input type="submit" name="mostq_Delete" id="mostq_Delete" value="삭제">
	 	</form>
	 	</div>
	 </div>
	 
	 
	 <script>
		//세션에서 admins2 값을 가져오는 코드 (적절한 방법으로 가져와야 합니다)
		var admins2Value = '<%= session.getAttribute("userId") %>';
		
		// admins2Value가 1이거나 null일 때만 버튼을 숨김
		if (admins2Value === "admin") {
		    document.getElementById('mostq_Update').style.display = 'block';
		    document.getElementById('mostq_Delete').style.display = 'block';
		} else {
		    document.getElementById('mostq_Update').style.display = 'none';
		    document.getElementById('mostq_Delete').style.display = 'none';
		}
	</script>

	<%@ include file="main_footer.jsp" %>	
</body>

</html>








