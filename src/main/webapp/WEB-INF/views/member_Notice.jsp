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
    <table class="notice-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성 날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="notice" items="${noticeList}">
    			<tr class="notice-row">
       				 <td>${notice.noticeboardNo}</td>
        			 <td><span>${notice.noticeboardTitle}</span></td>
       				 <td>${notice.noticeboardname2}</td>
       				 <td>${notice.noticeboardDate}</td>
    			</tr>
</c:forEach>
        </tbody>
    </table>
    
    <form id="viewBoardForm" method="post">
    <input type="hidden" name="noticeboardNo" value="">
    <input type="hidden" name="noticeboardTitle" value="">
    <input type="hidden" name="noticeboardname2" value="">
    <input type="hidden" name="noticeboardDate" value="">
</form>

</div>

<div id="wrap3">
<!-- 페이징 부분 -->
<div class="pagination">
    <a href="?page=${currentPage - 1}" id="prevPage">이전</a>
    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <span class="current">${i}</span>
            </c:when>
            <c:otherwise>
                <a href="?page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
        <a href="?page=${currentPage + 1}" id="nextPage">다음</a>
</div>
    <div class="wirteButton">
        <a href="writeBoard"><button id="wirteButton">글 쓰기</button></a>
    </div>
</div>

<script>
//세션에서 admins2 값을 가져오는 코드 (적절한 방법으로 가져와야 합니다)
var admins2Value = '<%= session.getAttribute("userId") %>';

// admins2Value가 1이거나 null일 때만 버튼을 숨김
if (admins2Value === "admin") {
    document.getElementById('wirteButton').style.display = 'block';
} else {
    document.getElementById('wirteButton').style.display = 'none';
}
</script>

<script>
    document.getElementById('prevPage').addEventListener('click', function (event) {
        if (${currentPage} === 1) {
            event.preventDefault();
            alert('글이 없습니다.');
        }
    });

    document.getElementById('nextPage').addEventListener('click', function (event) {
        if (${currentPage} === ${totalPages}) {
            event.preventDefault();
            alert('글이 없습니다.');
        }
    });
</script>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
    <script>
 	// title클릭 했을시 작동
    document.querySelectorAll('.notice-row td:nth-child(2)').forEach(function (titleCell) {
    titleCell.addEventListener('click', function () {
        var row = this.parentElement;
        var rowData = {
            noticeboardNo: row.querySelector('td:nth-child(1)').textContent,
            noticeboardTitle: row.querySelector('td:nth-child(2)').textContent,
            noticeboardname2: row.querySelector('td:nth-child(3)').textContent,
            noticeboardDate: row.querySelector('td:nth-child(4)').textContent
        };

        // 폼 요소에 데이터 설정
        var form2 = document.getElementById('viewBoardForm');
       
        form2.querySelector('input[name="noticeboardNo"]').value = rowData.noticeboardNo;
        form2.querySelector('input[name="noticeboardTitle"]').value = rowData.noticeboardTitle;
        form2.querySelector('input[name="noticeboardname2"]').value = rowData.noticeboardname2;
        form2.querySelector('input[name="noticeboardDate"]').value = rowData.noticeboardDate;
        
        var path = "${pageContext.request.contextPath}";
        form2.action = path + "/viewBoard/" + rowData.noticeboardNo
        
        // 폼을 자동으로 제출
        form2.submit();
        
    });
});
    </script>
  
    
   
	<%@ include file="main_footer.jsp" %>	
</body>

</html>








