<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<title>BTS</title>
<style type="text/css">
* {
	background-color: black;
}
</style>
</head>
<body>
	<!-- TradingView Widget BEGIN -->
	<div class="tradingview-widget-container">
		<div id="tradingview_122cd"></div>
		<div class="tradingview-widget-copyright">
			TradingView 제공 <a
				href="https://kr.tradingview.com/symbols/BTCKRW/?exchange=BITHUMB"
				rel="noopener" target="_blank"><span class="blue-text">BTCKRW
					차트</span></a>
		</div>
		<script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
		<script type="text/javascript">
			new TradingView.widget({
				"width" : 1200,
				"height" : 750,
				"symbol" : "BITHUMB:BTCKRW",
				"timezone" : "Etc/UTC",
				"theme" : "dark",
				"style" : "1",
				"locale" : "kr",
				"toolbar_bg" : "#f1f3f6",
				"enable_publishing" : true,
				"withdateranges" : true,
				"range" : "YTD",
				"hide_side_toolbar" : false,
				"allow_symbol_change" : true,
				"details" : true,
				"hotlist" : true,
				"calendar" : true,
				"container_id" : "tradingview_122cd"
			});
		</script>
	</div>
	<!-- TradingView Widget END -->
</body>
</html>