 /**
  * [view]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-12-13 / 김병철 / - / 최초작성
  *     							- Header fade in/out 추가
  *     							- Back-To-Top 기능 추가
  */	

var nPreScrollTop = 0;
var nWindowScrollTop = 0;
var nChkTimer = null;

$(document).ready(function() {  
    $("a").on('click', function(e) {
        if (this.hash !== "") {
            e.preventDefault();

            var hash = this.hash;

            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function() {
                window.location.hash = hash;
            });
        }
    });

    $("#h_bar").on("click", function(e) {
        $("#nav_hmenu").toggleClass("on");
    });
    
    $("#top_control").on("click", function(e) {
    	 $('html, body').animate({
             scrollTop: 0
         }, 800, function() {
             window.location.hash = "";
         });
    });
    
    window.addEventListener('scroll', function() {
    	chkHeader();	
	});
    
    window.addEventListener('resize', function() {
    	chkHeader();	
	});
});

function chkHeader() {
	if(!nChkTimer) {
		nChkTimer = setTimeout(function() {
			nChkTimer = null;
			
			nWindowScrollTop = $(window).scrollTop();
			
			if (window.outerWidth <= 780) {
				return
			}
			
			if (nPreScrollTop >= nWindowScrollTop) {
				$("#header").css({"position" : "fixed", "top" : "0", "left" : "0", "transform" : "translateY(0px)"});
			} else {
				$("#header").css({"position" : "fixed", "top" : "0", "left" : "0", "transform" : "translateY(-80px)"});
			}
			
			nPreScrollTop = nWindowScrollTop;
        }, 350);
    }	

	enableControl();
}

function enableControl() {
	if (nWindowScrollTop >= 1900) {
		$("#top_control").css({"display" : "block"});
	} else {
		$("#top_control").css({"display" : "none"});
	}
}