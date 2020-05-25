<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tfCommon" tagdir="/WEB-INF/tags/common" %>
<%
 /**
  * [메인 View]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-03-06 / 김병철 / - / 최초작성
  */	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>스마트근태관리 타임킹</title>
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/Favicon/favicon.ico"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    
    <meta name="description" content="타임킹 주요기능">    
    <meta name="author" content="타임킹">
    <meta name="robots" content="index,follow">
    <meta name="keywords" content="스마트근태관리,근태관리,시간관리,타임킹,근태어플,근태앱,52시간제,주요기능">
        
    <meta property="og:title" content="주요기능">   
    <meta property="og:description" content="타임킹 주요기능">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://www.timeking.co.kr">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js?contextPath=${pageContext.request.contextPath}"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/fade-in.js"></script>

    <script type="text/javascript">
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
        });
    </script>
</head>
<body>
     <!-- [스킵 내비게이션 Start] -->
     <div id="skip">
        <a href="#func_overview">미리보기 바로가기</a>
        <a href="#func_info1">주요기능1 바로가기</a>
        <a href="#func_info2">주요기능2 바로가기</a>
        <a href="#func_info3">주요기능3 바로가기</a>
        <a href="#func_info4">주요기능4 바로가기</a>
        <a href="#func_info5">주요기능5 바로가기</a>
        <a href="#func_info6">주요기능6 바로가기</a>
        <a href="#step">절차안내 바로가기</a>
        <a href="#price">가격안내 바로가기</a>
        <a href="#intro_appstore">앱 다운로드 바로가기</a>
    </div>
    <!-- [스킨 내비게이션 End] -->

    <div id="wrap">
		<!--top Menu Start-->
		<tfCommon:top/> 
		<!--top Menu End-->
		
        <div id="contents">
            <div id="intro_function">
                <div class="container">
                    <div class="intro_contents">
                        <h1>
                           	쉽고편한 출·퇴근 관리<br/>타임킹과 함께하세요
                        </h1> 
                        <div class="mt55">
                            <h2>
                               	스마트폰과 PC를 통해 근태업무를 언제 어디서든<br/> 쉽고 편리하게 수행할 수 있도록 지원합니다
                            </h2>
                        </div>
                    </div>
                </div>
            </div>

            <div id="func_overview">
                <div class="container">
                    <div class="func_overview">
                        <div class="func_overview_title mb40">
                            <h2 class="mb15"><span class="font40_blue_bold">타임킹 미리보기</span></h2>
                            <p>타임킹은 효율적이고 편리한 기능을제공하여 <br/>직원들과 함께 업무효율을 극대화 할수있습니다.</p>
                        </div>
                        <div id="main_func">
                            <div class="contain" style="padding-left: 40px;">
                                <ul class="main_func">
                                    <li class="fade_in" fade_in_delay="0">
                                        <span class="main_func_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                                        <div class="main_cts">
                                            <h3>출/퇴근관리</h3>
                                        	스마트폰 뿐만 아니라 간편하게<br/>
                                            PC에서도 출/퇴근이 가능합니다.<br/>
                                            GPS 위치확인 기능을 제공합니다.
                                        </div>
                                    </li>
                                    <li class="fade_in" fade_in_delay="200">
                                        <span class="main_func_icon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                        <div class="main_cts">
											<h3>근무스케줄관리</h3>
											클릭 몇번으로 손쉽게 직원들의<br/>
											근무스케줄을 작성하여 효율적으로<br/>
											업무시간을 활욜 할 수 있습니다.
                                        </div>
                                    </li>
                                    <li class="fade_in" fade_in_delay="400">
                                        <span class="main_func_icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                                        <div class="main_cts">
                                            <h3>권한별 유연한설정</h3>
											최고관리자, 중간관리자, 직원등 <br/>
											권한별 메뉴 할당 및 유연한 설정이가능합니다.
                                        </div>
                                    </li>
                                    <li class="fade_in" fade_in_delay="600">
                                        <span class="main_func_icon"><i class="fa fa-address-card" aria-hidden="true"></i></span>
                                        <div class="main_cts">
                                            <h3>업무지시</h3>
											사진뿐만 아니라 음성파일을 이용하여<br/>
											정확한 업무지시가 가능합니다.
                                        </div>
                                    </li>
                                    <li class="fade_in" fade_in_delay="800">
                                        <span class="main_func_icon"><i class="fa fa-file-text-o" aria-hidden="true"></i></span>
                                        <div class="main_cts">
                                            <h3>리포트</h3>
											업무지시 및 근태상황집계 등<br/>
											리포트를 제공하여 손쉬운 문서화가 가능합니다.
                                        </div>
                                    </li>
                                    <li class="fade_in" fade_in_delay="1000">
                                        <span class="main_func_icon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                        <div class="main_cts">
                                            <h3>메세지관리</h3>
											모바일 뿐만 아니라 PC에서도 <br/>
											개인별, 그룹별, 전사별 메세지<br/>
											사용이 가능합니다.
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="func_info1">
                <div class="container">
                    <div class="func_info1" style="position: relative;">
                        <div class="func_info_title1 mb40">
                            <h2 class="font40_blue_bold mb15">너무쉬운 출/퇴근</h2>
                            <p>직관적인 UI/UX 를 제공하여<br/>직원은 너무쉬운 출/퇴근이 가능합니다.</p>
                        </div>
                        <div class="func_info1_img">
                            <img src="${pageContext.request.contextPath}/img/func_img1_1.png" alt="주요기능1"/>
                        </div>
                        <div class="func_info1_cts">
                            <p class="mb25">
                                <span>편리하게 휴일만 체크</span><br/>
                                - 근무표 작성
                            </p>
                            <p class="mb25">
                                <span>실시간 업무신청 현황 확인</span><br/>
                                - 푸시메세지로 실시간 확인
                            </p>
                            <p>
                                <span>언제 어디서나 근무 현황 파악</span><br/>
                                - 부하직원의 근태신청 현황을 한눈에
                            </p>
                        </div>
                        <div class="func_info1_img">
                            <img src="${pageContext.request.contextPath}/img/func_img1_2.png" alt="주요기능3"/>
                        </div>
                        <div class="func_info1_cts">
                            <p class="mb25">
                                <span>편리하게 클릭 두번으로</span><br/>
                                - 기다릴 필요없이 출근체크
                            </p>
                            <p class="mb25">
                                <span>스마트폰으로 5초만에</span><br/>
                                - 연장근무 신청
                            </p>
                            <p>
                                <span>GPS 위치</span><br/>
                                - 출근체크 GPS 위치 확인 가능
                            </p>
                        </div>
                    </div>
                </div>
            </div>
           
            <div id="func_info2">
                <div class="container">
                    <div class="func_info2 pt25">
                        <div class="func_info_title2 mb40">
                            <h2 class="mb15"><span class="font40_blue_bold">권한별 유연한설정</span></h2>
                            <p>관리자는 직원별, 그룹별로<br/>유연한 설정이 가능합니다.</p>
                        </div>
                        <div class="func_info2_img">
                            <img src="${pageContext.request.contextPath}/img/adminsetting.png" alt="주요기능2"/>
                        </div>
                        <div class="func_info2_cts mt35">
                            <ul>
                                <li>
                                    <span class="font_icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                    <span class="font_blue_bold">직원별</span>
                                    <div class="cts_subtitle1">
                                        <h5>직원들의 메뉴를 직원별로 설정하여<br/>직원별 적합한 커스텀 설정이 가능합니다.</h5>
                                    </div>
                                </li>
                                <li>
                                    <span class="font_icon"><i class="fa fa-users" aria-hidden="true"></i></span>
                                    <span class="font_blue_bold">그룹별</span>
                                    <div class="cts_subtitle2">
                                        <h5>직원들의 메뉴를 그룹별로 설정하여<br/>회사에 적합한 커스텀 설정이 가능합니다.</h5>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div id="func_info3">
                <div class="container">
                    <div class="func_info3">
                        <div class="func_info_title3 mb40">
                            <h2 class="font40_blue_bold mb15">편리한 업무지시 및 보고</h2>
                            <p>직원은 스마트폰을 사용하여<br/> 편리하게 업무지시 및 보고가 가능합니다.</p>
                        </div>
                        <div class="func_info3_img">
                            <img src="${pageContext.request.contextPath}/img/func_img3.png" alt="주요기능3"/>
                        </div>
                        <div class="func_info3_cts">
                            <p class="mb25">
                                <span>스마트폰으로 10초 만에</span><br/>
                                - 사진 및 음성을 통한 정확한 지시
                            </p>
                            <p class="mb25">
                                <span>실시간 지시내용 확인</span><br/>
                                - 푸시 메세지로 실시간 지시내용 확인
                            </p>
                            <p>
                                <span>웹에서 편리하게 문서화</span><br/>
                                - 업무지시 리포트 기능 제공
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="func_info4">
                <div class="container">
                    <div class="func_info4 pt25">
                        <div class="func_info_title4 mb40">
                            <h2 class="font40_blue_bold mb15">회사별 리포트</h2>
                            <p>클릭 한번으로 업무지시, 근태상황집계 등<br/> 문서화가 손쉽게 가능합니다.</p>
                        </div>
                        <div class="func_info4_img pb40">
                            <img src="${pageContext.request.contextPath}/img/func_img4.png" alt="주요기능4"/>
                        </div>
                    </div>
                </div>
            </div>

            <div id="func_info5">
                <div class="container">
                    <div class="func_info5" style="position: relative;">
                        <div class="func_info_title5 mb40">
                            <h2 class="font40_blue_bold mb15">메세지로 스마트하게</h2>
                            <p>모바일 뿐만 아니라 PC에서도<br/> 개인별, 그룹별 메세지를 사용하여<br/>효율적인 업무를 수행할 수 있습니다.</p>
                        </div>
                        <div class="func_info5_img">
                            <img src="${pageContext.request.contextPath}/img/msg_pc.png" alt="PC주요기능5"/>
                        </div>
                        <div class="func_info5_cts">
                            <p class="mb25">
                                <span>개인별</span><br/>
                                - 개인별 메세지 수, 발신 
                            </p>
                            <p class="mb25">
                                <span>그룹별</span><br/>
                                - 그륩별 메세지 수, 발신 
                            </p>
                            <p>
                                <span>전사별</span><br/>
                                - 전사공지 및 메세지 수, 발신
                            </p>
                        </div>
                        <div class="func_info5_img mt25">
                            <img src="${pageContext.request.contextPath}/img/msg_mobile.png" alt="모바일주요기능5"/>
                        </div>
                        <div class="func_info5_cts mt25">
                            <p class="mb25">
                                <span>개인별</span><br/>
                                - 개인별 메세지 수, 발신
                            </p>
                            <p class="mb25">
                                <span>그룹별</span><br/>
                                - 그륩별 메세지 수, 발신
                            </p>
                            <p>
                                <span>전사별</span><br/>
                                - 전사공지 및 메세지 수, 발신
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="func_info6">
                <div class="container">
                    <div class="func_info6 pt25">
                        <div class="func_info_title6 mb40">
                            <h2 class="font40_blue_bold mb15">PC로 편리하게</h2>
                            <p>관리자는 더 큰 화면에서 PC웹을 사용하여<br/>근무기록을 엑셀로 다운로드하여 관리하며<br/>관리자용PC버전을 사용 할 수 있습니다.</p>
                        </div>
                        <div class="func_info6_img">
                            <img src="${pageContext.request.contextPath}/img/func_img2.png" alt="주요기능6"/>
                        </div>
                        <div class="func_info6_cts mt35">
                            <ul>
                                <li>
                                    <span class="font_icon"><i class="fa fa-download" aria-hidden="true"></i></span>
                                    <span class="font_blue_bold">엑셀변환</span>
                                    <div class="cts_subtitle1">
                                        <h5>직원들의 근무표를 엑셀기능을 이용하여<br/>리포트 형식으로 다운로드 가능합니다.</h5>
                                    </div>
                                </li>
                                <li>
                                    <span class="font_icon"><i class="fa fa-desktop" aria-hidden="true"></i></span>
                                    <span class="font_blue_bold">관리자PC</span>
                                    <div class="cts_subtitle2">
                                        <h5>관리자용 PC 버전을 제공하여 <br/>모든 운영체제에서 사용가능합니다.</h5>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div id="step">
                <div class="container">
                    <div class="step">
                        <h2>서비스 신청 절차</h2>
                        <ul>
                            <li class="fade_in" fade_in_delay="0">
                                <span class="ir_su">서비스신청</span>
                                <span class="step1">
                                    <img src="${pageContext.request.contextPath}/img/step1.png" alt="서비스신청"/>
                                </span>
                                <p>STEP 1</p>
                                <h3>서비스신청</h3>
                                <div class="div_angle_right">
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </div>
                            </li>
                            <li class="fade_in" fade_in_delay="200">
                                <span class="ir_su">서비스승인</span>
                                <span class="step2">
                                    <img src="${pageContext.request.contextPath}/img/approve.png" alt="서비스신청"/>
                                </span>
                                <p>STEP 2</p>
                                <h3>서비스승인</h3>
                                <div class="div_angle_right">
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </div>
                            </li>
                            <li class="fade_in" fade_in_delay="400">
                                <span class="ir_su">다운로드후사용</span>
                                <span class="ir_su">서비스승인</span>
                                <span class="step3">
                                    <img src="${pageContext.request.contextPath}/img/mdownload.png" alt="서비스신청"/>
                                </span>
                                <p>STEP 3</p>
                                <h3>앱 다운로드</h3>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="price">
                <div class="container">
                    <div class="price">
                        <div class="price_tit">
                            <h2>서비스요금</h2>
                        </div>
                        <div class="price_detail">
                            <ul>
                                <li>
                                    <span class="ir_su">사용료정보</span>
                                    <table style="width: 100%; border-collapse:collapse">
                                        <tr>
                                            <td><strong>기본료</strong></td>
                                            <td><strong>USER 당(원)</strong></td>
                                            <td><strong>비고</strong></td>
                                        </tr>
                                        <tr>
                                            <td><span style="color: #666666;">50,000</span></td>
                                            <td><span style="color: #666666;">1,500</span></td>
                                            <td><span style="color: #666666;">100명이상 사업장 별도문의</span></td>
                                        </tr>
                                    </table>
                                </li>
                                <li>
                                    <span class="ir_su">기능제공정보</span>
                                    <h2>기능제공목록</h2>
                                    <ul class="price_func">
                                        <li>관리자용 모바일 앱</li>
                                        <li>관리자용 PC 웹</li>
                                        <li>직원 용 모바일 앱</li>
                                        <li>관리자용 PC 웹</li>
                                        <li>업무지시, 메세지</li>
                                        <li>리포트</li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="price_custom">
                                <h2>커스터마이징 문의</h2>
                                <ul>
                                    <li>회사별 다수사업장이 필요한 경우</li>
                                    <li>문서관리가 필요한 경우</li>
                                    <li>웹팩스 기능이 필요한 경우</li>
                                    <li>회사별 리포트가 필요한 경우</li>
                                    <li>그 외 타 기능이 필요한 경우</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="intro_appstore">
                <div class="container">
                    <div class="intro_contents">
                        <h1>
							스마트근태관리서비스 앱을 설치해보세요.
                        </h1> 
                        <div class="mt25">
                            <h2>
                              	  다양한 알림서비스를 통해 근무시간을 보다<br/> 효율적으로 사용할 수 있습니다.
                            </h2>
                        </div>
                        <div class="area_ban">
                            <span class="intro_android_ban">
                                <a href="https://play.google.com/store/apps/details?id=com.blueoceansoft.workforce" target="blank">
                                    <img src="${pageContext.request.contextPath}/img/btn_google.png" style="width: 100%; height: 100%;"/>
                                </a>
                            </span>
                            <span class="intro_ios_ban">
                                <a href="https://apps.apple.com/kr/app/id979829447" target="blank">
                                    <img src="${pageContext.request.contextPath}/img/btn_apple.png" style="width: 100%; height: 100%;"/>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--Bottom Menu Start-->
		<tfCommon:bottom/> 
		<!--Bottom Menu Start-->
    </div>
</body>
</html>