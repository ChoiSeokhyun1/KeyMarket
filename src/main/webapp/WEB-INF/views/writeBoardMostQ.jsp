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
    <link href="${path}/css/member_Notice.css" rel="stylesheet" type="text/css" />
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<body>
	<%@ include file="main_nav.jsp" %>
	
	 <div id="wrap">
	 	<h1>자주묻는 질문모음</h1>
	 </div>
	
	<!-- Summernote를 사용할 textarea 요소 -->
	<div id="wrap2">
	<input type="text" id="titleInput" placeholder="글 제목을 입력하세요">
	<textarea id="summernote"></textarea>
	</div>
	
	<script>
      $('#summernote').summernote({
        placeholder: '글 내용을 작성해주세요.',
        tabsize: 2,
        height: 400,
        width: 1280
      });
    </script>

    <div id="wrap3">
		<button id="comple">등록</button>
	</div>
	
	 <script>
        $('#comple').click(function() {
            // 입력 필드에서 데이터 가져오기
            var mostqboardTitle = $('#titleInput').val();
            var mostqboardContent = $('#summernote').summernote('code');
            
        	 // 현재 날짜 가져오기
            var mostqboardDate = new Date().toLocaleDateString(); // 예: "10/11/2023"
            
            var mostqboardname2 = '<%= session.getAttribute("userId") %>';

            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                type: 'POST', // HTTP 요청 방식 (POST를 사용)
                url: 'writeProcess2', // 데이터를 처리할 서버 측 JSP 파일
                data: {
                	mostqboardTitle: mostqboardTitle,
                	mostqboardContent: mostqboardContent,
                	mostqboardDate : mostqboardDate,
                	mostqboardname2 : mostqboardname2
                },
                success: function(response) {
                    // 서버로부터의 응답을 처리
                    console.log('글이 성공적으로 등록되었습니다.');
                    // 여기에 추가적인 동작을 수행할 수 있음
                    
                    // AJAX 요청 성공 시 다른 페이지로 이동
                    window.location.href = 'member_MostQ';
                },
                error: function() {
                    console.log('글 등록에 실패했습니다.');
                }
            });
        });
    </script>
    
    <%
	// 세션 변수 "loginID" 값을 가져와서 출력
	String userId = (String) session.getAttribute("userId");
	
	if (userId != null) {
  	  out.println("로그인 ID: " + userId);
	} else {
  	  out.println("로그인되지 않았습니다.");
	}
	%>
   
	<%@ include file="main_footer.jsp" %>	
</body>

</html>








