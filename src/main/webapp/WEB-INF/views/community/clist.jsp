<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTS</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=listForm]').on(
				'submit',
				function(e) {
					if ($('input[name=keyword]').val() == null|| $('input[name=keyword]').val() == "") {
						alert("검색어를 입력해 주세요");
						e.preventDefault();
					} else {
						return true;
					}
				});
	});
	function showInsertForm() {
		location.href = "cwriteForm";
	}
</script>
<style>
.comm {
	margin: 40px 0 20px 20px;
	text-align: left;
	font-size: 25px;
	color: #8C66C8;
	float: left;
}

#write {
width: 125px;
	height: 35px;
	float: right;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #B85CEF;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#write:hover {
	background-color: #CC70EF;
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#searchType {
	width: 80px;
	height: 35px;
	border: 2px solid #8C66C8;
	font-size: 18px;
	color: #99ADB6;
	margin-top: 20px;
	padding: 0;
	float: left;
	text-align: left;
	clear: both;
}

#searchType:hover, #searchType:focus {
	color: black;
	transition: color 0.15s ease-in-out;
}

#search {
	width: 650px;
	height: 35px;
	top: 0;
	background-color: #ffffff;
	border: 2px solid #8C66C8;
	font-size: 18px;
	margin-top: 20px;
	padding: 0;
	float: left;
}

#search:hover, #search:focus {
	color: black;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#btnsearchVal {
	background-image:
		url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png);
	background-size: contain;
	background-position: 10px center;
	background-repeat: no-repeat;
	text-indent: 0;
}

#btnsearch {
	width: 70px;
	height: 35px;
	padding: 0;
	border: 2px solid #8C66C8;
	font-size: 18px;
	color: #99ADB6;
	background-color: #ffffff;
	margin-top: 20px;
	float: left;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#btnsearch:hover, #btnsearch:focus {
	color: black;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

.popularTable {
	margin: 10px auto 10px; 20px;
	clear: both;
	width: 1200px;
	border-collapse: collapse;
}

.ctable {
	margin: 30px auto 30px; 20px;
	clear: both;
	width: 1200px;
	border-collapse: collapse;
}
</style>
</head>
<%@include file="../main/header.jsp"%>
<body class="content" style="background-image:url(resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: cover;">
	<div style="width: 1240px; background-color: #ffffff; margin: 70px auto; padding: 20px; border-radius: 4px;">
		
		<div class="comm">커뮤니티</div>
					<br><br><br><br><br>
		<!-- 조회수 상위 5개 인기 게시글 -->
		<c:if test="${listCount ne 0}">
			<hr>
			<table class="popularTable">
				<c:forEach var="vo" items="${plist}" varStatus="status">
					<tr>
						<td align="center" width="60">${vo.cno}</td>
						<td align="left" width="360"><a
							href="cDetail?cno=${vo.cno}&page=${currentPage}">
								&nbsp;${vo.csubject} </a>${vo.replycnt}</td>
						<td align="center" width="100">${vo.cwriter}</td>
						<td align="center" width="120">${vo.cdate}</td>
						<td align="center" width="60">${vo.viewcnt}</td>
						<td align="center" width="60">${vo.likecnt}</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</c:if>
		
		<form action="clist" name="listForm" method="get">
			<select id="searchType" name="searchType">
				<option value="1">글제목</option>
				<option value="2">글내용</option>
				<option value="3">작성자</option>
			</select> <input type='search' id="search" name="keyword">
			<button type=submit id="btnsearch"><p id="btnsearchVal"></p></button>
		</form>

		<input type="hidden" name="page" value="${currentPage}"> <input
			type="button" id="write" value="글쓰기" onclick="window.location='cWriteForm'">

		<table class="ctable">
			<tr>
				<td align="center" width="60">번호</td>
				<td align="center" width="360">제목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="60">조회</td>
				<td align="center" width="60">추천</td>
			</tr>
			<!-- 글이 없을 경우 -->
			<c:if test="${listCount eq 0}">
				<tr>
					<td colspan="6" align="center"><br> <br> 게시판에 저장된 글이없습니다.<br> <br></td>
				</tr>
			</c:if>
			<c:if test="${listCount ne 0}">
				<c:forEach var="vo" items="${list}" varStatus="status">
					<tr>
						<td align="center">${vo.cno}</td>
						<td align="left"><a
							href="cDetail?cno=${vo.cno}&page=${currentPage}">
								&nbsp;${vo.csubject} </a>${vo.replycnt}</td>
						<td align="center">${vo.cwriter}</td>
						<td align="center">${vo.cdate}</td>
						<td align="center">${vo.viewcnt}</td>
						<td align="center">${vo.likecnt}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 앞 페이지 번호 처리 -->
		<c:if test="${currentPage <= 1}">
[이전]&nbsp;
</c:if>
		<c:if test="${currentPage > 1}">
			<c:url var="clistST" value="clist">
				<c:param name="page" value="${currentPage-1}" />
			</c:url>
			<a href="${clistST}">[이전]</a>
		</c:if>
		<!-- 끝 페이지 번호 처리 -->
		<c:set var="endPage" value="${maxPage}" />
		<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
			<c:if test="${p eq currentPage}">
				<font color="#8C66C8" size="4"><b>[${p}]</b></font>
			</c:if>
			<c:if test="${p ne currentPage}">
				<c:url var="clistchk" value="clist">
					<c:param name="page" value="${p}" />
				</c:url>
				<a href="${clistchk}">${p}</a>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage >= maxPage}">
[다음]
</c:if>
		<c:if test="${currentPage < maxPage}">
			<c:url var="clistEND" value="clist">
				<c:param name="page" value="${currentPage+1}" />
			</c:url>
			<a href="${clistEND}">[다음]</a>
		</c:if>
		
				<form action="clist" name="listForm" method="get">
			<select id="searchType" name="searchType">
				<option value="1">글제목</option>
				<option value="2">글내용</option>
				<option value="3">작성자</option>
			</select> <input type='search' id="search" name="keyword">
			<button type=submit id="btnsearch">검색</button>
		</form>
				<input type="hidden" name="page" value="${currentPage}"> <input
			type="button" id="write" value="글쓰기" onclick="window.location='cWriteForm'">
	</div>
</body>
<%@include file="../main/footer.jsp"%>
</html>