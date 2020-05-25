 /**
  * [fade_in Effect]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-04-26 / 김병철 / - / 최초작성
  */	
var arrFadeInEl = new Array();
var arrAnimateQueue = new Array();
var mChkQueueEl = new Map();;
var elTarget = null;
var timer;

$(document).ready(function() {
	fadeInInit();
});


function fadeInInit() {
	arrFadeInEl = $(".fade_in");
	
	for (var i = 0; i < arrFadeInEl.length; i++) {
		$this = arrFadeInEl[i];
		
		var sTop = "50px";
		var sDuration = "1.5";
		var sTimingFunc = "ease";
		var sDelay = ($($this).attr("fade_in_delay") != undefined ? $($this).attr("fade_in_delay") : 0);
		
		sDuration = makeOptText("n", sDuration);
		sTimingFunc = makeOptText("s", sTimingFunc);
		
		sDelay = sDelay / 1000 ;
		sDelay = makeOptText("n", sDelay);
		
		var sOption = {
				"opacity":"0",
				"position":"relative",
				"top":sTop,
				"transition-property":"opacity,top",
				"transition-duration": sDuration,
				"transition-timing-function":sTimingFunc,
				"transition-delay": sDelay
		}
		
		$($this).css(sOption);
	}
	
	triggerFadeIn();
	window.addEventListener('scroll', function() {
	    if(!timer) {
	        timer = setTimeout(function() {
	            timer = null;
		triggerFadeIn();
	        }, 100);
	    }	
	});
	
	//$(window).scroll(triggerFadeIn);
}

function triggerFadeIn() {
	for (var i = 0; i < arrFadeInEl.length; i++) {
		elTarget = arrFadeInEl[i];
		
		if(elTarget.style.opacity == "0") { 
			if (mChkQueueEl.has(elTarget)) {
				continue;
			} else {
				var nObj_top = $(elTarget).offset().top;
				var nWindowBottom = $(window).scrollTop() + $(window).height();
				
				if (nWindowBottom > nObj_top) {
					arrAnimateQueue.push(elTarget);
					mChkQueueEl.set(elTarget, i);
				}
			}
		} else {
			continue;
		}
	}
	
	triggerFadeInQueue();
}

function triggerFadeInQueue() {
	if (arrAnimateQueue.length != 0) {
		$this = arrAnimateQueue.shift();
		
		$($this).css({"opacity":"1", "top":"0px"});
		triggerFadeInQueue();
	}
}

function makeOptText(aDivCd, aStr) {
	if (aDivCd == "n") {
		return aStr + "s" + "," + aStr + "s";
	} else {
		return aStr + "," + aStr;
	}
}