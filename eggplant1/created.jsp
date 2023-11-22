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
<title>Eggplant Bank : 회원가입</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png" /><!-- !!!!!!!!!!!!!회원가입!!!!!!!!!!! -->
<style type="text/css">
* {
  padding: 0;
  margin: 0;
  color: #1a1f36;
  box-sizing: border-box;
  word-wrap: break-word;
  font-family: NanumSquareAcr;
}
body {
    min-height: 100%;
    background-color: #ffffff;
}
h1 {
    letter-spacing: -1px;
   	font-family: NanumSquareAceb;
}
a {
  color: #9542ED;
  text-decoration: unset;
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




<html>
<head>
  <meta charset="utf-8">
  <title>Eggplant Bank: Sign in</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>

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
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="<%=cp%>/eggplant/main.do">Eggplant Bank</a></h1>
        </div>
		<div class="formbg-outer">
 		 <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15">Create a Eggplant Account</span>
            <div style="display: flex; justify-content: flex-end;">
		  </label>
		  </div>
      <div id="stripe-login">
        <div class="field padding-bottom--24">
          <label for="Account Number">Account Number [숫자 5자리]</label>
          <font style="font-size: 9pt; font-weight: bold;">&nbsp;&nbsp;223-07-</font><input type="text" name="account" value="">
        </div>
        
        <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="anmessage">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Account Password">Account Password [****]</label>
          <input type="password" name="creditPassword"><br/>
        </div>
        
        <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="apmessage">
        <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Name">Full Name</label>
          <input type="text" name="userName">
        </div>
      
              <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="fnmessage">
                <span class="padding-bottom--15"></span>
      
        <div class="field padding-bottom--24">
          <label for="ID">ID [대소문자, 6-12자]</label>
          <input type="text" name="userId">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="idmessage">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Password">Password [대소문자, 특수문자, 6-12자]</label>
          <input type="password" name="userPassword">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="pw1message">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Password">Password [대소문자, 특수문자, 6-12자]</label>
          <input type="password" name="userPassword2">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="pw2message">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Address">Address</label>
          <input type="text" name="userAddr" value="${dto.UserAddr }">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="admessage">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Phone Number">Phone Number [010-1234-5678]</label>
          <input type="text" name="userPhoneNum" value="${dto.UserPhoneNum }">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="pnmessage">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="E-mail">E-mail</label>
          <input type="text" name="userEmail" value="${dto.UserEmail }">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="emessage">
                <span class="padding-bottom--15"></span>
        
        <div class="field padding-bottom--24">
          <label for="Birth">Birth [YYYY-MM-DD]</label>
          <input type="text" name="userBirth" value="${dto.UserBirth }">
        </div>
        
                <input readonly="readonly" style="border: 0; outline: none; color: #9542ED; font-family: NanumSquareAcr; font-weight: bold; width: 100%; size: 100%;" type="text" name="" id="abmessage">
               
        <span class="padding-bottom--15"></span>
        <div class="field padding-bottom--24">
          <input type="button" value="Continue" onclick="sendAndValidate();">
          <input type="button" value="Cancel" onclick="javascript:location.href='<%=cp %>/eggplant1/main.jsp';">
        </div>
      </div>
    </div>
  </div>
  <div class="footer-link padding-top--24">
              <span>© <a href="<%=cp %>/eggplant/main.do">Eggplant Bank</a> | <a href="<%=cp %>/eggplant/map.do">Contact</a> | <a href="<%=cp %>/eggplant1/privacy.jsp">Privacy & terms</a></span>
  </div>
</div>
</div>
</div>
</div>
</form>
<script type="text/javascript">

function sendAndValidate() {
  var f = document.myForm;
 
  // 유효성 검사를 위한 정규식 패턴들
  var regexcreditPwd = /^[0-9]{4}$/;
  var regexId = /^[a-zA-Z0-9]{6,12}$/;
  var regexPwd = /^[a-zA-Z0-9!@#$%^&*()]{6,12}$/;
  var regexPhoneNum = /^010-\d{4}-\d{4}$/;
  var regexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  var regexBirth = /^(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;

  var account = f.account.value.trim();
  var creditPassword = f.creditPassword.value.trim();
  var userName = f.userName.value.trim();
  var userId = f.userId.value.trim();
  var userPassword = f.userPassword.value.trim();
  var userPassword2 = f.userPassword2.value.trim();
  var userAddr = f.userAddr.value.trim();
  var userPhoneNum = f.userPhoneNum.value.trim();
  var userEmail = f.userEmail.value.trim();
  var userBirth = f.userBirth.value.trim();


	//계좌확인
	// 숫자 5자리가 아닌 경우 또는 숫자가 아닌 문자가 포함된 경우
  	if (!/^\d{5}$/.test(account)) {
		var data = "계좌번호 숫자 5자리를 입력해주세요.";
		document.getElementById("anmessage").value = data;
		f.account.focus();
		return;
	}
	//확인
	var data = "Check";
	document.getElementById("anmessage").value = data;

	
  	 //계좌비번확인
 	 if (!creditPassword) {
		var data = "계좌 비밀번호를 입력해주세요.";
		document.getElementById("apmessage").value = data;
	    f.creditPassword.focus();
	    return;
	}  
 	 if (!regexcreditPwd.test(creditPassword)) {
		var data = "계좌 비밀번호는 숫자 4자리로 입력해주세요.";
		document.getElementById("apmessage").value = data;
		f.creditPassword.focus();
  		return;
  	}
  	//확인
	var data = "Check";
	document.getElementById("apmessage").value = data;
 
  
  //이름확인
 	 if (!userName) {
		var data = "이름을 입력해주세요.";
		document.getElementById("fnmessage").value = data;
   		f.userName.focus();
  	  	return;
  	}
	var data = "Check";
	document.getElementById("fnmessage").value = data;
  
  
  	if (!userId) {
		var data = "아이디를 입력해주세요.";
		document.getElementById("idmessage").value = data;
   		f.userId.focus();
   		return;
 	}
  	if (!regexId.test(userId)) {
		var data = "아이디는 영문자와 숫자를 혼용하여 6-12자로 입력해주세요.";
		document.getElementById("idmessage").value = data;
	    f.userId.focus();
	    return;
  	}
	var data = "Check";
	document.getElementById("idmessage").value = data;
  	
  //비밀번호 확인
  if (!userPassword) {
	var data = "패스워드를 입력해주세요.";
	document.getElementById("pw1message").value = data;
    f.userPassword.focus();
    return;
  }
  if (!regexPwd.test(userPassword)) {
	var data = "영문자와 특수문자, 숫자를 혼용하여 6-12자로 입력해주세요.";
	document.getElementById("pw1message").value = data;
	f.Password.focus();
	return;
  }
	var data = "Check";
	document.getElementById("pw1message").value = data;
  
	//비밀번호 재확인
	if (!userPassword2) {
		var data = "패스워드를 한번 더 입력해주세요.";
		document.getElementById("pw2message").value = data;
	    f.userPassword2.focus();
	    return;
	}
	if (!regexPwd.test(userPassword2)) {
		var data = "영문자와 특수문자, 숫자를 혼용하여 6-12자로 입력해주세요.";
		document.getElementById("pw2message").value = data;
		f.Password2.focus();
		return;
	}
	if (userPassword !== userPassword2) {
		var data = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
		document.getElementById("pw2message").value = data;
		f.Password2.focus();
	    return;
	} 
	var data = "Check";
	document.getElementById("pw2message").value = data;
	
	//주소 확인
  	if (!userAddr) {
    	var data = "주소를 입력해주세요.";
		document.getElementById("admessage").value = data;
    	f.userAddr.focus();
    	return;
  	}
	var data = "Check";
	document.getElementById("admessage").value = data;
	
	//전화번호 확인
  	if (!userPhoneNum) {
    	var data = "전화번호를 입력해주세요.";
		document.getElementById("pnmessage").value = data;
    	f.userPhoneNum.focus();
    	return;
  	}
 	 if (!regexPhoneNum.test(userPhoneNum)) {
    	var data = "사용가능한 전화번호가 아닙니다. 다시 입력해주세요.";
		document.getElementById("pnmessage").value = data;
	    f.userPhoneNum.focus();
	    return;
  	}   
 	var data = "Check";
	document.getElementById("pnmessage").value = data;
 	 
	//이메일확인
 	 if (!userEmail) {
    	var data = "E-Mail주소를 입력해주세요.";
		document.getElementById("emessage").value = data;
    	f.userEmail.focus();
    	return;
  	}
  	if (!regexEmail.test(userEmail)) {
    	var data = "사용가능한 E-Mail 주소가 아닙니다. 다시 입력해주세요.";
		document.getElementById("emessage").value = data;
    	f.userEmail.focus();
    	return;
  	}
	var data = "Check";
	document.getElementById("emessage").value = data;
  	
  	
 	if (!userBirth) {
		var data = "생년월일을 입력해주세요.";
		document.getElementById("abmessage").value = data;
    	f.userBirth.focus();
    	return;
  	}
  	if (!regexBirth.test(userBirth)) {
  		var data = "입력형식에 맞춰 입력해주세요.";
		document.getElementById("abmessage").value = data;
	    f.userBirth.focus();
	    return;
  	} 
	var data = "Check";
	document.getElementById("abmessage").value = data;
  
  // 모든 유효성 검사를 통과하면 폼 데이터를 서버로 제출
  f.action = "<%=cp%>/eggplant/created_ok.do";
  f.submit();
}


</script>
</body>
</html>


