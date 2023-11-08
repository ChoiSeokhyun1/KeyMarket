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
     <div class="footer-top">
		 	<img src="${path}/image/titleBanner.jpg" alt="Loaded Image">
		 </div>
		 <footer>
        <div class="footer-section"> 
            <p class="text-14pt bold-text">고객센터 정보</p>
            <p class="bold-text">상담/주문전화<span class="nonstyle"> 010-0000-0000</span></p>
            <p class="bold-text">상담/주문 이메일</br><span class="nonstyle"> id@naver.com</span></p>
            <p class="bold-text">CS운영시간</br><span class="nonstyle"> 문의가능시간 07 : 00 ~ 24 : 00</span></p>
        </div>
        <div class="footer-section">
            <p class="text-14pt bold-text">결제정보</p>
            <p class="bold-text2">무통장 계좌정보</p>
            <span class="text-14pt">우체국 000000000000 전상민</span>
        </div>
        <div class="footer-section">
            <div class="footer-section3-top">
            	<a href="#" class="bold-text">회사소개</a>
            	<a href="#" class="bold-text">이용약관</a>
            	<a href="#" class="bold-text">개인정보처리방침</a>
            	<a href="#" class="bold-text">이용안내</a>
            </div>
            <div class="footer-section3-bottom">
    			<p class="bold-text">쇼핑몰 기본정보</p>
    			 <p>
        			<span class="bold-text">상호명</span>
       			 	<span>투지</span>
       			 	<span class="bold-text">대표자명</span>
       			 	<span>투지</span>
   				 </p>
   				 <p class="bold-text">사업장 주소</p>
   				 <span class="margin-bottom">03311 인천광역시 남동구 청능대로 581,502-89호 광성프라자</span>
   				   <p>
        			<span class="bold-text">대표전화</span>
       			 	<span>01055829247</span>
       			 	<span class="bold-text">사업자 등록번호</span>
       			 	<span>1332063453</span>
   				 </p>
   				 <p>
        			<span class="bold-text">통신판매업 신고번호</span>
       			 	<span>2023-인천남동구-1900<a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=">[사업자정보확인]</a></span>
       			 	<span class="bold-text">개인정보보호책임자</span>
       			 	<span>박성영</span>
   				 </p>
			</div>
        </div>
    	</footer>
    	<div class="footer-bottom-solid"></div>
    	<div class="footer-bottom">
		 	<p>Copyright © 키마켓. All Rights Reserved. Hosting by Cafe24 Corp.<p>
		 </div>

</body>

</html>