<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

#coinTable {
	width : 80%;
	border: 1px solid black;
	border-collapse: collapse;
}

#coinTable th, td {
	border: 1px solid black;
	padding: 10px;
}

.historyTable {
	width : 80%;
	border: 1px solid black;
	border-collapse: collapse;
}

.historyTable th, td {
	border: 1px solid black;
	padding: 10px;
}





.tabmenu{ 
  max-width:100%; 
  margin: 0 auto; 
/*   position:relative;  */
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}



</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="me">
			<h2>
				<img src="${pageContext.request.contextPath}/resources/assets/img/icon_acnt.svg" width="30px" height="30px"> 내 계좌번호 : ${acnt.acntno }
			</h2>
			<br>
			<div>
				<ul>
					<li><img src="${pageContext.request.contextPath}/resources/assets/img/icon_bitcoin.svg" width="30px" height="30px">코인 보유액&nbsp; ${totalCoin }&nbsp;&nbsp;&nbsp;원</li>
					<li><img src="${pageContext.request.contextPath}/resources/assets/img/icon_won.svg" width="30px" height="30px">현금 보유액&nbsp; ${acnt.cybcash }&nbsp;&nbsp;&nbsp;원</li>
					<li><img src="${pageContext.request.contextPath}/resources/assets/img/icon_wallet.svg" width="30px" height="30px">총 보유자산 &nbsp; ${totalAssets }&nbsp;&nbsp;&nbsp;원</li>
				</ul>
			</div>


<div class="tabmenu">
	<ul>
		<li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
			<label for="tabmenu1">보유코인 목록</label>
				<div class="tabCon" >
					<table id="coinTable">
						<tr>
							<th>보유코인</th>
							<th>보유수량</th>
							<th>매수평균가</th>
							<th>매수금액</th>
							<th>평가금액</th>
							<th>평가손익</th>
						</tr>
						<c:if test="${coinListCount eq 0 }">
							<tr>
								<td colspan="6" align="center"><br> <br> 
								보유한 코인이 없습니다.<br> <br></td>
							</tr>
						</c:if>
						<c:if test="${coinListCount ne 0 }">
							<c:forEach var="coin" items="${coinList }" varStatus="status">
								<tr>
									<td class="coinName">${coin.coin }</td>
									<td class="coinCount"><fmt:formatNumber value="${coin.buycnt }" pattern="#,###,###,###" /></td>
									<td><fmt:formatNumber value="${coin.buyprice }" pattern="#,###,###,###" />&nbsp;원</td>
									<td>
										<fmt:formatNumber value="${coin.buycnt*coin.buyprice }" pattern="#,###,###,###" />&nbsp;원
										<input class="buyAvg" type="hidden" value="${coin.buycnt*coin.buyprice }"/>
									</td>
									<td class="coinValue">
										평가금액 : api 이용해서 js로 처리
									</td>
									<td class="coinProfit">
										평가손익 : api 이용해서 js로 처리
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
		</li>
		<li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
			<label for="tabmenu2">체결</label>
			<div class="tabCon" >
				<h3>체결 매수주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="blist" items="${boughtResult }" varStatus="status">
						<tr>
							<td>${blist.ubno }</td>
							<td>${blist.coin }</td>
							<td><fmt:formatNumber value="${blist.buycnt }" pattern="#,###,###,###" /></td>
							<td><fmt:formatNumber value="${blist.buyprice }" pattern="#,###,###,###" />&nbsp;원</td>
							<td>${blist.bdate }</td>
						</tr>
					</c:forEach>
				</table>
				
				<h3>체결 매도주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="slist" items="${soldResult }" varStatus="status">
						<tr>
							<td>${slist.usno }</td>
							<td>${slist.coin }</td>
							<td><fmt:formatNumber value="${slist.sellcnt }" pattern="#,###,###,###" /></td>
							<td><fmt:formatNumber value="${slist.sellprice }" pattern="#,###,###,###" />&nbsp;원</td>
							<td>${slist.sdate }</td>
						</tr>
					</c:forEach>
				</table>  
			</div>
		</li>    
		<li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
			<label for="tabmenu3">미체결</label>
			<div class="tabCon" >
				<h3>미체결 매수주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="wblist" items="${wBoughtResult }" varStatus="status">
						<tr>
							<td>${wblist.ubno }</td>
							<td>${wblist.coin }</td>
							<td><fmt:formatNumber value="${wblist.buycnt }" pattern="#,###,###,###" /></td>
							<td><fmt:formatNumber value="${wblist.buyprice }" pattern="#,###,###,###" />&nbsp;원</td>
							<td>${wblist.wbdate }</td>
						</tr>
					</c:forEach>
				</table>
				
				<h3>미체결 매도주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="wslist" items="${wSoldResult }" varStatus="status">
						<tr>
							<td>${wslist.usno }</td>
							<td>${wslist.coin }</td>
							<td><fmt:formatNumber value="${wslist.sellcnt }" pattern="#,###,###,###" /></td>
							<td><fmt:formatNumber value="${wslist.sellprice }" pattern="#,###,###,###" />&nbsp;원</td>
							<td>${wslist.wsdate }</td>
						</tr>
					</c:forEach>
				</table>	
			</div>
		</li>
	</ul>
</div>


<!--  			
			<h2>보유코인 목록</h2>
			<table id="coinTable">
				<tr>
					<th>보유코인</th>
					<th>보유수량</th>
					<th>매수평균가</th>
					<th>매수금액</th>
					<th>평가금액</th>
					<th>평가손익</th>
				</tr>
				<c:if test="${coinListCount eq 0 }">
					<tr>
						<td colspan="6" align="center"><br> <br> 
						보유한 코인이 없습니다.<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${coinListCount ne 0 }">
					<c:forEach var="coin" items="${coinList }" varStatus="status">
						<tr>
							<td class="coinName">${coin.coin }</td>
							<td class="coinCount"><fmt:formatNumber value="${coin.buycnt }" pattern="#,###,###,###" /></td>
							<td><fmt:formatNumber value="${coin.buyprice }" pattern="#,###,###,###" />&nbsp;원</td>
							<td>
								<fmt:formatNumber value="${coin.buycnt*coin.buyprice }" pattern="#,###,###,###" />&nbsp;원
								<input class="buyAvg" type="hidden" value="${coin.buycnt*coin.buyprice }"/>
							</td>
							<td class="coinValue">
								평가금액 : api 이용해서 js로 처리
							</td>
							<td class="coinProfit">
								평가손익 : api 이용해서 js로 처리
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			<h2>미체결</h2>
			
			<h3>미체결 매수주문내역</h3>
			<table class="historyTable">
				<tr>
					<th>접수번호</th>
					<th>코인종류 </th>
					<th>코인개수 </th>
					<th>매수가격 </th>
					<th>매수날짜 </th>
				</tr>
				<c:forEach var="wblist" items="${wBoughtResult }" varStatus="status">
					<tr>
						<td>${wblist.ubno }</td>
						<td>${wblist.coin }</td>
						<td><fmt:formatNumber value="${wblist.buycnt }" pattern="#,###,###,###" /></td>
						<td><fmt:formatNumber value="${wblist.buyprice }" pattern="#,###,###,###" />&nbsp;원</td>
						<td>${wblist.wbdate }</td>
					</tr>
				</c:forEach>
			</table>
			
			<h3>미체결 매도주문내역</h3>
			<table class="historyTable">
				<tr>
					<th>접수번호</th>
					<th>코인종류 </th>
					<th>코인개수 </th>
					<th>매수가격 </th>
					<th>매수날짜 </th>
				</tr>
				<c:forEach var="wslist" items="${wSoldResult }" varStatus="status">
					<tr>
						<td>${wslist.usno }</td>
						<td>${wslist.coin }</td>
						<td><fmt:formatNumber value="${wslist.sellcnt }" pattern="#,###,###,###" /></td>
						<td><fmt:formatNumber value="${wslist.sellprice }" pattern="#,###,###,###" />&nbsp;원</td>
						<td>${wslist.wsdate }</td>
					</tr>
				</c:forEach>
			</table>
			
			<h2>체결</h2>
			
			<h3>체결 매수주문내역</h3>
			<table class="historyTable">
				<tr>
					<th>접수번호</th>
					<th>코인종류 </th>
					<th>코인개수 </th>
					<th>매수가격 </th>
					<th>매수날짜 </th>
				</tr>
				<c:forEach var="blist" items="${boughtResult }" varStatus="status">
					<tr>
						<td>${blist.ubno }</td>
						<td>${blist.coin }</td>
						<td><fmt:formatNumber value="${blist.buycnt }" pattern="#,###,###,###" /></td>
						<td><fmt:formatNumber value="${blist.buyprice }" pattern="#,###,###,###" />&nbsp;원</td>
						<td>${blist.bdate }</td>
					</tr>
				</c:forEach>
			</table>
			
			<h3>체결 매도주문내역</h3>
			<table class="historyTable">
				<tr>
					<th>접수번호</th>
					<th>코인종류 </th>
					<th>코인개수 </th>
					<th>매수가격 </th>
					<th>매수날짜 </th>
				</tr>
				<c:forEach var="slist" items="${soldResult }" varStatus="status">
					<tr>
						<td>${slist.usno }</td>
						<td>${slist.coin }</td>
						<td><fmt:formatNumber value="${slist.sellcnt }" pattern="#,###,###,###" /></td>
						<td><fmt:formatNumber value="${slist.sellprice }" pattern="#,###,###,###" />&nbsp;원</td>
						<td>${slist.sdate }</td>
					</tr>
				</c:forEach>
			</table>  
-->
		
		</div>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/myEssets.js"></script>
</body>
</html>