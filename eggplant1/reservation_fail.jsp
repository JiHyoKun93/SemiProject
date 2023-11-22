<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>실패...</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/reservation.css" />
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<style type="text/css">
*{
    transition: all 0.6s;
}

body{
    font-family: 'Lato', sans-serif;
    color: black;
    margin: 0;
  background-color: white;
}

#main{
    display: table;
    width: 100%;
    height: 100%;
    text-align: center;
}

.fof{
	  display: table-cell;
	  vertical-align: middle;
}

.fof h1{
	  font-size: 50px;
	  display: inline-block;
	  padding-right: 12px;
	  animation: type .5s alternate infinite;
}

@keyframes type{
	  from{box-shadow: inset -3px 0px 0px #888;}
	  to{box-shadow: inset -3px 0px 0px transparent;}
}

</style>
</head>
	<form action="" name="myForm" method="post">
	
		<div id="container">
			<div id=pageHeader>
				<section class="hbody"><a href="location='<%=cp %>/eggplant/main.do'">
				<img src="<%=cp %>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" /></a>
				<ul id="menu">
					<li class="menu_item1 title-li"><a href="#" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="#" class="link">상품서비스</a></li>
					<li class="menu_item1"><a href="#" class="link">고객센터</a></li>
					
					<li class="menu_item2"><a href="#" class="link">로그인</a></li>
					
				</ul>
				</section>
			</div>
		<div id="mainArticle">
			<div id="main">
				<div class="fof">
					<h1>${message }</h1>
				</div>
			</div>
		</div>
		<input type="hidden" name="userAccount" value="${userAccount }">
		<input type="hidden" name="userName" value="${userName }">

		<div id="pageFooter">
					<div class="content_p">
						<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
						<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리
						<p>
						<p>TEL : 010-2023-0726</p>
					</div>
				</div>
			</div>
<script type="text/javascript">
function redirectToOtherPage() {
	
	f = document.myForm;
	f.action = "<%=cp%>/eggplant/reservation.do"
	f.submit();
  }

  // n초 후에 redirectToOtherPage 함수를 실행합니다.
  setTimeout(redirectToOtherPage, 2500); 
</script>
</form>
</html>