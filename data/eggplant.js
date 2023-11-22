window.scrollTo(0, 0);
// function([string1, string2],target id,[color1,color2])    
consoleText(['Enjoy  Guarantee  Great','Practice  Like  Aattracted  Need  Trust', '더 나은 내일을 위한 은행'], 
		'text', ['black', 'black','black']);


function consoleText(words, id, colors) {
  if (colors === undefined) colors = ['#fff'];
  var visible = true;
  var con = document.getElementById('console');
  var letterCount = 1;
  var x = 1;
  var waiting = false;
  var target = document.getElementById(id);
  target.setAttribute('style', 'color:' + colors[0]);
  window.setInterval(function () {

	const scrolled = window.pageYOffset;
    if (letterCount === 0 && waiting === false) {
      waiting = true;
      
      target.innerHTML = words[0].substring(0, letterCount);
      window.setTimeout(function () {
        var usedColor = colors.shift();
        colors.push(usedColor);
        var usedWord = words.shift();
        words.push(usedWord);
        x = 1;
        target.setAttribute('style', 'color:' + colors[0]);
        letterCount += x;
        waiting = false;
      }, 200);
      
    } else if (letterCount === words[0].length + 1 && waiting === false) {
      waiting = true;
      window.setTimeout(function () {
        x = -1;
        letterCount = 0;
        waiting = false;
      }, 1000);
    } else if (waiting === false) {
      target.innerHTML = words[0].substring(0, letterCount);
      letterCount += x;
    }
  
  }, 100);

}


let header = document.getElementById('header');
let scrollTrigger = document.querySelector('#intro').offsetTop - 300; // 헤더가 나타날 스크롤 위치

window.onscroll = function() {

  let scrolled = window.pageYOffset;
	console.log(scrolled);
	console.log(scrollTrigger);
  if (scrolled >= scrollTrigger) {
	
    header.classList.remove('hidden');
    
  } else {
    header.classList.add('hidden');
  }
 
};


function applyWindowSizeToBox() {
	const boxElement = document.getElementById('page-body');
	const videoElement = document.getElementById('video_p');
	const introElement = document.getElementById('intro');
	const aboutElement = document.getElementById('about');
	const contactElement = document.getElementById('contact');
	const serviceElement = document.getElementById('service');
	const windowWidth = window.innerWidth;
	const windowHeight = window.innerHeight;

	// 브라우저 창 크기를 #box 요소의 width와 height에 적용
	boxElement.style.width = windowWidth + 'px';
	boxElement.style.height = (windowHeight) + 'px';
	
	videoElement.style.width = windowWidth + 'px';
	videoElement.style.height = (windowHeight) + 'px';

	introElement.style.width = windowWidth + 'px';
	introElement.style.height = (windowHeight) + 'px';
	
	aboutElement.style.width = windowWidth + 'px';
	aboutElement.style.height = (windowHeight) + 'px';
	
	contactElement.style.width = windowWidth + 'px';
	contactElement.style.height = (windowHeight) + 'px';

	serviceElement.style.width = windowWidth + 'px';
	serviceElement.style.height = (windowHeight) + 'px';
}
window.addEventListener('load', applyWindowSizeToBox);
window.addEventListener('resize', applyWindowSizeToBox);
