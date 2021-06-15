<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
<h2>비밀번호 확인</h2>
<form action="#" method="post">
    <input type="text" placeholder="비밀번호를 입력하세요" name="password">
    <button type="submit">확인</button>
</form>
</body>
</html>