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
    <link href="${path}/css/main.css" rel="stylesheet" type="text/css" />
</head>

<body>
    	<%@ include file="main_nav.jsp" %>
    	
    <script>
        var message = "${message}";
        if (message) {
            alert(message);
        }
    </script>
		
        <!--메인 배너 영역 -->
		<section class="main_Banner">
			<img src="${path}/image/mainBanner.jpg" alt="Loaded Image">
		</section>
	
		<!--메인 추천 상품 영역 -->
		<section class="recommend_Items">
			<h2>인기제품</h3>
		</section>
		
		<!--메인 추천 상품 리스트 영역 -->
		<section class="recommend_Items_List">
			<div class="recomend_Items_One" onclick="window.location.href = '링크_주소';">
				<img src="${path}/image/windows10.png" alt="Loaded Image">
				<p>윈도우10 홈/프로</p>
				<p>19,900원 구매 </p>
			</div>
			
			<div class="recomend_Items_Two">
				<img src="${path}/image/windows10.png" alt="Loaded Image">
				<p>윈도우10 홈 / 프로</p>
				<p>19,900원 구매 </p>
			</div>
			
			<div class="recomend_Items_Three">
				<img src="${path}/image/windows10.png" alt="Loaded Image">
				<p>윈도우10 홈 / 프로</p>
				<p>19,900원 구매 </p>
			</div>
		</section>
		
		<section class="main_Guide">
			<div class="main_Guide_Text">
				<p>문의 및 배송안내</p></br></br>
				<p>주문 후 인증키는</p>
				<p>'기입 또는 입력 하신 이메일로 발송됩니다'</p></br>
				<p>"윈오바이" 에서 판매하는 모든 인증키는</p>
				<p>정품 정식 라이센스 인증키입니다</p></br>
				<p>USB / CD 없이, 제품코드 및 설치 / 인증 매뉴얼을 제공합니다</p></br>
				<p>구매신청 후 메일이 발송된 경우</p>
				<p>제품코드 노출로 인하여</p>
				<p>단순변심 또는 오주문을 이유로 교환 / 반품이 불가함을 안내드립니다</p>
			</div>
		</section>
		</div>
		
		 <%@ include file="main_footer.jsp" %>
		
		
		
</body>

</html>








