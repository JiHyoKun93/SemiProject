<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var time = 600; // 10분을 초로 나타낸 값
	var min;
	var sec;
	
	var x = setInterval(function() {
		min = Math.floor(time / 60);
		sec = time % 60;
		
		document.getElementById("demo").innerHTML = min + "분 " + sec + "초";
		time--;
		
		if(time < 0) {
			clearInterval(x);
			document.getElementById("demo").innerHTML = "10분이 경과하여 자동으로 로그아웃되었습니다.<br/>이용해주셔서 감사합니다.";
			
		}
	}, 1000);
</script>
</head>
<body>
<font color="blue"><b>${sessionScope.customInfo.userName }</b></font>님 반갑습니다.<br/><br/><br/>
	<div id="demo"></div>
	
<br/><br/>
	
<input type="button" value=" 계좌조회 " class="btn btn-outline-primary" for="btncheck1"
	onclick="location='<%=cp%>/eggplant/accountCheck.do';"/>
	<input type="button" value=" 돌아가기 " class="btn btn-outline-primary" for="btncheck1"
	onclick="location='<%=cp%>/eggplant/main.do';"/>
</body>
</html>

