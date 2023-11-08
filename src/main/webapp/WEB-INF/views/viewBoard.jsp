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
	 	<h1>공지사항</h1>
	 </div>
	 
     <div id="wrap2">
     	<div class="title_Bar">
     		<span class="id">${foundNotice.noticeboardname2}</span>
        	<span class="title">${foundNotice.noticeboardTitle}</span>
        	<span class="date">${foundNotice.noticeboardDate}</span>
     	</div>
    	<div class="content_Bar">	
    		<span>${foundNotice.noticeboardContent}</span>
    	</div>
	 </div>
	 
	 <div id="wrap4">
	 	<div class="half_center">
	 		<button><a href="member_Notice">목록으로</a></button>
	 	</div>
	 	<div class="half_end">
	 	
	 	<form id="updateForm" method="post" action="notice_Update">
		    <!-- Add a hidden input field to pass the foundNotice object -->
		        <input type="hidden" name="noticeboardContent" value="${foundNotice.noticeboardContent}">
			    <input type="hidden" name="noticeboardTitle" value="${foundNotice.noticeboardTitle}">
			    <input type="hidden" name="noticeboardname2" value="${foundNotice.noticeboardname2}">
			    <input type="hidden" name="noticeboardDate" value="${foundNotice.noticeboardDate}">
			    <input type="hidden" name="noticeboardNo" value="${foundNotice.noticeboardNo}">
		    <input type="submit" name="notice_Update" id="notice_Update" value="수정">
		</form>
		
		<form id="updateForm2" method="post" action="notice_Delete">
		    <!-- Add a hidden input field to pass the foundNotice object -->
		        <input type="hidden" name="noticeboardContent" value="${foundNotice.noticeboardContent}">
			    <input type="hidden" name="noticeboardTitle" value="${foundNotice.noticeboardTitle}">
			    <input type="hidden" name="noticeboardname2" value="${foundNotice.noticeboardname2}">
			    <input type="hidden" name="noticeboardDate" value="${foundNotice.noticeboardDate}">
			    <input type="hidden" name="noticeboardNo" value="${foundNotice.noticeboardNo}">
			    <input type="submit" name="notice_Delete" id="notice_Delete" value="삭제">
	 	</form>
	 	</div>
	 </div>
	 
	 
	 <script>
		//세션에서 admins2 값을 가져오는 코드 (적절한 방법으로 가져와야 합니다)
		var admins2Value = '<%= session.getAttribute("userId") %>';
		
		// admins2Value가 1이거나 null일 때만 버튼을 숨김
		if (admins2Value === "admin") {
		    document.getElementById('notice_Update').style.display = 'block';
		    document.getElementById('notice_Delete').style.display = 'block';
		} else {
		    document.getElementById('notice_Update').style.display = 'none';
		    document.getElementById('notice_Delete').style.display = 'none';
		}
	</script>

	<%@ include file="main_footer.jsp" %>	
</body>

</html>








