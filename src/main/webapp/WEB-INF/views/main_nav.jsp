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
    <div class="container">
        <!-- 헤더 영역 (네비) -->
        <!-- 네비 탑 영역(로그인 등등) -->
        <div class="navbartop">
            <div class="nav_menu">
                <ul>
                <c:choose>
                	<c:when test="${empty sessionScope.userId}">
                    <li><a href="member_Join2">회원가입</a></li>
                    </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty sessionScope.userId}">
                            <li><a href="${path}/member_Login">로그인</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="logout">로그아웃</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li>
                        <a href="#">고객센터▽</a>
                        <ul class="sub_nav">
                            <li><a href="${path}/member_Notice">공지사항</a></li>
                            <li><a href="${path}/member_MostQ">자주묻는 질문</a></li>
                            <li><a href="#">Q & A</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
		
		<!-- 타이틀 배너 영역 -->	
		<section class="content_banner">
 		 	<div class="banner_image">
    			<img src="${path}/image/titleBanner.jpg" alt="Loaded Image">
  			</div>
  			<div class="myInfo">
  			 	<a href="#">
    				<img src="${path}/image/userIcon.png" alt="Loaded Image">
   				</a>
   				<p>내 정보</p>
  			</div>
  			<div class="myInfo2">
  			 	<a href="#">
    				<img src="${path}/image/cartIcon.png" alt="Loaded Image">
   				</a>
   				<p>장바구니</p>
  			</div>
		</section>

            <!--메뉴 네비 영역 -->
            <div class="navbarbottom">
                <div class="nav">
                    <ul>
                        <li><a href="#" class="bold-text">윈도우10</a>
                            <ul class="sub_nav bgblue">
                                <li> <a href="https://www.naver.com">윈도우10 HOME</a></li>
                                <li> <a href="#">윈도우10 PRO</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="bold-text">윈도우11</a>
                            <ul class="sub_nav bgblue">
                                <li> <a href="#">윈도우11 HOME</a></li>
                                <li> <a href="#">윈도우11 PRO</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="bold-text">오피스2016</a>
                            <ul class="sub_nav bgblue">
                                <li> <a href="#">Home and Student</a></li>
                                <li> <a href="#">Home and Business</a></li>
                                <li> <a href="#">Professional Plus</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="bold-text">오피스2019</a>
                            <ul class="sub_nav bgblue">
                                <li> <a href="#">Home and Student</a></li>
                                <li> <a href="#">Home and Business</a></li>
                                <li> <a href="#">Professional Plus</a></li>
                            </ul>
                        </li>
						<li><a href="#" class="bold-text">오피스2021</a>
                            <ul class="sub_nav bgblue">
                                <li> <a href="#">Home and Student</a></li>
                                <li> <a href="#">Home and Business</a></li>
                                <li> <a href="#">Professional Plus</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="bold-text">맥 오피스</a>
                            <ul class="sub_nav bgblue">
                                <li> <a href="#">오피스2019 Home and Student</a></li>
                                <li> <a href="#">오피스2019 Home and Business</a></li>
                                <li> <a href="#">오피스2019 Professional Plus</a></li>
                                <li> <a href="#">오피스2021 Home and Student</a></li>
                                <li> <a href="#">오피스2021 Home and Business</a></li>
                                <li> <a href="#">오피스2021 Professional Plus</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            
            

</body>

</html>