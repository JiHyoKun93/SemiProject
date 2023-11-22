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
<title>피같은 돈 보내는곳</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/reservation.css" />
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/chatbot.css" />
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />


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

.eggButtonReservation{
	width: 300px;
    margin: auto;
    padding: auto;
    margin-top: 10px;
    margin-bottom: 10px;
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



</head>
<body>

	<form action="" name="myForm" method="post">
	
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
						<div style="text-align: center; font-size: 50px; margin-bottom: 50px;">이&nbsp;&nbsp;&nbsp;&nbsp;체</div>
						<div>${userAccount }</div>
						<input type="hidden" name="userAccount" value="${userAccount }"/>
						<div class="group">
							<input type="text" name="targetBank" required value=""/>
							<span class="highlight"></span>
							<span class="bar"></span>
							<label>은행 이름</label>
						</div>
						<div class="group">
							<input type="text" required name="targetName" value="">
							<span class="highlight"></span>
							<span class="bar"></span>
							<label>받는 사람</label>
						</div>
						<div class="group">
							<input type="text" required name="targetAccount" value="">
							<span class="highlight"></span>
							<span class="bar"></span>
							<label>받는 계좌</label>
						</div>
						<div class="group">
							<input type="password" required name="userPwd" value="">
							<span class="highlight"></span>
							<span class="bar"></span>
							<label>비밀 번호</label>
						</div>
						<div class="group">
							<input type="text" required name=sendSaving value="">
							<span class="highlight"></span>
							<span class="bar"></span>
							<label>입금 금액</label>
						</div>
						<div class="group">
							<input type="datetime-local" id="default-input-date" name="sendTime" value="0000-00-00T00:00:00">
							<p class="label_date">예약 시간</p>
						</div>
					<input type="button" class="eggButtonReservation eggButton" value="보내기" onclick="sendIt();">
					<input type="button" class="eggButtonReservation eggButton" value="돌아가기" onclick="location='<%=cp%>/eggplant/accountCheck.do'">
				    
				
			</div>

				<div id="pageFooter">
					<div class="content_p">
						<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
						<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리
						<p>
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
<script type="text/javascript">
	var f = document.myForm;
	
	function sendIt() {
		f.action = "<%=cp%>/eggplant/reservation_lo.do";
		f.submit();
	}

	$("#custom-input-date").datepicker({
		dateFormat : 'dd/mm/yy'
	});

	//ACTIONS
	$("input").on("change", function(e) {
		$(this).siblings(".label-error").text("");
		$(this).removeClass("error");
	})

	$("#custom-input-date").on("focusout", function(e) {
		if ($(this).val() != '') {
			dateValidation($(this));
		}
	})

	//CHECK
	function dateValidation(input) {
		var errorLabel = input.siblings(".label-error");
		var date = input.val();

		input.removeClass("error");
		errorLabel.text("");

		var matches = /^(\d{1,2})[/\/](\d{1,2})[/\/](\d{4})$/.exec(date);
		if (matches == null) {
			input.addClass("error");
			errorLabel.text("Date not valid.");
		}
		;

		var d = matches[1];
		var m = matches[2] - 1;
		var y = matches[3];
		var composedDate = new Date(y, m, d);

		if (composedDate.getDate() == d && composedDate.getMonth() == m
				&& composedDate.getFullYear() == y) {
		} else {
			input.addClass("error");
			errorLabel.text("Date not valid.");
		}
	}
</script>
<script src="<%=cp%>/data/eggplantLink.js"></script>

</body>
</html>