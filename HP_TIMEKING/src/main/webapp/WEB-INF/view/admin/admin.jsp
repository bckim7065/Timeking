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
  *     2. 2022-03-14 / 김병철 / - / 수정, 삭제 기능추가
  */	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관리자</title>
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/Favicon/favicon.ico"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/Datatables/css/dataTables.responsive.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-sky-forms.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/blue.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css">
    
    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.13.1-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Datatables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Datatables/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Datatables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js?contextPath=${pageContext.request.contextPath}"></script>
   
    <script type="text/javascript">
    	let dtSvcReqLst = null; 
	    $(document).ready(function() {
			// [메인 Start]
			dtSvcReqLst = $("#svcReqTable").DataTable({						 				
				processing: false,
		        serverSide: true,		        
		        ajax: {
		        	type: "post",
		        	url: "<c:url value='/admin/getSvcReqList'/>",
		        	data: function(d) {		   		        		
		        		d.condText = $("#cond_Text").val();		        		
		        	},
		        	error: function (xhr, error, code)
		            {
		                alert("데이터를 로드중 에러가 발생하였습니다.")
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
					{data: "R_RMK", class: "txtRmk"},
					{data: "", class: "textAlign_center", 
							render: function(data, type, row) {
								let html  = "<button id=\"btn_edit\" type=\"button\" class=\"btn btn_edit\" onclick=\"openPopup(\'" + row.RS_SEQ +  "\')\">수정</button>" +  
											"<button id=\"btn_edit\" type=\"button\" class=\"btn btn_del ml10\" onclick=\"deleteReq(\'" + row.RS_SEQ +  "\')\">삭제</button>";
 								return html;
							}
						}
				],
				fnCreatedRow: function(row, data, index) {
					$(row).attr("id", data.RS_SEQ);
				},
		        pagingType: "simple_numbers",
		        pageLength: 10,
		        info: false,			        
		        ordering: false,
		        searching: false
			});
			
			// 다음지도 클릭 이벤트
			let daumAddr = document.querySelector("#btnR_ADRS_ZIP");
			daumAddr.addEventListener("click", function(){
                new daum.Postcode({
                    shorthand: false,
                    oncomplete: function(data) {
                    	console.log(data);
                        var fullAddr = '';
                        var extraAddr = '';
        
                        if (data.userSelectedType === 'R') { 
                            fullAddr = data.roadAddress;
                        } else {
                            fullAddr = data.jibunAddress;
                        }
        
                        if (data.userSelectedType === 'R') {
                            if (data.bname !== ''){
                                extraAddr += data.bname;
                            }
                            if (data.buildingName !== ''){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                        }

                        $("#txtR_ADRS_ZIP").val(data.zonecode);
                        $("#txtR_ADRS").val(fullAddr);
                        $("#txtR_ADRS").focus();
                    }
                }).open();
            });
			
			let elRCts = document.querySelector("#txtR_CTS");
			elRCts.addEventListener("keyup", function(e) {
				$("#counter").html(chkTxtAraLen(this, 500) + '/500');
            });
			
			// 검색버튼 클릭 이벤트
		    $("#btnSearch").click(function() {
		    	loadData();
		    });
		    
	    });
	   
	    // 데이터 로드
	    function loadData() {
	    	dtSvcReqLst.search($("#cond_Text").val()).draw();
	    }
	    
	    function openPopup(RS_SEQ) {
	    	let data = dtSvcReqLst.row($("#" + RS_SEQ)).data();
	    	
	    	$("#RS_SEQ").val(data.RS_SEQ);
	    	$("#R_CPN_NM").val(data.R_CPN_NM);
	    	$("#R_BOSS_NM").val(data.R_BOSS_NM);
	    	$("#R_BIZ_NO").val(data.R_BIZ_NO);
	    	$("#R_CPN_NO").val(data.R_CPN_NO);
	    	$("#txtR_ADRS_ZIP").val(data.R_ADRS_ZIP);
	    	$("#txtR_ADRS").val(data.R_ADRS);
	    	$("#R_MOBILE").val(data.R_MOBILE);
	    	$("#R_TEL").val(data.R_TEL);
	    	$("#R_EMAIL").val(data.R_EMAIL);
	    	$("#R_USER_CNT").val(data.R_USER_CNT);
	    	$("#txtR_CTS").val(data.R_RMK);
	    	$("#counter").html(chkTxtAraLen(document.querySelector("#txtR_CTS"), 500) + '/500');
	    	$("body").css("overflow", "hidden");
	    	
	    	$(".popup").show();
	    }
	    
	    function closePopup(bool) {
	    	if (event.target === document.querySelector(".pop_close") || event.target === document.querySelector(".popup") || bool) {
	    		$(".popup ").hide();
	    		$("body").css("overflow", "auto");
	    	}
	    }
	    
	    function deleteReq(RS_SEQ) {
	    	if (confirm("정말 삭제하시겠습니까?")) {
	    		$.ajax({
					type: "post",	    				
					url: "<c:url value='/admin/delete/'/>" + RS_SEQ,
					async: false,
					cache: false, 
					dataType: "json", 
					success: function (response) {	    					
						if (response.rstCd == 200) {	
							alert("정상적으로 삭제되었습니다.");
							dtSvcReqLst.draw();
							//location.href = ctx + "/service/subScrptSuccess";
						} else if (response.rstCd == 500) {
							alert("삭제도중 문제가 발생하였습니다.\r\n관리자에게 문의하세요.");
							console.log(response.msg);
						}								    					
					}, 
					error: function (xhr, status, error) {							
						alert(error);
					} 
				});	 
	    	}
	    }
	    
	    function chkTxtAraLen(element, maxByte) {
			var sTxtValue = element.value;
			var nTxtValLen = sTxtValue.length;
			var nSubStrLen = 0;
			var nTotalByte = 0;
			var sTmpStr = "";
			
			for (var i = 0; i < nTxtValLen; i++) {
				sTmpStr = sTxtValue.charAt(i);
				
				if (escape(sTmpStr).length > 4) {
					nTotalByte += 2;
	            } else {
	            	nTotalByte++;
	            }
				
				if (nTotalByte <= maxByte) {
					nSubStrLen++;
		        }
	
			}
			
			if (nTotalByte > maxByte) {
				 alert("글자수는 영문 " + maxByte + "자, 한글" + (maxByte / 2) + "자를 초과 할 수 없습니다."); 
				 element.value = sTxtValue.substr(0, nSubStrLen);
				 element.focus();
			}
			
			return nTotalByte;
		}
	    
	    function updateReq() {
	    	$.ajax({
				type: "post",	    				
				url: "<c:url value='/admin/updateReq'/>",
				data: $("#popup_form").serialize(),
				async: false,
				cache: false, 
				dataType: "json", 
				success: function (response) {	    					
					if (response.rstCd == 200) {	
						alert("정상적으로 수정되었습니다.");
						closePopup(true);
						dtSvcReqLst.draw();
					} else if (pData.rstCd == 500) {
						alert("저장중 오류가 발생하였습니다.\r\n관리자에게 문의하세요.");
						console.log(response.msg);
					} 
				}, 
				error: function (xhr, status, error) {							
					alert(error);
				} 
			});	 
	    }
	    
	    function condTextKeyUp() {
	    	if (event.keyCode == 13) {
	    		loadData();
	    	}
	    }
    </script>
    
    <style>
    	.btn_edit {
    		background-color: #39bb3b;
    		color: #fff;
    	}
    	.btn_del {
    		background-color: #d1504d;
    		color: #fff;
    	}
    	.ml10 {
    		margin-left: 7px !important;
    	}
    	.popup {
    		display: none;
    		position: fixed;
    		z-index: 100;
    		top: 0;
    		left: 0;
    		width: 100vw;
    		height: 100vh;
    		background-color: rgba(0, 0, 0, 0.8);
   		}
   		.popup_header {
   			position: relative;
   			font-size: 25px;
   			font-weight: bold;
   			margin-bottom: 5px;
   			height: 45px;
   			background-color: #0071bc;
   			color: #fff;
   		}
   		.popup_header .pop_title  {
   			padding-left: 15px;
   		}
   		.popup_header .pop_close {
   			position: absolute;
   			top:0;
   			right: 10px;
   			cursor: pointer;
   		}
   		.popup_container {
   			display: inline-block;
   			position: relative;
   			width: 50%;
   			height: 50%;
   			background-color: #fff;
   			top: 50%;
   			left: 50%;
   			transform: translate(-50%, -50%);
   			box-sizing: border-box;
   			border: solid 1px #0071bc;
   			border-radius: 6px;
   		}
		.popup_container .table_wrap {
			overflow: auto;
			height: calc(100% - 65px);
			padding: 0 20px;
			box-sizing: border-box;
   		}
   		.popup_container table {
   		}
   		.popup_container table th, .popup_container table td {
   			padding: 5px 0;
   		}
   		.popup_container table tr > th:nth-child(3) {
   			padding-left: 10px;
   		}
   		.popup_container table input {
   			width: 100%;
   			box-sizing: border-box;
   			border: 1px solid #9fa0a3;
   			padding: 5px 3px;
   		}
   		.count_wrap {
   			padding-bottom: 25px;
   		}
   		.txtaligh_right {
   			text-align: right;
   		}
    </style>
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
					<form class="sky-form form-cond" style="border:none; padding:25px;" onsubmit="return false;">																
						<div class="divSearch">		
							<label class="lblSearch_tit">업체명/사업자번호</label> 	
							<div style="display: width: auto;">
								<input type="text" id="cond_Text" class="txtSearch" onkeyup="condTextKeyUp()">
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
	                                <th>편집</th>
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
		<form id="popup_form">
			<input id="RS_SEQ" name="RS_SEQ" value="" type="hidden">
			
			<div class="popup" onclick="closePopup()">		
				<div class="popup_container">
					<header class="popup_header">
						<span class="pop_title">서비스 수정</span>
						<span class="pop_close" onclick="closePopup()">ⓧ</span>
					</header>
					<div class="table_wrap">
						<table class="subs_tbl" style="width: 100%; border-bottom: none; border-top: none;">
							<colgroup>
								<col width="100px;"/>
								<col width="*"/>
							</colgroup>
							<tbody>
								<tr>
									<th>상호명</th>
									<td><input id="R_CPN_NM" name="R_CPN_NM"></td>
								</tr>
								<tr>
									<th>대표자명</th>
									<td><input id="R_BOSS_NM" name="R_BOSS_NM"></td>
								</tr>
								<tr>
									<th>사업자등록번호</th>
									<td><input id="R_BIZ_NO" name="R_BIZ_NO"></td>
								</tr>
								<tr>
									<th>법인등록번호</th>
									<td><input id="R_CPN_NO" name="R_CPN_NO"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<table style="width: 100%; border-collapse: collapse;">
											<tr>
												<td width="100%">
													<input id="txtR_ADRS_ZIP" name="rAdrsZip" type="text" maxlength="100" style="width :120px; height: 30px; vertical-align: middle; margin-right:10px">
													<input id="btnR_ADRS_ZIP" name="btnr_Adrs_Zip" type="button" value="주소찾기" style="width: 90px; height: 30px; vertical-align: middle; background:#DCDCDC; border:1px solid #707070">
												</td>
											</tr>
											<tr>
												<td width="100%">
													<input id="txtR_ADRS" name="rAdrs" type="text" placeholder="상세주소"  maxlength="100" style="width:100%; height: 30px; vertical-align: middle;">
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td><input id="R_MOBILE" name="R_MOBILE"></td>
								</tr>
								<tr>
									<th>회사전화</th>
									<td><input id="R_TEL" name="R_TEL"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input id="R_EMAIL" name="R_EMAIL"></td>
								</tr>
								<tr>
									<th>사용자수</th>
									<td><input id="R_USER_CNT" name="R_USER_CNT"></td>
								</tr>
								<tr>
									<th>기타요청사항</th>
									<td>
										<div class="count_wrap">
											<textarea id="txtR_CTS" name="rRmk" cols="30" rows="10" style="width:100%; height:300px; resize:none; font-size:16px; font-family:Nanum, Nanum Gothic;" onkeyup="chkTxtAraLen(this, 4000)"></textarea>
											<span id="counter">0/500자</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="txtaligh_right"><button type="button" id="btnConfirm" onclick="updateReq()"></button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
    </div>
</body>
</html>