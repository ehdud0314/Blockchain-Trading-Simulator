<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<header>
	<div class="h_left">
		<ul>
			<li class="logo"><a href="<%=request.getContextPath()%>/blist"><img
					src="http://placehold.it/120x50"></a></li>
			<li class="menu"><a href="<%=request.getContextPath()%>/aboutus">About Us</a></li>
			<li class="menu"><a href="#">모의투자</a></li>
			<li class="menu"><a href="${pageContext.request.contextPath}/nlist">뉴스</a></li>
			<li class="menu"><a href="#">프로차트</a></li>
<<<<<<< HEAD
			<li class="menu"><a href="<%=request.getContextPath()%>/clist">커뮤니티</a></li>
			<li class="menu"><a href="#">충전소</a></li>
=======
			<li class="menu"><a href="#">커뮤니티</a></li>
			<li class="menu"><a href="${pageContext.request.contextPath}/cashShop">충전소</a></li>
			<li class="menu"><a href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
>>>>>>> 37fc25fda5b63e2bb6391c89592f81d5957d2f12
		</ul>
	</div>
	<div class="h_right">
		<c:choose>
			<c:when test="${loginMember == null }">
				<ul>
					<li class="member"><a href="<%=request.getContextPath()%>/login" id="login">로그인</a></li>
					<li class="member"><a href="<%=request.getContextPath()%>/signup" id="signup">회원가입</a></li>
				</ul>
			</c:when>
			<c:when test="${loginMember != null }">
				<ul>
					<li class="member"><a href="<%=request.getContextPath()%>/logout" id="logout">로그아웃</a></li>
					<li class="member"><a href="#">마이페이지</a></li>
				</ul>
			</c:when>
		</c:choose>
	</div>
</header>
