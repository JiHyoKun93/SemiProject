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
<title>빠른 답변</title>
<!-- 기본 스타일 -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/question.css"/>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<!-- 움직이는 아이콘 -->
<script src="https://kit.fontawesome.com/171f74c68f.js" crossorigin="anonymous"></script>
<!--폰트링크
font-family: 'NanumSquareLight';
font-family: 'NanumSquare';
font-family: 'NanumSquareBold';
font-family: 'NanumSquareExtraBold';
font-family: 'NanumSquareAcb';
font-family: 'NanumSquareAceb';
font-family: 'NanumSquareAcl';
font-family: 'NanumSquareAcr';
 -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<style>
  body {
    font-family: 'NanumSquareAceb';
    font-size: 16px;
    margin: 0;
    padding: 20px;
  }
  
  /* 추가적인 스타일링을 원하는 경우 여기에 작성합니다. */
</style>





<script type="text/javascript">
	
	function sendIt() {
		
		var f = document.myForm;
		
		str = f.userId.value;
		
		f.action = "<%=cp%>/eggplant/selectQuestion_ok.do";
		f.submit();
	}

    function closeTabClick() {
    	// 변수를 close해 새창을 닫음
    	myWindow.close();
    }

</script>


</head>



<body>



<form action="<%=cp%>/eggplant/selectQuestion_ok.do" method="post" name="myFrom">
<table border="0" style="margin: auto;" width="100%" height="100%" cellpadding="10">
	<tr>
		<td height="50" valign="middle">
			<img style="width: 130px; height: 50px;" src="<%=cp%>/image/sideLogo.png">
		</td>
		<td align="right">
		<a href="" onclick="window.close();"><i class="fa-regular fa-rectangle-xmark fa-bounce fa-2xl" style="color: #c55ed9; padding-right: 20px;"></i></a>
		</td>
	</tr>
	<tr>
		<td align="center" height="100" colspan="3" class="td-bgcolor1" valign="middle">
		<h3 style="
font-family: 'NanumSquareAceb'; font-size: 25pt;">안녕하세요! ${sessionScope.customInfo.userName }님<br/> 무엇을 도와드릴까요?</h3>
		</td>
	</tr>
	
	<tr height="400">
		<td colspan="3" align="center" valign="middle">
			
			<c:choose>
  				<c:when test="${count eq 1}">
  				<button type="submit" class="custom-btn btn-15 cu-btn-size1" value="입출금" name="boardTitle">입 / 출금</button><br/>
    		
    				<button type="submit" class="custom-btn btn-15 cu-btn-size1" value="대출" name="boardTitle">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출</button><br/>
    				<button type="submit" class="custom-btn btn-15 cu-btn-size1" value="인증/보안" name="boardTitle">인증/보안</button><br/>
    				<button type="submit" class="custom-btn btn-15 cu-btn-size1" value="기타" name="boardTitle">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타</button><br/>
					<input type="hidden" value="1" name="count"/>
  				</c:when>
  
  				<c:when test="${count eq 2}">
						<c:forEach var="dto" items="${lists }">
						<button type="submit" class="custom-btn btn-15 cu-btn-size1" style="font-size: 12pt;" value="${dto.subject }" name="subject">${dto.subject }</button><br/>
						</c:forEach>
						<input type="hidden" value="2" name="count"/>
 				 </c:when>
  
  				<c:when test="${count eq 3}">
						<c:forEach var="dto" items="${lists }">
						<button type="submit" class="custom-btn btn-15 cu-btn-size1" style="font-size: 10pt;">${dto.content1 }</button><br/>
						</c:forEach>
					<input type="hidden" value="3" name="count"/>
  				</c:when>
  
 				 <c:when test="${count eq 4}">
					<b style="font-size: 20pt;">이용해 주셔서 감사합니다.</b><br/><br/><br/><br/>
					<b style="font-size: 15pt;">더 궁금한 내용이 있다면 아래버튼을 눌러주세요!</b><br/><br/><br/>
					
					<button class="custom-btn btn-2"><b style="font-family: NanumSquare">처음으로</b></button>
					
					<input type="hidden" value="0" name="count"/>
  				</c:when>
			</c:choose>
			
		</td>
	</tr>
	
	<tr>
		<td style="background-color: #F5F6F7" colspan="2" align="center" height="50">
		<font>EGGPLANT</font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#7D7D7D" style=" font-family: 'NanumSquare'; font-size: 11pt;]">Copyright ⓒEggplant. All Rights Reserved.</font>
		</td>
	</tr>
	
	
</table>

</form>



</body>
</html>