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
<link rel="icon" href="<%=cp %>/image/htmllogo.png" type="image/x-icon">
<title>Eggplant : 비밀번호 찾기</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- !!!!!!!!!!!!!비밀번호찾기!!!!!!!!!!! -->
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	color: #1a1f36;
	box-sizing: border-box;
	word-wrap: break-word;
	font-family: 'NanumSquareAcr';
}
body {
	min-height: 100%;
	background-color: #ffffff;
	font-family: 'NanumSquareAcr';
}
h1 {
	letter-spacing: -1px;
	font-family: 'NanumSquareBold';
	'
}
a {
	color: #9542ED;
	text-decoration: unset;
}
b {
	color: #9542ED;
	font-family: NanumSquareAcr;
}
.cwa{
	display: flex;
    justify-content: flex-end;
}

.login-root {
    background: #fff;
    display: flex;
    width: 100%;
    min-height: 100vh;
    overflow: hidden;
}
.loginbackground {
    min-height: 692px;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    z-index: 0;
    overflow: hidden;
}
.flex-flex {
    display: flex;
}
.align-center {
  align-items: center; 
}
.center-center {
  align-items: center;
  justify-content: center;
}
.box-root {
    box-sizing: border-box;
}
.flex-direction--column {
    -ms-flex-direction: column;
    flex-direction: column;
}
.loginbackground-gridContainer {
    display: -ms-grid;
    display: grid;
    -ms-grid-columns: [start] 1fr [left-gutter] (86.6px)[16] [left-gutter] 1fr [end];
    grid-template-columns: [start] 1fr [left-gutter] repeat(16,86.6px) [left-gutter] 1fr [end];
    -ms-grid-rows: [top] 1fr [top-gutter] (64px)[8] [bottom-gutter] 1fr [bottom];
    grid-template-rows: [top] 1fr [top-gutter] repeat(8,64px) [bottom-gutter] 1fr [bottom];
    justify-content: center;
    margin: 0 -2%;
    transform: rotate(-12deg) skew(-12deg);
}
.box-divider--light-all-2 {
    box-shadow: inset 0 0 0 2px #e3e8ee;
}
.box-background--blue {
    background-color: #B9ABFF;
}
.box-background--white {
  background-color: #ffffff; 
}
.box-background--blue800 {
    background-color: #9966FF;
}
.box-background--gray100 {
    background-color: #e3e8ee;
}
.box-background--cyan200 {
    background-color: #8168FF;
}
.padding-top--64 {
  padding-top: 64px;
}
.padding-top--24 {
  padding-top: 24px;
}
.padding-top--48 {
  padding-top: 48px;
}
.padding-bottom--24 {
  padding-bottom: 24px;
}
.padding-horizontal--48 {
  padding: 48px;
}
.padding-bottom--15 {
  padding-bottom: 15px;
}


.flex-justifyContent--center {
  -ms-flex-pack: center;
  justify-content: center;
}

.formbg {
    margin: 0px auto;
    width: 100%;
    max-width: 448px;
    
    background: white;
    border-radius: 4px;
    box-shadow: rgba(60, 66, 87, 0.12) 0px 7px 14px 0px, rgba(0, 0, 0, 0.12) 0px 3px 6px 0px;
}
span {
    display: block;
    font-size: 20px;
    line-height: 28px;
    color: #1a1f36;
}
label {
    margin-bottom: 10px;
}
.reset-pass a,label {
    font-size: 14px;
    font-weight: 600;
    display: block;
}
.reset-pass > a {
    text-align: right;
    margin-bottom: 10px;
}
.grid--50-50 {
    display: grid;
    grid-template-columns: 50% 50%;
    align-items: center;
}

.field input {
    font-size: 16px;
    line-height: 28px;
    padding: 8px 16px;
    width: 100%;
    min-height: 44px;
    border: unset;
    margin: 5px;
    border-radius: 4px;
    outline-color: rgb(84 105 212 / 0.5);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}

input[type="button"] {
    background-color: rgb(102, 51, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(102, 51, 255) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}
.field-checkbox input {
    width: 20px;
    height: 15px;
    margin-right: 5px; 
    box-shadow: unset;
    min-height: unset;
}
.field-checkbox label {
    display: flex;
    align-items: center;
    margin: 0;
}
a.ssolink {
    display: block;
    text-align: center;
    font-weight: 600;
}
.footer-link span {
    font-size: 14px;
    text-align: center;
}
.listing a {
    color: #697386;
    font-weight: 600;
    margin: 0 10px;
}

.animationRightLeft {
  animation: animationRightLeft 2s ease-in-out infinite;
}
.animationLeftRight {
  animation: animationLeftRight 2s ease-in-out infinite;
}
.tans3s {
  animation: animationLeftRight 3s ease-in-out infinite;
}
.tans4s {
  animation: animationLeftRight 4s ease-in-out infinite;
}

@keyframes animationLeftRight {
  0% {
    transform: translateX(0px);
  }
  50% {
    transform: translateX(1000px);
  }
  100% {
    transform: translateX(0px);
  }
} 

@keyframes animationRightLeft {
  0% {
    transform: translateX(0px);
  }
  50% {
    transform: translateX(-1000px);
  }
  100% {
    transform: translateX(0px);
  }
} 
</style>
<body>
	<form action="" name="myForm" method="post">
  <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            <div class="box-root box-background--blue800 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;"><br/>
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center"><br/><br/>
				<h1>
					<a href="http://blog.stackfindover.com/" rel="dofollow">Eggplant Bank</a>
				</h1>
			</div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15">Search Password</span><br/>
              <form id="stripe-login">
                <div class="field padding-bottom--24">
                  <label for="ID">ID</label>
                  <input type="text" name="userId">
						</div>
						
						<input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="idmessage">
                <span class="padding-bottom--15"></span>
                
						<div class="field padding-bottom--15">
							<label for="Name">Name</label> <input type="text" name="userName">
						</div>
						
						<input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="namemessage">
                <span class="padding-bottom--15"></span>
                
						<div class="field padding-bottom--15">
							<label for="PhoneNum">Phone Number</label> <input type="text"
								name="userPhoneNum">
						</div>
						
						<input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="phonemessage">
						<span class="padding-bottom--15"></span>
						
						<div style="display: flex; justify-content: flex-end;"></div>
						<div class="field padding-bottom--24">
							<input type="button" value="Continue" onclick="searchpw();">
						</div>
					</div>
				</div>
			</div>
			<div class="footer-link padding-top--24">
				 <span>© <a href="<%=cp %>/eggplant1/main.jsp">Eggplant Bank</a> | <a href="<%=cp %>/eggplant1/mmmmap.jsp">Contact</a> | <a href="<%=cp %>/eggplant1/privacy.jsp">Privacy & terms</a></span>
			</div>
		</div>
	</form>

	<script type="text/javascript">

	function searchpw(){
	
		var f = document.myForm;
		
		if(!f.userId.value){
			var data = "아이디를 입력하세요.";
			document.getElementById("idmessage").value = data;
			f.userId.focus();
			return;
		}
		
		if(!f.userName.value){
			var data = "이름을 입력하세요.";
			document.getElementById("namemessage").value = data;
			f.userName.focus();
			return;
		}
	
		if(!f.userPhoneNum.value){
			var data = "전화번호를 입력하세요.";
			document.getElementById("phonemessage").value = data;
			f.userPhoneNum.focus();
			return;
		}
		f.action = "<%=cp %>/eggplant/searchpw_ok.do";
		f.submit();
	
	}
</script>
</body>
</html>

