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
<title>Eggplant Bank</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- !!!!!!!!!!!!!회원가입완료!!!!!!!!!!! -->
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
     font-family: NanumSquareAceb; 
}
h1 {
    letter-spacing: -1px;
    font-family: 'NanumSquareBold';'
}
a {
  color: #9542ED;
  text-decoration: unset;
}

.flex-flex {
    display: flex;
}
.align-center {
  align-items: center; 
}

.flex-direction--column {
    -ms-flex-direction: column;
    flex-direction: column;    
}

.padding-top--24 {
  padding-top: 24px;
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

.reset-pass a,label {
    font-size: 14px;
    font-weight: 600;
    display: block;
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

input[type="submit"] {
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

.footer-link span {
    font-size: 14px;
    text-align: center;
}

</style>



<body>
<form action="<%=cp %>/eggplant1/main.jsp" name="myForm" method="post">  


    <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;"><br/><br/><br/><br/><br/><br/>
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="http://blog.stackfindover.com/" rel="dofollow"></a></h1>
          <h1><a href="http://blog.stackfindover.com/" rel="dofollow">Eggplant Bank</a></h1>
        </div>
		<div class="formbg-outer">
 		 <div class="formbg">


            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"></span>
              <span class="padding-bottom--15"></span>
              <span class="padding-bottom--15"></span>
              <span class="padding-bottom--15" style="text-align: center; font-size: 17px;">Welcome to membership ☺</span>
              <span class="padding-bottom--15" style="text-align: center; font-size: 17px;">로그인 페이지로 이동합니다.</span>
              <span class="padding-bottom--15"></span>
              <span class="padding-bottom--15"></span>
              <span class="padding-bottom--15"></span>
            <div style="display: flex; justify-content: flex-end;">
		  </div>

        <div class="field padding-bottom--24">
          <input type="button" name="submit" value="Continue" onclick="javascript:location.href='<%=cp%>/eggplant/login.do';">
        </div>
      </div>
    </div>
  </div>
  <div class="footer-link padding-top--24">
    <span>© Eggplant Bank | Contact | Privacy & terms</span>
  </div>
</div>

</form>

</body>
</html>


