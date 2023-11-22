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
<title>대출 자격 평가</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/chatbot.css" />


<style type="text/css">

:root {
    --panel-background-color: #fff;
    --panel-box-shadow: 0 0 4px rgba(204, 204, 204, 0.75);
    --panel-width: 160px;
    --panel-text-color: #404040;
    --panel-hover-item-background-color: #f4f6fa;
    --panel-hover-item-color: #385074;
    --panel-icon-width: 13px;
    --panel-separator-color: #dfe3eb;
}

/* the pannel */
.jspanel {
    box-sizing: border-box;
    position: absolute;
    background-color: var(--panel-background-color, #fff);
    box-shadow: var(--panel-box-shadow, 0 0 4px rgba(204, 204, 204, 0.75));
    border-radius: 5px;
    padding: 10px 0;
    width: var(--panel-width, 160px);
    min-height: 50px;
    height: auto;
    visibility: visible; /* important */
}

/* Never change the visibility of the sign by yourself. */
.jspanel.panel-hidden {
    visibility: hidden;
}

/* the list of items */
.jspanel ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display:flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
}

/* for each item */
.jspanel li {
    width: 100%;
    height: 30px;
    box-sizing: border-box;
    padding: 0 20px;
    color: var(--panel-text-color, #404040);
    background-color: transparent;
    display: flex;
    align-items: center;
}

.jspanel li:hover {
    background-color: var(--panel-hover-item-background-color, #f4f6fa);
    color: var(--panel-hover-item-color, #385074);
}

/* the title of the item */
.jspanel li span {
    pointer-events: none;
    -webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
    display: block;
    width: 100%;
    text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

/* img is an `icon`, i is a `fontawesome_icon` */
.jspanel li img,
.jspanel li i {
    pointer-events: none;
    -webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
    margin-right: 10px;
}

/* the icon */
.jspanel li img {
    width: var(--panel-icon-width, 13px);
    height: auto;
}

/* for each separator */
.jspanel .jspanel-separator {
    height: 1px;
    width: 80%;
    margin: 8px 0;
    background-color: var(--panel-separator-color, #dfe3eb);
    padding: 1px;
}


</style>

<script src="https://kit.fontawesome.com/171f74c68f.js" crossorigin="anonymous"></script>

<script type="text/javascript">

	function chatBot() {
		
		window.open('https://mediafiles.botpress.cloud/c4fdcf1b-9cf7-4d53-b76f-fe6522237e49/webchat/bot.html', 'window', 'scrollbars=no,width=500,height=780,top=10,left=20,status=no,toolbars=no,menubar=no,location=no');
   	
}
	
	function quickGuide() {
		
		window.open('<%=cp%>/eggplant/selectQuestion_ok.do','window','scrollbars=no,width=500,height=780,top=10,left=20, status=no, toolbars=no, menubar=no, location=no');
	}
	
	function goTop() {
	    window.scrollTo(0, 0);
	}
	
</script>
   
<script type="text/javascript">

class JSPanel {
    /**
     * @constructs JSPanel
     * @param {HTMLButtonElement} button The button which will display the panel.
     * @param {{top?:number,right?:number,bottom?:number,left?:number,items:Array<{title:string,icon?:string,fontawesome_icon?:string,onclick?:Function,separator?:boolean}>}} options The options to customize the panel.
     */
    constructor(button, options) {
        /**
         * The panel.
         * @type {HTMLElement|null}
         * @default null
         * @private
         */
        this.panel = null;
        this.button = button;
        this.options = options;
        this.panel_uniqueid = "jspanel-" + this._rand(0, 1000000);
        this._buildPanel();
        this.button.setAttribute("aria-expanded", "false");
        this.button.setAttribute("aria-controls", this.panel_uniqueid);
    }
    /**
     * Builds the panel.
     */
    _buildPanel() {
        const top = this.options.top === undefined ? null : this.options.top + "px";
        const right = this.options.right === undefined ? null : this.options.right + "px";
        const bottom = this.options.bottom === undefined ? null : this.options.bottom + "px";
        const left = this.options.left === undefined ? null : this.options.left + "px";
        this.panel = this._createEl("div", { id: this.panel_uniqueid, className: "jspanel panel-hidden" });
        if (top || right || bottom || left) {
            if (top)
                this.panel.style.top = top;
            if (left)
                this.panel.style.left = left;
            if (right)
                this.panel.style.right = right;
            if (bottom)
                this.panel.style.bottom = bottom;
        }
        else {
            this.panel.style.top = "0px";
            this.panel.style.left = "0px";
        }
        const parent = this.button.parentElement === null ? document.body : this.button.parentElement;
        const style_position = window.getComputedStyle(parent).getPropertyValue("position");
        if (!this._inArray(style_position, ["fixed", "absolute", "relative"]))
            parent.style.position = "relative";
        //
        // items
        //
        if (this.options.items) {
            const ul = document.createElement("ul");
            for (let item of this.options.items) {
                const built_item = this._buildItem(item);
                ul.appendChild(built_item);
            }
            this.panel.appendChild(ul);
        }
        else {
            throw new Error("You need to define items to be displayed in the panel.");
        }
        // 
        // events
        //
        document.addEventListener("click", (e) => {
            const target = e.target;
            if (target && this.panel) {
                if (!this.panel.contains(target) && this._isOpened()) {
                    this._closePanel();
                }
            }
        });
        this.button.addEventListener("click", (e) => this._togglePanel(e));
        this.button.addEventListener("keydown", (e) => this._toggleOnKeyboardEvent(e));
        this._insertAfterButton(this.panel);
    }
    /**
     * Following the digital accessibility recommendations for this kind of panels,
     * it is necessary to open or close the panel by clicking either the Enter or Space key.
     * See {@link https://www.accede-web.com/en/guidelines/rich-interface-components/show-hide-panels/} for more information.
     * @param {KeyboardEvent} e The keyboard event.
     * @private
     */
    _toggleOnKeyboardEvent(e) {
        if (e.key === "Enter" || e.code === "Enter" || e.keyCode === 13 || e.key === " " || e.keyCode === 32 || e.code === "Space") {
            e.preventDefault();
            this._togglePanel(e);
        }
    }
    /**
     * Checks if the panel is currently opened or not.
     * @returns {boolean} True if the panel is opened.
     * @private
     */
    _isOpened() {
        if (this.panel) {
            return !this.panel.classList.contains("panel-hidden");
        }
        else {
            return false;
        }
    }
    /**
     * Open the panel if it's closed, close if it's opened.
     * @param {MouseEvent|KeyboardEvent} e The mouse event or the keyboard event.
     * @private
     */
    _togglePanel(e) {
        if (this.button && this.panel) {
            e.stopPropagation();
            if (this._isOpened()) {
                this._closePanel();
            }
            else {
                this.button.setAttribute("aria-expanded", "true");
                this.panel.classList.remove("panel-hidden");
            }
        }
    }
    /**
     * Closes the panel.
     * @private
     */
    _closePanel() {
        if (this.button && this.panel) {
            this.button.setAttribute("aria-expanded", "false");
            this.panel.classList.add("panel-hidden");
        }
    }
    /**
     * Creates a customizable div element.
     * @param {string} tagName The name of the tag.
     * @param {{id?:string,className?:string,textContent?:string,attributes?:Array<string>,styles?:Array<string>}} options The options to customize the element.
     * @returns {HTMLElement} The created element.
     * @private
     */
    _createEl(tagName, options) {
        const el = document.createElement(tagName);
        if (!options)
            return el;
        if (options.id)
            el.setAttribute("id", options.id);
        if (options.textContent)
            el.textContent = options.textContent;
        if (options.className) {
            const classes = options.className.split(" ");
            for (let clas of classes) {
                el.classList.add(clas);
            }
        }
        if (options.styles) {
            for (let style of options.styles) {
                const property = style[0];
                const value = style[1];
                el.style[property] = value;
            }
        }
        if (options.attributes) {
            for (let attr of options.attributes) {
                const name = attr[0];
                const value = attr[1];
                el.setAttribute(name, value);
            }
        }
        return el;
    }
    /**
     * Builds an item.
     * @param {{title:string,icon?:string,fontawesome_icon?:string,onclick?:Function,separator?:boolean}} item The item to build.
     * @returns {HTMLElement} The item as an HTML element.
     * @private
     */
    _buildItem(item) {
        if (item.separator) {
            const div = this._createEl("div", { className: 'jspanel-separator' });
            return div;
        }
        else {
            const li = this._createEl("li");
            if ((item.icon && !item.fontawesome_icon) || (item.icon && item.fontawesome_icon)) {
                const icon = this._createEl("img");
                icon.setAttribute("src", item.icon);
                li.appendChild(icon);
            }
            else if (!item.icon && item.fontawesome_icon) {
                const icon = this._createEl("i");
                const classes = item.fontawesome_icon.split(" ");
                for (let clas of classes)
                    icon.classList.add(clas);
                li.appendChild(icon);
            }
            if (item.title) {
                const title = this._createEl("span", { textContent: item.title });
                li.appendChild(title);
            }
            li.addEventListener('click', () => {
                if (item.onclick)
                    item.onclick();
                this._closePanel();
            });
            return li;
        }
    }
    /**
     * Checks the presence of an element in an array
     * @param {any} needle The element to search in the array.
     * @param {Array<any>} haystack The array in which to search for the element.
     * @param {boolean} strict Is the type of the needle necessary when searching? By default: false.
     * @returns {boolean} True if the needle was found.
     * @private
     */
    _inArray(needle, haystack, strict = false) {
        const length = haystack.length;
        for (let i = 0; i < length; i++) {
            if (strict) {
                if (haystack[i] === needle)
                    return true;
            }
            else {
                if (haystack[i] == needle)
                    return true;
            }
        }
        return false;
    }
    /**
     * Inserts the panel into the DOM (after the button).
     * @param {HTMLElement} panel The panel to insert after the button.
     * @private
     */
    _insertAfterButton(panel) {
        const parent = this.button.parentElement === null ? document.body : this.button.parentElement;
        parent.insertBefore(panel, this.button.nextSibling);
    }
    /**
     * Generates a random number [min;max[
     * @param {number} min The minimum number (included).
     * @param {number} max The maximum number (not included).
     * @returns {number} A random number between minimum and maximum.
     * @private
     */
    _rand(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min)) + min;
    }
}
	


</script>

    <style>
        :root {
  --panel-background-color: #B622FE;
  --panel-box-shadow: 0 0 4px rgba(204, 204, 204, 0.75);
  --panel-width: 160px;
  --panel-text-color: #fff;
  --panel-hover-item-background-color: #f4f6fa;
  --panel-hover-item-color: #385074;
  --panel-icon-width: 13px;
  --panel-separator-color: #dfe3eb;
}


        #containerj {
            position: fixed;
            bottom: 100px;
            right: 10px;
        }

        #panel-controller {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            border: none;
            outline: none;
            cursor: pointer;
            background-color: #fff;
            border: 5px solid #B622FE;
            box-shadow: 0 0 3px rgba(204, 204, 204, 0.75);
            color: #B622FE;
            font-size: 40px;
            transition: transform 200ms ease;
            
        }

        #panel-controller[aria-expanded="true"] {
            transform: rotate(45deg);
        }
    </style>

<script type="text/javascript">

	function inputNumberWithComma(str) {
	
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, ",");
	}
	
	function searchAccount() {
		f = document.myForm;
		f.action = "<%=cp%>/eggplant/transactionHistory.do";
		f.submit();
		
	}
	
	function reservation() {
		f = document.myForm;
		f.action = "<%=cp%>/eggplant/reservation.do";
		f.submit();
		
	}
	
</script>

<script type="text/javascript">
function sendIt() {
	
	var f = document.myForm;
	

	f.action = "<%=cp%>/eggplant/loan_ok2.do";
	f.submit();
}
	
</script>



<style type="text/css">
.image-card {
	background-color: white;
	display: flex;
}

.image-card .graphic {
	flex: 0 0 518px;
	overflow: hidden;
	display: flex;
}

.image-card .graphic img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.image-card .content {
	width: 550pt;
	flex-direction: column;
	padding: 57px;
	background-color: white;
}

.container {
	max-width: 800px;
	margin: 30px auto;
	padding: 1px;
	border: none;
}

.header {
	text-align: center;
	height: 0px;
	margin-bottom: 0px;
}

.header h1 {
	font-size: 30px;
	margin-top: 1px;
	color: #000000;
}

.content {
	border: none;
	margin-top: 1px;
	text-align: center;
}

.subtitle {
	border: none;
	font-size: 13pt;
	margin-bottom: 1px;
}

.subtitle span {
	display: block;
	color: red;
}

.image-container {
	margin-bottom: 1px;
	margin-top: 1px;
}

.image-container img {
	width: 700px;
	height: 490px;
}

.button-container {
	text-align: center;
}

.button-container input[type="button"]:last-child {
	margin-right: 0;
}
</style>
</head>
<body>
<form action="" method="post" name="myForm">

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
    <div style="text-align: center; padding: 0px; font-size: 30px;">
    <font>EggPlant 대출 정보</font>
    </div>
    <hr color="blue" width="300">
    
    <div class="image-card">

${error }

<div class="content">
    
    <p>  <c:if test="${dto.grade ne '신용불량'}">
    <div style="line-height: 1.5;">
      <font size="5">${dto.userId}님 반갑습니다!<br/>${dto.userName}님의 신용 등급 평가 결과는<b><span style="color: red">${dto.grade}</span>입니다.</b><br/><br/>
       대출 한도 및 이율은 오른쪽 표를<br/> 참고해 주신 후 하단 버튼을 통해<br/> 진행 하실 수 있습니다.</font>
       </div>
         </c:if></p> 
         
         <c:if test="${dto.grade eq '신용불량'}">
         <div style="line-height: 1.5;">
        <font size="5">${dto.userId}님 반갑습니다!<br/>${dto.userName}님의 신용 등급 평가 결과는<br/>
       <b><span style="color: red">${dto.grade}</span></b>입니다.<br/>
     <b><span style="color: red"> 신용 불량 등급은 대출서비스를 이용하실 수 없습니다</span></b></font></div>
      </c:if>
         
	
  </div>
  <div class="graphic">
  <img src="<%=cp%>/image/555.png" alt="이미지" class="img-card"> </div>
</div>
      <div class="button-container">
      
       <c:if test="${dto.grade ne '신용불량'}">
        <input type="button" class="eggButton" value="대출 약관 확인" onclick="sendIt();">
        <input type="button" class="eggButton" value="대출 취소" onclick="location='<%=cp %>/eggplant/main.do';">
        </c:if>
        
         
        <c:if test="${dto.grade eq '신용불량'}">
         <input type="button" value="메인 페이지" onclick="location='<%=cp %>/eggplant/main.do';">
          </c:if>
          
        <input type="hidden" name="userId" value="${dto.userId}">
        <input type="hidden" name="account" value="${dto.account}">
        <input type="hidden" name="loans" value="${dto.loans}">
      </div>
			</div>
  <div id="pageFooter">
			<div class="content_p">
			<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
			<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리<p>
			<p>TEL : 010-2023-0726</p>
			</div>
		</div>
		</div>
  </form>
  <div id="containerj">
        <button id="panel-controller">+</button>
    </div>
    <script>
        const button = document.querySelector("#panel-controller");
        const panel = new JSPanel(button, {
        	top: -100,
            right: 40,
            items: [
                { title: "ChatBot", fontawesome_icon: "fa-regular fa-comments", onclick: chatBot },
                { title: "Quick Guide", fontawesome_icon: "fa-solid fa-bolt-lightning", onclick: quickGuide },
                { separator: true, },
                { title: "Top", fontawesome_icon: "fa-solid fa-caret-up", onclick: goTop },
            ]
        });
    </script>
  <script src="<%=cp%>/data/eggplantLink.js"></script>
</body>
</html>