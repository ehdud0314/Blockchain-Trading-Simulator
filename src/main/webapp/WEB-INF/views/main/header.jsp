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
			<li class="menu"><a href="#">뉴스</a></li>
			<li class="menu"><a href="#">프로차트</a></li>
			<li class="menu"><a href="<%=request.getContextPath()%>/clist">커뮤니티</a></li>
			<li class="menu"><a href="#">충전소</a></li>
		</ul>
	</div>
	<div class="h_right">
		<c:choose>
			<c:when test="${loginMember == null }">
				<ul>
					<li class="member"><button>로그인</button></li>
					<li class="member"><button>회원가입</button></li>
				</ul>
			</c:when>
			<c:when test="${loginMember != null }">
				<input type="image" src="http://placehold.it/60x60">
				<ul>
					<li class="member"><button>로그아웃</button></li>
					<li class="member"><button>회원가입</button></li>
				</ul>
			</c:when>
		</c:choose>
	</div>
</header>
