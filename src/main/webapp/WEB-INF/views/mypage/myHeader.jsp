<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    	#myM {
    		width: 1240px;
    		margin: 0 auto;
    		text-align: center;
    	}
    	#myM ul {
    		padding : 0;
    	}
        #myM li {
        	box-sizing: border-box;
            list-style-type: none;
            float: left;
            width: 206.6px;
        }
        #myM a {
        	text-decoration: none;
        }

    </style>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
    <div id="myM">
        <h2>마이 페이지</h2>
        <ul>
            <li><a href="mi">나의 정보</a></li>
            <li><a href="mpu">비밀번호 변경</a></li>
            <li><a href="me">나의 자산</a></li>
            <li><a href="mc">나의 게시글</a></li>
            <li><a href="mr">나의 댓글</a></li>
            <li><a href="#">충전 내역</a></li>
        </ul>
        <hr style="clear: both;">
    </div>
</body>
</html>