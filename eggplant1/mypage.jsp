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
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/mypagestyle.css"/>


<!-- 기본 스타일 -->

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
		
		f.action = "<%=cp%>/eggplant/myPage.do";
		f.submit();
	}


</script>

    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111">
  <title>CodePen - Project Management Dashboard UI</title>
    <link rel="canonical" href="https://codepen.io/aybukeceylan/pen/OJRNbZp">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
  
<style>
@charset "UTF-8";
@import url("https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css");
* {
  box-sizing: border-box;
  font-family: 'NanumSquareAceb';
}

:root {
  --app-container: #f3f6fd;
  --main-color: #1f1c2e;
  --secondary-color: #4A4A4A;
  --link-color: #1f1c2e;
  --link-color-hover: #c3cff4;
  --link-color-active: #fff;
  --link-color-active-bg: #1f1c2e;
  --projects-section: #fff;
  --message-box-hover: #fafcff;
  --message-box-border: #e9ebf0;
  --more-list-bg: #fff;
  --more-list-bg-hover: #f6fbff;
  --more-list-shadow: rgba(209, 209, 209, 0.4);
  --button-bg: #1f1c24;
  --search-area-bg: #fff;
  --star: #1ff1c2e;
  --message-btn: #fff;
}

.dark:root {
  --app-container: #1f1d2b;
  --app-container: #111827;
  --main-color: #fff;
  --secondary-color: rgba(255,255,255,.8);
  --projects-section: #1f2937;
  --link-color: rgba(255,255,255,.8);
  --link-color-hover: rgba(195, 207, 244, 0.1);
  --link-color-active-bg: rgba(195, 207, 244, 0.2);
  --button-bg: #1f2937;
  --search-area-bg: #1f2937;
  --message-box-hover: #243244;
  --message-box-border: rgba(255,255,255,.1);
  --star: #ffd92c;
  --light-font: rgba(255,255,255,.8);
  --more-list-bg: #2f3142;
  --more-list-bg-hover: rgba(195, 207, 244, 0.1);
  --more-list-shadow: rgba(195, 207, 244, 0.1);
  --message-btn: rgba(195, 207, 244, 0.1);
}

html, body {
  width: 100%;
  height: 100vh;
  margin: 0;
}

body {
  font-family: "DM Sans", sans-serif;
  overflow: hidden;
  display: flex;
  justify-content: center;
  background-color: var(--app-container);
}

button, a {
  cursor: pointer;
}

.app-container {
  width: 100%;
  display: flex;
  flex-direction: column;
  height: 100%;
  background-color: var(--app-container);
  transition: 0.2s;
  max-width: 1800px;
}

.app-content {
  display: flex;
  height: 100%;
  overflow: hidden;
  padding: 16px 24px 24px 0;
}
.app-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding: 16px 24px;
  position: relative;
}
.app-header-left, .app-header-right {
  display: flex;
  align-items: center;
}
.app-header-left {
  flex-grow: 1;
}
.app-header-right button {
  margin-left: 10px;
}
.app-icon {
  width: 26px;
  height: 2px;
  border-radius: 4px;
  background-color: var(--main-color);
  position: relative;
}
.app-icon:before, .app-icon:after {
  content: "";
  position: absolute;
  width: 12px;
  height: 2px;
  border-radius: 4px;
  background-color: var(--main-color);
  left: 50%;
  transform: translatex(-50%);
}
.app-icon:before {
  top: -6px;
}
.app-icon:after {
  bottom: -6px;
}
.app-name {
  color: var(--main-color);
  margin: 0;
  font-size: 50px;
  line-height: 24px;
  font-weight: 700;
  margin: 0 32px;
}

.mode-switch {
  background-color: transparent;
  border: none;
  padding: 0;
  color: var(--main-color);
  display: flex;
  justify-content: center;
  align-items: center;
}

.search-wrapper {
  border-radius: 20px;
  background-color: var(--search-area-bg);
  padding-right: 12px;
  height: 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  max-width: 480px;
  color: var(--light-font);
  box-shadow: 0 2px 6px 0 rgba(136, 148, 171, 0.2), 0 24px 20px -24px rgba(71, 82, 107, 0.1);
  overflow: hidden;
}
.dark .search-wrapper {
  box-shadow: none;
}

.search-input {
  border: none;
  flex: 1;
  outline: none;
  height: 100%;
  padding: 0 20px;
  font-size: 16px;
  background-color: var(--search-area-bg);
  color: var(--main-color);
}
.search-input:placeholder {
  color: var(--main-color);
  opacity: 0.6;
}

.add-btn {
  color: #fff;
  background-color: var(--button-bg);
  padding: 0;
  border: 0;
  border-radius: 50%;
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.notification-btn {
  color: var(--main-color);
  padding: 0;
  border: 0;
  background-color: transparent;
  height: 32px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.profile-btn {
  padding: 0;
  border: 0;
  background-color: transparent;
  display: flex;
  align-items: center;
  padding-left: 12px;
  border-left: 2px solid #ddd;
}
.profile-btn img {
  width: 32px;
  height: 32px;
  -o-object-fit: cover;
     object-fit: cover;
  border-radius: 50%;
  margin-right: 4px;
}
.profile-btn span {
  color: var(--main-color);
  font-size: 16px;
  line-height: 24px;
  font-weight: 700;
}

.page-content  {
  flex: 1;
  width: 100%;
}

.app-sidebar {
  padding: 40px 16px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.app-sidebar-link {
  color: var(--main-color);
  color: var(--link-color);
  margin: 16px 0;
  transition: 0.2s;
  border-radius: 50%;
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.app-sidebar-link:hover {
  background-color: var(--link-color-hover);
  color: var(--link-color-active);
}
.app-sidebar-link.active {
  background-color: var(--link-color-active-bg);
  color: var(--link-color-active);
}

.projects-section {
  flex: 2;
  background-color: var(--projects-section);
  border-radius: 32px;
  padding: 32px 32px 0 32px;
  overflow: hidden;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.projects-section-line {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 75px;
}
.projects-section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
  color: var(--main-color);
}
.projects-section-header p {
  font-size: 24px;
  line-height: 32px;
  font-weight: 700;
  opacity: 0.9;
  margin: 0;
  color: var(--main-color);
}
.projects-section-header .time {
  font-size: 20px;
}

.projects-status {
  display: flex;
}

.item-status {
  display: flex;
  flex-direction: column;
  margin-right: 16px;
}
.item-status:not(:last-child) .status-type:after {
  content: "";
  position: absolute;
  right: 8px;
  top: 50%;
  transform: translatey(-50%);
  width: 6px;
  height: 6px;
  border-radius: 50%;
  border: 1px solid var(--secondary-color);
}

.status-number {
  font-size: 24px;
  line-height: 32px;
  font-weight: 700;
  color: var(--main-color);
}

.status-type {
  position: relative;
  padding-right: 24px;
  color: var(--secondary-color);
}

.view-actions {
  display: flex;
  align-items: center;
}

.view-btn {
  width: 36px;
  height: 36px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 6px;
  border-radius: 4px;
  background-color: transparent;
  border: none;
  color: var(--main-color);
  margin-left: 8px;
  transition: 0.2s;
}
.view-btn.active {
  background-color: var(--link-color-active-bg);
  color: var(--link-color-active);
}
.view-btn:not(.active):hover {
  background-color: var(--link-color-hover);
  color: var(--link-color-active);
}

.messages-section {
  flex-shrink: 0;
  padding-bottom: 32px;
  background-color: var(--projects-section);
  margin-left: 24px;
  flex: 1;
  width: 100%;
  border-radius: 30px;
  position: relative;
  overflow: auto;
  transition: all 300ms cubic-bezier(0.19, 1, 0.56, 1);
}
.messages-section .messages-close {
  position: absolute;
  top: 12px;
  right: 12px;
  z-index: 3;
  border: none;
  background-color: transparent;
  color: var(--main-color);
  display: none;
}
.messages-section.show {
  transform: translateX(0);
  opacity: 1;
  margin-left: 0;
}
.messages-section .projects-section-header {
  position: sticky;
  top: 0;
  z-index: 1;
  padding: 32px 24px 0 24px;
  background-color: var(--projects-section);
}

.message-box {
  border-top: 1px solid var(--message-box-border);
  padding: 16px;
  display: flex;
  align-items: flex-start;
  width: 100%;
}
.message-box:hover {
  background-color: var(--message-box-hover);
  border-top-color: var(--link-color-hover);
}
.message-box:hover + .message-box {
  border-top-color: var(--link-color-hover);
}
.message-box img {
  border-radius: 50%;
  -o-object-fit: cover;
     object-fit: cover;
  width: 40px;
  height: 40px;
}

.message-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
}
.message-header .name {
  font-size: 16px;
  line-height: 24px;
  font-weight: 700;
  color: var(--main-color);
  margin: 0;
}

.message-content {
  padding-left: 16px;
  width: 100%;
}

.star-checkbox input {
  opacity: 0;
  position: absolute;
  width: 0;
  height: 0;
}
.star-checkbox label {
  width: 24px;
  height: 24px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}
.dark .star-checkbox {
  color: var(--secondary-color);
}
.dark .star-checkbox input:checked + label {
  color: var(--star);
}
.star-checkbox input:checked + label svg {
  fill: var(--star);
  transition: 0.2s;
}

.message-line {
  font-size: 14px;
  line-height: 20px;
  margin: 8px 0;
  color: var(--secondary-color);
  opacity: 0.7;
}
.message-line.time {
  text-align: right;
  margin-bottom: 0;
}

.project-boxes {
  margin: 0 -8px;
  overflow-y: auto;
}
.project-boxes.jsGridView {
  display: flex;
  flex-wrap: wrap;
}
.project-boxes.jsGridView .project-box-wrapper {
  width: 33.3%;
}
.project-boxes.jsListView .project-box {
  display: flex;
  border-radius: 10px;
  position: relative;
}
.project-boxes.jsListView .project-box > * {
  margin-right: 24px;
}
.project-boxes.jsListView .more-wrapper {
  position: absolute;
  right: 16px;
  top: 16px;
}
.project-boxes.jsListView .project-box-content-header {
  order: 1;
  max-width: 120px;
}
.project-boxes.jsListView .project-box-header {
  order: 2;
}
.project-boxes.jsListView .project-box-footer {
  order: 3;
  padding-top: 0;
  flex-direction: column;
  justify-content: flex-start;
}
.project-boxes.jsListView .project-box-footer:after {
  display: none;
}
.project-boxes.jsListView .participants {
  margin-bottom: 8px;
}
.project-boxes.jsListView .project-box-content-header p {
  text-align: left;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.project-boxes.jsListView .project-box-header > span {
  position: absolute;
  bottom: 16px;
  left: 16px;
  font-size: 12px;
}
.project-boxes.jsListView .box-progress-wrapper {
  order: 3;
  flex: 1;
}

.project-box {
  --main-color-card: #dbf6fd;
  border-radius: 30px;
  padding: 16px;
  background-color: var(--main-color-card);
  transition: box-shadow 0.3s ease;
}
.project-box:hover {
    box-shadow: 0 0 10px rgba(33, 150, 243, 0.8);
}

.project-box-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top : -12px;
  margin-bottom: 16px;
  color: var(--main-color);
}
.project-box-header span {
  color: #4A4A4A;
  opacity: 0.7;
  font-size: 14px;
  line-height: 16px;
}
.project-box-content-header {
  text-align: center;
  margin-bottom: 0px;
  cursor:pointer;
}
.project-box-content-header p {
  margin: 0;
}
.project-box-wrapper {
  padding: 25px;
  transition: 0.2s;
}

.project-btn-more {
  padding: 0;
  height: 14px;
  width: 24px;
  height: 24px;
  position: relative;
  background-color: transparent;
  border: none;
  flex-shrink: 0;
  /*&:after, &:before {
    content: '';
    position: absolute;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background-color: var(--main-color);
    opacity: .8;
    left: 50%;
    transform: translatex(-50%);
  }

  &:before { top: 0;}
  &:after { bottom: 0; }*/
}

.more-wrapper {
  position: relative;
}

.box-content-header {
  font-size: 16px;
  line-height: 24px;
  font-weight: 700;
  opacity: 0.7;
}

.box-content-subheader {
  font-size: 14px;
  line-height: 24px;
  opacity: 0.7;
}

.box-progress {
  display: block;
  height: 4px;
  border-radius: 6px;
}
.box-progress-bar {
  width: 100%;
  height: 4px;
  border-radius: 6px;
  overflow: hidden;
  background-color: #fff;
  margin: 8px 0;
}
.box-progress-header {
  font-size: 14px;
  font-weight: 700;
  line-height: 16px;
  margin: 0;
}
.box-progress-percentage {
  text-align: right;
  margin: 0;
  font-size: 14px;
  font-weight: 700;
  line-height: 16px;
}

.project-box-footer {
  display: flex;
  justify-content: space-between;
  padding-top: 16px;
  position: relative;
}
.project-box-footer:after {
  content: "";
  position: absolute;
  background-color: rgba(255, 255, 255, 0.6);
  width: calc(100% + 32px);
  top: 0;
  left: -16px;
  height: 1px;
}

.participants {
  display: flex;
  align-items: center;
}
.participants img {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  overflow: hidden;
  -o-object-fit: cover;
     object-fit: cover;
}
.participants img:not(:first-child) {
  margin-left: -8px;
}

.add-participant {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  border: none;
  background-color: rgba(255, 255, 255, 0.6);
  margin-left: 6px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0;
}

.days-left {
  background-color: rgba(255, 255, 255, 0.6);
  font-size: 12px;
  border-radius: 20px;
  flex-shrink: 0;
  padding: 6px 16px;
  font-weight: 700;
}

.mode-switch.active .moon {
  fill: var(--main-color);
}

.messages-btn {
  border-radius: 4px 0 0 4px;
  position: absolute;
  right: 0;
  top: 58px;
  background-color: var(--message-btn);
  border: none;
  color: var(--main-color);
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 4px;
  display: none;
}

@media screen and (max-width: 980px) {
  .project-boxes.jsGridView .project-box-wrapper {
    width: 50%;
  }

  .status-number, .status-type {
    font-size: 14px;
  }

  .status-type:after {
    width: 4px;
    height: 4px;
  }

  .item-status {
    margin-right: 0;
  }
}
@media screen and (max-width: 880px) {
  .messages-section {
    transform: translateX(100%);
    position: absolute;
    opacity: 0;
    top: 0;
    z-index: 2;
    height: 100%;
    width: 100%;
  }
  .messages-section .messages-close {
    display: block;
  }

  .messages-btn {
    display: flex;
  }
}
@media screen and (max-width: 720px) {
  .app-name, .profile-btn span {
    display: none;
  }

  .add-btn, .notification-btn, .mode-switch {
    width: 20px;
    height: 20px;
  }
  .add-btn svg, .notification-btn svg, .mode-switch svg {
    width: 16px;
    height: 16px;
  }

  .app-header-right button {
    margin-left: 4px;
  }
}
@media screen and (max-width: 520px) {
  .projects-section {
    overflow: auto;
  }

  .project-boxes {
    overflow-y: visible;
  }

  .app-sidebar, .app-icon {
    display: none;
  }

  .app-content {
    padding: 16px 12px 24px 12px;
  }

  .status-number, .status-type {
    font-size: 10px;
  }

  .view-btn {
    width: 24px;
    height: 24px;
  }

  .app-header {
    padding: 16px 10px;
  }

  .search-input {
    max-width: 120px;
  }

  .project-boxes.jsGridView .project-box-wrapper {
    width: 100%;
  }

  .projects-section {
    padding: 24px 16px 0 16px;
  }

  .profile-btn img {
    width: 24px;
    height: 24px;
  }

  .app-header {
    padding: 10px;
  }

  .projects-section-header p,
.projects-section-header .time {
    font-size: 18px;
  }

  .status-type {
    padding-right: 4px;
  }
  .status-type:after {
    display: none;
  }

  .search-input {
    font-size: 14px;
  }

  .messages-btn {
    top: 48px;
  }

  .box-content-header {
    font-size: 12px;
    line-height: 16px;
  }

  .box-content-subheader {
    font-size: 12px;
    line-height: 16px;
  }

  .project-boxes.jsListView .project-box-header > span {
    font-size: 10px;
  }

  .box-progress-header {
    font-size: 12px;
  }

  .box-progress-percentage {
    font-size: 10px;
  }

  .days-left {
    font-size: 8px;
    padding: 6px 6px;
    text-align: center;
  }

  .project-boxes.jsListView .project-box > * {
    margin-right: 10px;
  }

  .project-boxes.jsListView .more-wrapper {
    right: 2px;
    top: 10px;
  }
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
</head>



<body translate="no">
  <div class="app-container">
  <div class="app-header">
    <div class="app-header-left">
      
      <p class="app-name">&nbsp;&nbsp;MY PAGE</p>
      
    </div>
    <div class="app-header-right">
      <button class="mode-switch" title="Switch Theme">
        <svg class="moon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" width="24" height="24" viewBox="0 0 24 24">
          <defs></defs>
          <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
        </svg>
      </button>
     
      
      
      <button class="profile-btn">
       <img style="width: 130px; height: 50px; margin-right: 50px;" src="<%=cp%>/image/sideLogo.png">
        
      </button>
    </div>
    <button class="messages-btn">
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">
        <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
    </button>
  </div>
  <div class="app-content">
    <div class="app-sidebar">
     
      
    </div>
    <div class="projects-section">
      <div class="projects-section-header">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;${dto.userId }님 반갑습니다!</p>
       <div id="currentTime" style="font-size: 25px;"></div>
      </div>
      <div class="projects-section-line">
        <div class="projects-status">
          
          
          <div class="item-status">
            <span class="status-number">&nbsp;&nbsp;&nbsp;&nbsp;행복한 하루 보내세요!</span>
            
          </div>
        </div>
        
      </div>
      
      
      <div class="project-boxes jsGridView">
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #fee4cb;">
            <div class="project-box-header">
              
              <div class="more-wrapper">
                <button class="project-btn-more">
                  
                </button>
          </div>
        </div>
        <div class="project-box-content-header" onclick="location='<%=cp %>/eggplant/updated.do';">
        <i class="fa-solid fa-pencil fa-beat fa-2xl"></i><br/>
        <br/>
       <br/>
         <input type="button" value="회원 정보 수정" style="font-size:17pt; border: none; background-color:transparent; font-family: 'NanumSquareAceb';">
         <br/>
        <br/>
         <br/>
        </div>
        <div class="box-progress-wrapper">
        </div>
        <div class="project-box-footer">
          <div class="participants">
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #e9e7fd;">
            <div class="project-box-header">
              
              <div class="more-wrapper">
                <button class="project-btn-more">
                  
                </button>
          </div>
        </div>
        <div class="project-box-content-header" onclick="location='<%=cp %>/eggplant/accountCheck.do';">
        <i class="fa-solid fa-receipt fa-bounce fa-2xl"></i>
        <br/>
        <br/>
        <br/>
         <input type="button" value="계좌 조회" style=" font-size:17pt; border:none; background-color:transparent; font-family: 'NanumSquareAceb';">
        
           <br/>
        <br/>
         <br/>
        </div>
        
        <div class="box-progress-wrapper">
        </div>
        <div class="project-box-footer">
          <div class="participants">
         
          </div>
        </div>
      </div>
    </div>

    
    
    
    
    
    
    
   <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #ffd3e2;">
            <div class="project-box-header">
              
              <div class="more-wrapper">
                <button class="project-btn-more">
                  
                </button>
          </div>
        </div>
        <div class="project-box-content-header" onclick="location='<%=cp %>/eggplant/eggmoney.do';">
        <i class="fa-solid fa-gifts fa-beat-fade fa-2xl"></i>
         <br/>
          <br/>
        <br/>
         <input type="button" value="포인트" style="font-size:17pt;  border:none; background-color:transparent; font-family: 'NanumSquareAceb';">
          <br/>
        <br/>
         <br/>
        </div>
        
        <div class="box-progress-wrapper">
        </div>
        <div class="project-box-footer">
          <div class="participants">
            
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
    
    <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #e9e7fd;">
            <div class="project-box-header">
              
              <div class="more-wrapper">
                <button class="project-btn-more">
                  
                </button>
         </div>
        </div>
        <div class="project-box-content-header" onclick="location='<%=cp %>/eggplant/loan.do';">
        <i class="fa-solid fa-hand-holding-dollar fa-beat fa-2xl"></i>
        <br/>
        <br/>
        <br/>
         <input type="button" value="대출 서비스" style="font-size:17pt;  border:none; background-color:transparent; font-family: 'NanumSquareAceb';">
         <br/>
        <br/>
         <br/>
        </div>
        
        <div class="box-progress-wrapper">
        </div>
        <div class="project-box-footer">
          <div class="participants">
            
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
     <div class="project-box-wrapper">
          <div class="project-box" style="background-color: c8f7dc;">
            <div class="project-box-header">
              
              <div class="more-wrapper">
                <button class="project-btn-more">
                  
                </button>
         </div>
        </div>
        <div class="project-box-content-header" onclick="sendExchange();">
        <i class="fa-solid fa-dollar-sign fa-bounce fa-2xl"></i>
        <br/>
        <br/>
        <br/>
         <input type="button" value="환율 정보" style="font-size:17pt;  border:none; background-color:transparent; font-family: 'NanumSquareAceb';">
         <br/>
        <br/>
         <br/>
        </div>
        <div class="box-progress-wrapper">
        </div>
        <div class="project-box-footer">
          <div class="participants">
           
          </div>
        </div>
      </div>
    </div>
    
    
   
    
          <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #e9e7fd;">
            <div class="project-box-header">
              
              <div class="more-wrapper">
                <button class="project-btn-more">
                  
                </button>
        </div>
        </div>
        <div class="project-box-content-header" onclick="redirectToURL('https://codepen.io/cxpanta/full/GRwBxyR');">
       <i class="fa-solid fa-hat-wizard fa-beat-fade fa-2xl"></i>
         
       <br/>
        <br/>
         <br/>
         <input type="button" value="미니게임" style="font-size:17pt;  border:none; background-color:transparent; font-family: 'NanumSquareAceb';">
        <br/>
         <br/>
         <br/>
        </div>
        
        <div class="box-progress-wrapper">
        </div>
        <div class="project-box-footer">
          <div class="participants">
          
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

















<div class="messages-section">
  <form action="<%=cp%>/eggplant/mypage.do" method="post" name="myFrom">
<table border="0" style="margin: auto;" width="100%" height="100%" cellpadding="6">
	<tr>
		<td valign="middle" style="height: 100px;">
			<br/>
		</td>
		<td align="right">
		<a href="<%=cp%>/eggplant/main.do"><i class="fa-solid fa-house-chimney fa-bounce fa-2xl" style="color: #c55ed9; padding-right: 20px;"></i></a>
		</td>
	</tr>
	<tr>
		<td align="center" height="50" colspan="3" class="td-bgcolor1" valign="middle">
		<h3 style="
font-family: 'NanumSquareAceb'; font-size: 25pt;"> <span class="status-number">안녕하세요! ${sessionScope.customInfo.userName }님<br/> 무엇을 도와드릴까요?</span></h3>
		</td>
	</tr>
	
	<tr height="250">
		<td colspan="3" align="center" valign="middle">
			
			<c:choose>
  				<c:when test="${count eq 1}">
    				<button type="submit" class="eggButton" value="입출금" name="boardTitle">입 / 출금</button><br/><br/>
    		
    				<button type="submit" class="eggButton" value="대출" name="boardTitle">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출</button><br/><br/>
    				<button type="submit" class="eggButton" value="인증/보안" name="boardTitle">인증/보안</button><br/><br/>
    				<button type="submit" class="eggButton" value="기타" name="boardTitle">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타</button><br/><br/>
					<input type="hidden" value="1" name="count"/>
  				</c:when>
  
  				<c:when test="${count eq 2}">
						<c:forEach var="dto" items="${lists }">
						<button type="submit" class="eggButton" value="${dto.subject }" name="subject">${dto.subject }</button><br/><br/>
						</c:forEach>
						<input type="hidden" value="2" name="count"/>
 				 </c:when>
  
  				<c:when test="${count eq 3}">
						<c:forEach var="dto" items="${lists }">
						<button type="submit" class="eggButton">${dto.content1 }</button><br/><br/>
						</c:forEach>
					<input type="hidden" value="3" name="count"/>
  				</c:when>
  
 				 <c:when test="${count eq 4}">
					<b style="font-size: 20pt;">이용해 주셔서 감사합니다.</b><br/><br/><br/><br/>
					<b style="font-size: 15pt;">더 궁금한 내용이 있다면 아래 버튼을 눌러주세요!</b><br/><br/><br/>
					
					<button class="eggButton"><b style="font-family: NanumSquare">처음으로</b></button>
					
					<input type="hidden" value="0" name="count"/>
  				</c:when>
			</c:choose>
			
		</td>
	</tr>
	
	
</table>

</form>
</div>
</div>
</div>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
<script src="<%=cp%>/data/eggplantLink.js"></script>

  
<script id="rendered-js">

document.addEventListener('DOMContentLoaded', function () {
  var modeSwitch = document.querySelector('.mode-switch');

  modeSwitch.addEventListener('click', function () {document.documentElement.classList.toggle('dark');
    modeSwitch.classList.toggle('active');
  });

  var listView = document.querySelector('.list-view');
  var gridView = document.querySelector('.grid-view');
  var projectsList = document.querySelector('.project-boxes');

  listView.addEventListener('click', function () {
    gridView.classList.remove('active');
    listView.classList.add('active');
    projectsList.classList.remove('jsGridView');
    projectsList.classList.add('jsListView');
  });

  gridView.addEventListener('click', function () {
    gridView.classList.add('active');
    listView.classList.remove('active');
    projectsList.classList.remove('jsListView');
    projectsList.classList.add('jsGridView');
  });

  document.querySelector('.messages-btn').addEventListener('click', function () {
    document.querySelector('.messages-section').classList.add('show');
  });

  document.querySelector('.messages-close').addEventListener('click', function () {
    document.querySelector('.messages-section').classList.remove('show');
  });
});
//# sourceURL=pen.js

function redirectToURL(url) {
    window.location.href = url;
}


// JavaScript를 이용하여 현재 시간을 가져와서 표시하는 함수

let days = ["일요일","월요일", "화요일","수요일","목요일","금요일","토요일"];

function displayCurrentTime() {
	let today = new Date();   
	
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();
  let currentTimeString = year + "-" + month + "-" + date + " " + days[day];
  
  document.getElementById('currentTime').innerText = currentTimeString;
}

// 1초마다 현재 시간을 업데이트
setInterval(displayCurrentTime, 1000);

// 페이지가 로드될 때 현재 시간을 바로 표시
displayCurrentTime();



</script>



</body>
</html>