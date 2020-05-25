<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tfCommon" tagdir="/WEB-INF/tags/common" %>
<%
 /**
  * [관리자페이지 View]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-03-14 / 김병철 / - / 최초작성
  */	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관리자</title>
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/Favicon/favicon.ico"/>
    
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    
    <meta name="description" content="서비스신청내역">    
    <meta name="author" content="타임킹">
      <meta name="robots" content="noindex,nofollow">
    <meta name="keywords" content="스마트근태관리,근태관리,시간관리,타임킹,근태어플,근태앱,52시간제,주요기능">
        
    <meta property="og:title" content="서비스신청내역">   
    <meta property="og:description" content="서비스신청내역">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://www.timeking.co.kr">
    
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/Datatables/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-sky-forms.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/blue.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Datatables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Datatables/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Datatables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js?contextPath=${pageContext.request.contextPath}"></script>
   
    <script type="text/javascript">
	    $(document).ready(function() {
			// [메인 Start]
			// 연결 어플리케이션 목록 테이블 정의
			var dtSvcReqLst = $("#svcReqTable").DataTable({						 				
				processing: true,
		        serverSide: true,		        
		        ajax: {
		        	type: "post",
		        	url: "<c:url value='/admin/getSvcReqList'/>",
		        	data: function(d) {		   		        		
		        		d.condText = $("#cond_Text").val();		        		
		        	}						
		        },
		        columns: [									 							
		        	{data: "R_DTTM", class: "textAlign_center"},							
					{data: "R_CPN_NM"},
					{data: "R_BOSS_NM"},
					{data: "R_MOBILE", class: "textAlign_center"},
					{data: "R_TEL"},
					{data: "R_BIZ_NO", class: "textAlign_center"},	
					{data: "R_CPN_NO", class: "textAlign_center"},	
					{data: "R_EMAIL"},	
					{data: "R_USER_CNT", class: "textAlign_center"},
					{data: "R_RMK", class: "txtRmk"}
				],					 							
		        pagingType: "simple_numbers",
		        pageLength: 10,
		        info: false,			        
		        ordering: false,
		        searching: false 
			});
			
			// 조회조건 검증			
			$(".admin_contents .sky-form").validate({  				 				                         	            	            
	            errorPlacement: function(error, element) {
	                error.insertAfter(element.parent());	            	
	            },
	            submitHandler: function(form) {	            	
	            	loadData();           	
	            }
	        });	 	
			
		    // 검색버튼 클릭 이벤트
		    $("#btnSearch").click(function() {
		    	loadData();
		    });
		    
		    // 데이터 로드
		    function loadData() {
		    	dtSvcReqLst.search($("#cond_Text").val()).draw();
		    }
	    });
    </script>
</head>
<body>
    <div id="admin_wrap">
        <div class="admin_header">
        	<div class="container">
	            <div class="logo">
	                <img src="${pageContext.request.contextPath}/img/logo_top_white.png"/>
	            </div>
	            <div class="admin_menu">
		            <h1 class="ir_su">login_bar</h1>
		            <ul class="login_bar">
		                <li style="color: #fff">${connectionUserMd.fullname} 님<span class="at_bar" style="margin-right: 10px; background: #fff; vertical-align: -2px"></span> </li>
		                <li><a href="javascript:commonMovePage('logout');">로그아웃</a><span class="at_bar" style="margin-right: 10px; background: #fff; vertical-align: -2px"></span></li>
		                <li><a href="javascript:commonMovePage('main');">HOME</a></li>
		            </ul>
		        </div>
            </div>
        </div>
        <div class="admin_contents">
        	<div class="container">
	            <h2>서비스 신청내역</h2>
				
				<div class="area_search mb30">
					<form class="sky-form form-cond" style="border:none; padding:25px;">																
						<div class="divSearch">		
							<label class="lblSearch_tit">업체명/사업자번호</label> 	
							<div style="display: width: 100%;">
								<input type="text" id="cond_Text" class="txtSearch"">
								<button id="btnSearch" type="button" class="btn-u pull-right">
									<span aria-hidden="true" class="icon-search" style="margin-right:7px"></span>검색
								</button>
							</div>	
						</div>						                    			 
					</form>
				</div>
				
	            <div class="cts_list">
					<div style="width:100%;">
						<table id="svcReqTable" class="table table-bordered dt-responsive" style="width: 100%; border-collapse: separate;">				
							<thead>
								<tr>											
									<th>신청일</th>
	                                <th>회사명</th>
	                                <th>대표자</th>
	                                <th>핸드폰</th>
	                                <th>전화번호</th>
	                                <th>사업자번호</th>
	                                <th>법인번호</th>
	                                <th>이메일</th>
	                                <th>유저수</th>
	                                <th>비고</th>
								</tr>										
							</thead>																								
						</table>
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