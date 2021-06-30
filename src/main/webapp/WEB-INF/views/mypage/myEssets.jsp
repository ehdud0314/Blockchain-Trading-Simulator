<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<style>
#me {
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	margin: 25px auto;
	background-color: #fff;
    border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

#me div {
	width: 900px;
	height : 50px;
	margin: 0 auto;
	
}

#me ul {
	padding: 0;
}

#me li {
	list-style-type: none;
	float: left;
	width : 300px;
	box-sizing: border-box;
}

#me li:nth-last-of-type(2), #me li:nth-last-of-type(3) {
	border-right: solid black 1px;
}

#me table {
	margin: 10px auto 0 auto;
}
</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="me">
			<h2>
				<img width="30px" height="30px"> 내 계좌번호 : ${acnt.acntno }
			</h2>
			<br>
			<div>
				<ul>
					<li><img width="30px" height="30px">코인 보유액 000원</li>
					<li><img width="30px" height="30px">현금 보유액 ${acnt.cybcash }원</li>
					<li><img width="30px" height="30px">총액 22222원</li>
				</ul>
			</div>
			<table>
				<tr>
					<th>거래 구분</th>
					<th>종목</th>
					<th>수량</th>
					<th>단가</th>
					<th>총 거래액</th>
					<th>거래 일시</th>
				</tr>
				<tr>
					<td>매수</td>
					<td>DOGE</td>
					<td>2.333332</td>
					<td>520 원</td>
					<td>1040.666664 원</td>
					<td>2021-02-22</td>
				</tr>
			</table>
		</div>
	</div>
</html>