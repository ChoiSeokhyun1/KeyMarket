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
	 	<h1>자주묻는 질문모음</h1>
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
            <c:forEach var="mostq" items="${mostqList}">
    			<tr class="notice-row">
       				 <td>${mostq.mostqboardNo}</td>
        			 <td><span>${mostq.mostqboardTitle}</span></td>
       				 <td>${mostq.mostqboardname2}</td>
       				 <td>${mostq.mostqboardDate}</td>
    			</tr>
</c:forEach>
        </tbody>
    </table>
    
    <form id="viewBoardForm" method="post" action="viewBoardMostQ">
    <input type="hidden" name="mostqboardNo" value="">
    <input type="hidden" name="mostqboardTitle" value="">
    <input type="hidden" name="mostqboardname2" value="">
    <input type="hidden" name="mostqboardDate" value="">
</form>

</div>

<div id="wrap3">
<!-- 페이징 부분 -->
<div class="pagination">
    <a href="?page=${currentPage - 1}" id="prevPage">이전</a>
    
    <c:set var="startPage" value="${currentPage - 2}" />
    <c:set var="endPage" value="${currentPage + 2}" />
    
    <c:if test="${endPage > totalPages}">
        <c:set var="endPage" value="${totalPages}" />
        <c:set var="startPage" value="${totalPages - 4}" />
    </c:if>

    <c:if test="${startPage < 1}">
        <c:set var="startPage" value="1" />
        <c:set var="endPage" value="5" />
    </c:if>

    <c:forEach var="i" begin="${startPage}" end="${endPage}">
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
        <a href="writeBoardMostQ"><button id="wirteButton">글 쓰기</button></a>
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
            mostqboardNo: row.querySelector('td:nth-child(1)').textContent,
            mostqboardTitle: row.querySelector('td:nth-child(2)').textContent,
            mostqboardname2: row.querySelector('td:nth-child(3)').textContent,
            mostqboardDate: row.querySelector('td:nth-child(4)').textContent
        };

        // 폼 요소에 데이터 설정
        var form = document.getElementById('viewBoardForm');
        form.querySelector('input[name="mostqboardNo"]').value = rowData.mostqboardNo;
        form.querySelector('input[name="mostqboardTitle"]').value = rowData.mostqboardTitle;
        form.querySelector('input[name="mostqboardname2"]').value = rowData.mostqboardname2;
        form.querySelector('input[name="mostqboardDate"]').value = rowData.mostqboardDate;

        // 폼을 자동으로 제출
        form.submit();
    });
});
    </script>
  
    
   
	<%@ include file="main_footer.jsp" %>	
</body>

</html>
