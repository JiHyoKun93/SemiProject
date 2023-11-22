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
<title>대출 승인</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=PT+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/loan4.css" />

<script type="text/javascript">
	
	function sendIt() {
		
		var f = document.myForm;
		

		f.action = "<%=cp%>/eggplant/loan_ok2.do";
		f.submit();
	}
</script>



<style type="text/css">
   

    body {
      font-family: Arial, sans-serif;
      
     
      padding: 0;
    }

    .container {
     width: 1000px;
  height: 600px;
      max-width: 900px;
      margin: 50px auto;
     
      padding: 20px;
      border-radius: 8px;
      
    }

    .header {
     height: 100px;
      text-align: center;
      margin-bottom: 20px;
    }

    .header h1 {
   
      font-size: 32px;
      color: #000000;
      margin: 0;
    }

    .content {
      text-align: center;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 8px;
    }

    .result {
    
    height: 150px;
      font-size: 20px;
      margin-top:50px;
      color: #333333;
    }

    .result span {
   
      color: #ff0000;
      font-weight: bold;
    }

    .button-container {
      text-align: center;
      margin-top: 20px;
    }

    .button-container input[type="button"] {
    
       background-color: rgb(102, 51, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(102, 51, 255) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
      height: 40px;
      width: 140px;
      margin-right: 10px;
      font-size: 16px;
      font-weight: bold;
      color: #ffffff;
    
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .button-container input[type="button"]:last-child {
      margin-right: 0;
    }
</style>
</head>
<body>
<form action="" method="post" name="myForm" >

<div id="container">
			<div id=pageHeader>
				<section class="hbody"> 
				<a href="<%=cp %>/eggplant/main.do"><img src="<%=cp%>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" /></a>
				<ul id="menu">
					<c:if test="${empty customInfo}">
					<li class="menu_item1 title-li"><a href="<%=cp %>/eggplant/login.do" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/card.do" class="link">카드</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/login.do" class="link">상품 서비스</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/login.do" class="link">환율</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/board.do" class="link">고객 센터</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/map.do" class="link">오시는 길</a></li>
					<li class="menu_item2"><a href="<%=cp %>/eggplant/login.do" class="link">로그인</a></li>
					</c:if>
					<c:if test="${not empty customInfo}">
					<li class="menu_item1 title-li"><a href="<%=cp %>/eggplant/accountCheck.do" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/card.do" class="link">카드</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/loan.do" class="link">상품 서비스</a></li>
					<li class="menu_item1"><a onclick="sendExchange();" class="link">환율</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/board.do" class="link">고객 센터</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/map.do" class="link">오시는 길</a></li>
					<li class="menu_item3">${customInfo.userName}님 환영합니다.</li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/mypage.do" class="link">MyPage</a></li>
					<li class="menu_item2"><a href="<%=cp %>/eggplant/logout.do" class="link">로그아웃</a></li>
					</c:if>
				</ul>
				</section>
			</div>

<div id="mainArticle">


<br/>
<h1 align="center">&nbsp;대출 승인 완료</h1>
<hr color="blue" width="200">
<br/>
<br/>
<br/>


<!-- CONTENT -->
<main id="l-content">
	<div id="l-constrained">
		<div class="credit-card__container">
			<div class="credit-card">
				<div class="credit-card__header">
					<img class="ship-card" src="https://xgjzloifyvgpbmyonaya.supabase.co/storage/v1/object/public/files/7cjpV_BXbz/original" alt="ship card">
					<img class="master-card" src="https://xgjzloifyvgpbmyonaya.supabase.co/storage/v1/object/public/files/wROkdug6ax/original" alt="ship card">
				</div>
				<div class="credit-card__form">
					<form action="">
						
			<div  style="font-size: 25px;color: white; ">
			 "${dto.userId}"님의 대출 진행 결과
			 <b><span style="color: red">"${loannum}"</span></b>(원)이
			 <br/> "${param.account}" 계좌에
   			 정상적으로 입금되었습니다.<br/> "${dto.userId}"님의 누적 대출 금액은
   			 <b><span style="color: red">"${loans}"</span></b>(원)입니다.
   			 </div>
						<div class="field">
							<label for="card-holder-name">행복한 하루 보내세요!</label>
							
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	<div class="button-container">
    <input type="button" value="메인 페이지" onclick="location='<%=cp %>/eggplant/main.do';">
  </div>
</main>

  
  
  
  
  
  
  
  </div>
	</div>
	
  <br/><br/><br/><br/>
  <br/><br/><br/><br/>
  <br/><br/><br/><br/>
 


  
  <div id="pageFooter">
			<div class="content_p">
			<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
			<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리<p>
			<p>TEL : 010-2023-0726</p>
			</div>
		</div>
</form>
  
<script src="<%=cp%>/data/eggplantLink.js"></script>
</body>
</html>