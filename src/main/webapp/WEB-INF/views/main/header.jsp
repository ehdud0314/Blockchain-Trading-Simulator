<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

<%-- 
jsp:include 를 사용하는 페이지에서는 <link> 태그를 넣지 말라.
header 내용은 header에만 하기

--%>

<script>
	$(function() {
		$('ul .menu').each(function() {
			$(this).css("cursor", "pointer");
			$(this).on("click", function() {
				var link = $(this).children(".menutext").attr("href");
				location.href = link;
			})
		});
	})
</script>
<header>
<div class="behindheader"></div><br>
	<div class="header">
	<div class="h_left">
		<ul>
			<li class="logo"><a href="<%=request.getContextPath()%>/mainpage"><img width="120px" height="50px"
					src="<%=request.getContextPath()%>/resources/assets/img/bts_logo.svg" style="vertical-align:middle;"></a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/aboutus">About Us</a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/investmentpage">모의투자</a></li>
			<li class="menu"><a class="menutext" href="${pageContext.request.contextPath}/nlist?news_keyword=">뉴스</a></li>
			<li class="menu"><a class="menutext" href="javascript:void(window.open('<%=request.getContextPath()%>/prochart', '_blank','width=1300px, height=800px'))">프로차트</a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/clist">커뮤니티</a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/insta">소우주</a></li>
			<li class="menu"><a class="menutext" href="${pageContext.request.contextPath}/cashShop">충전소</a></li>
			<li class="menu"><a class="menutext" href="${pageContext.request.contextPath}/rankDaily">랭킹</a></li>
		</ul>
	</div>
	<div class="h_right">
		<c:choose>
			<c:when test="${loginMember == null }">
				<ul>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/login" id="login">로그인</a></li>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/signup" id="signup">회원가입</a></li>
				</ul>
			</c:when>
			<c:when test="${loginMember eq 'admin' }">
				<ul>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/logout" id="logout">로그아웃</a></li>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/admin">관리자</a></li>
				</ul>
			</c:when>
			<c:when test="${loginMember != null }">
				<ul>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/logout" id="logout">로그아웃</a></li>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/mypage">마이페이지</a></li>
				</ul>
			</c:when>
		</c:choose>
	</div>
</div>
<%-- <jsp:include page="../investment/sell.jsp"></jsp:include>
<jsp:include page="../investment/buy.jsp"></jsp:include> --%>
</header>