<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tfCommon" tagdir="/WEB-INF/tags/common" %>
<%
 /**
  * [서비스신청 View]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-03-14 / 김병철 / - / 최초작성
  */	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>서비스 신청</title>
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/Favicon/favicon.ico"/>
  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    
   	<meta name="description" content="타임킹 방문을 환영합니다.">    
   	<meta name="author" content="타임킹">
   	<meta name="robots" content="index,follow">
    <meta name="keywords" content="스마트근태관리,근태관리,시간관리,타임킹,근태어플,근태앱,52시간제">
       
   	<meta property="og:title" content="타임킹">   
	<meta property="og:description" content="타임킹">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://www.timeking.co.kr">

    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>    	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>    	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-sky-forms.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    
    <script type="text/javascript">
        var bFlg1 = true;
        var bFlg2 = true;
        var ctx = "<%=request.getContextPath()%>";

        var sTos1 = "";
            sTos1 += "1.개인정보수집/이용목적\n";		
            sTos1 += "스마트 근태&업무관리 서비스 제공，서비스 관련 정보 제공，요금정산\n"; 
            sTos1 += "2. 개인정보 수집항목\n";
            sTos1 += "① 개인사업자 : 성명，상호명，주민번호 앞 6자리，전화번호, 사업자등록번호，서비스관리자의 성명，E-mail 주소, 전화번호\n";
            sTos1 += "② 법인사업자 : 대표자 성명，서비스관리자의 성명，E-mail 주소，전화번호;\n";
            sTos1 += "③ 공통 : 서비스 ID 및 Password, 서비스 이용기록\n";
            sTos1 += "3. 개인정보의 보유 및 이용 기간\n";
            sTos1 += "스마트 근태&업무관리 서비스 해지 시까지 보유 / 이용.\n";
            sTos1 += "단，요금분쟁등의 해결을 위해 해지일로부터 6개월간 보관하고，법령에서 개인정보 보유기간을 별도로 정한 경우 해당 기간까지 보유\n";
            sTos1 += "4. 개인정보 수집 / 이용 거부\n";
            sTos1 += "신청고객은 개인정보 수집 / 이용을 거부할 수 있습니다. 단，개인정보 수집 / 이용을 거절할 경우 스마트 근태&업무관리서비스를 제공받을 수 없습니다.\n";
			
        var sTos2 = "";
            sTos2 += "1.개인정보수집/이용목적\n";
            sTos2 += "스마트 근태&업무관리 서비스 제공，서비스 관련 정보 제공，요금정산\n";
            sTos2 += "① 개인사업자 : 성명，상호명，주민번호 앞 6자리，전화번호, 사업자등록번호，서비스관리자의 성명，E-mail 주소, 전화번호\n";
            sTos2 += "② 법인사업자 : 대표자 성명，서비스관리자의 성명，E-mail 주소，전화번호\n";
            sTos2 += "③ 공통 : 서비스 ID 및 Password, 서비스 이용기록\n";
            sTos2 += "3. 개인정보의 보유 및 이용 기간\n";
            sTos2 += "스마트 근태&업무관리 서비스 해지 시까지 보유 / 이용.\n";
            sTos2 += "단，요금분쟁등의 해결을 위해 해지일로부터 6개월간 보관하고，법령에서 개인정보 보유기간을 별도로 정한 경우 해당기간까지 보유\n";
            sTos2 += "4. 개인정보 수집 / 이용 거부\n";
            sTos2 += "신청고객은 개인정보 수집 / 이용을 거부할 수 있습니다. 단，개인정보 수집 / 이용을 거절할 경우 스마트 근태&업무관리\n";
            sTos2 += "서비스를 제공받을 수 없습니다.\n";

        $(document).ready(function(){
            var elTosTit1 = document.getElementById("tos_tit1");
            var elTosCts1 = document.getElementById("tos_cts1");
            var elTosTit2 = document.getElementById("tos_tit2");
            var elTosCts2 = document.getElementById("tos_cts2");
            var elDaumAddr = document.getElementById("btnR_ADRS_ZIP");
            var elRCts = document.getElementById("txtR_CTS");
            var elCounter = document.getElementById("counter");

            elTosCts1.innerHTML = sTos1;
            elTosCts2.innerHTML = sTos2;

            // 이용약관 클릭 이벤트
            elTosTit1.addEventListener("click", function(){
                if (bFlg1) {
                    elTosCts1.style.opacity = "1";
                    elTosCts1.style.padding = "5px 10px";
                    elTosCts1.style.borderWidth = "1px";
                    elTosCts1.style.height = "250px";
                    bFlg1 = !bFlg1;
                    toggleClass(this, "change");
                } else {
                    elTosCts1.style.opacity = "0";
                    elTosCts1.style.padding = "0";
                    elTosCts1.style.borderWidth = "0";
                    elTosCts1.style.height = "0";
                    bFlg1 = !bFlg1;
                    toggleClass(this, "change");
                }
            });

            // 개인정보보호 클릭 이벤트
            elTosTit2.addEventListener("click", function(e) {
                if (bFlg2) {
                    elTosCts2.style.opacity = "1";
                    elTosCts2.style.padding = "5px 10px";
                    elTosCts2.style.borderWidth = "1px";
                    elTosCts2.style.height = "250px";
                    toggleClass(this, "change");
                    bFlg2 = !bFlg2;
                } else {
                    elTosCts2.style.opacity = "0";
                    elTosCts2.style.padding = "0";
                    elTosCts2.style.borderWidth = "0";
                    elTosCts2.style.height = "0";
                    toggleClass(this, "change");
                    bFlg2 = !bFlg2;
                }
            });

            elRCts.addEventListener("keyup", function(e) {
                var sContent = this.value;

                elCounter.innerHTML = chkTxtAraLen(this, 500) + '/500';
            });

            // [Validation Rule 정의 Start]
            $.validator.addMethod("chkNullForText", function(value, element) {				
                var bResult = !commonIsNull($("#" + element.id).val()); 					
                return bResult;
            });
            
            $.validator.addMethod("chkFormatForEmail", function(value, element) {
                // 이메일 검증 정규식
                var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
                
                if(commonIsNull($("#" + element.id).val()) || !regExp.test($("#" + element.id).val())) {
                    bResult = false; 
                } else {
                    bResult = true;
                }
                                
                return bResult;
            });	
            
            $.validator.addMethod("chkFormatForMobile", function(value, element) {
                // 핸드폰번호 검증 정규식
                var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
                
                if(commonIsNull($("#" + element.id).val()) || !regExp.test($("#" + element.id).val())) {
                    bResult = false; 
                } else {
                    bResult = true;
                }
                                
                return bResult;
            });	
            // [Validation Rule 정의 End]		
            
            validatorFormLogin = $("#skyFrm").validate({     				
                rules: { 
                    rCpnNm: {
                        chkNullForText: true
                    },
                    rBossNm: {
                        chkNullForText: true
                    },
                    rBizNo: {
                        chkNullForText: true
                    },
                    rCpnNo : {
                        chkNullForText: true
                    },
                    rAdrsZip: {
                        chkNullForText: true
                    },
                    rAdrs: {
                        chkNullForText: true
                    },
                    rMobile: {
                        chkNullForText: true,
                        chkFormatForMobile: true
                    },
                    rTel: {
                        chkNullForText: true
                    },
                    rEmail: {
                        chkNullForText: true,
                        chkFormatForEmail : true
                    },
                    rUserCnt: {
                        chkNullForText: true
                    }
                },
                messages: {
                	rCpnNm: {
                        chkNullForText: '상호명은 필수 입력항목 입니다.'
                    },
                    rBossNm: {
                        chkNullForText: '대표자명은 필수 입력항목 입니다.'
                    },
                    rBizNo: {
                        chkNullForText: '법인등록번호는 필수 입력항목 입니다.'
                    },
                    rCpnNo: {
                        chkNullForText: '사업자등록번호는 필수 입력항목 입니다.'
                    },
                    rAdrsZip: {
                        chkNullForText: '우편번호는 필수 입력항목 입니다.'
                    },
                    rAdrs: {
                        chkNullForText: '상세주소는 필수 입력항목 입니다.'
                    },
                    rMobile: {
                        chkNullForText: '휴대폰번호는 필수 입력항목 입니다.',
                        chkFormatForMobile : '정확한 핸드폰번호를 입력해주세요.'
                    },
                    rTel: {
                        chkNullForText: '회사전화는 필수 입력항목 입니다.'
                    },
                    rEmail: {
                        chkNullForText: '이메일은 필수 입력항목 입니다.',
                        chkFormatForEmail: '정확한 이메일을 입력해주세요.'
                    },
                    rUserCnt: {
                        chkNullForText: '사용자수는 필수 입력항목 입니다.'
                    }
                },                  	            	            
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());	            	
                },
                submitHandler: function(form) {
                    if (!$('input:checkbox[id="chkbox_tos1"]').is(":checked") || !$('input:checkbox[id="chkbox_tos2"]').is(":checked")) {
                        alert("모든 이용약관에 동의해주세요.");
                        
                        $('input:checkbox[id="chkbox_tos1"]').focus();
                        return;
                    }
                    
                    $.ajax({
	    				type: "post",	    				
	    				url: "<c:url value='/service/setSubScrt'/>",
	    				data: $("#subs_list .sky-form").serialize(),
	    				async: false,
	    				cache: false, 
	    				dataType: "json", 
	    				success: function (pData) {	    					
	    					if (pData.rstCd == 200) {	
	    						location.href = ctx + "/service/subScrptSuccess";
	    					} else if (pData.rstCd == 500) {
	    						alert("pData.rstCd = 500");
	    					} else {
	    						alert("Update Error.");
	    					} 									    					
	    				}, 
	    				error: function (xhr, status, error) {							
	    					alert(error);
	    				} 
	    			});	 
                }
            });		
            
            // 확인 버튼
            $("#btnConfirm").on("click", function(e) {
                $("#skyFrm").submit();
            });	
            
            // 다음지도 클릭 이벤트
            elDaumAddr.addEventListener("click", function(){
                new daum.Postcode({
                    shorthand: false,
                    oncomplete: function(data) {
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
                        
                        $("#txtR_ADRS_ZIP").valid();
                        $("#txtR_ADRS").valid();	
                        
                        $("#txtR_ADRS").focus();
                    }
                }).open();
            });
        })


        function toggleClass(element, className) {
            var sRegExp = "(\\s|^)" + className + "(\\s|$)";
            var regChkClass = new RegExp(sRegExp);

            if (regChkClass.test(element.className)) {
                element.className = element.className.replace(regChkClass, " ").trim();
            } else {
                if (element.className == "") {
                    element.className = className   
                } else {
                    element.className += " " + className;    
                }
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
			
        function onlyNumber() {
            if (event.keyCode >= 48 && event.keyCode <= 57) {
                return true;
            } else {
                return false;
            }
        }
        
        function cust_Umask(aId) {
            var oGetElmtId = document.getElementById(aId);
            var sCustNo = oGetElmtId.value;
            sCustNo = sCustNo.replace(/-/g, '');
            oGetElmtId.value = sCustNo;
        }
    </script>
    <style type="text/css">
    	input {
    		padding: 3px 7px;
    	}
    </style>
</head>
<body>
    <div id="subs_wrap">
        <div id="subs_contents">
            <div id="subs_list">
                <ul>
                    <li class="main_tit">서비스 가입신청</li>
                    <li>
                        <h2 id="tos_tit1">이용약관</h2>
                        <textarea id="tos_cts1" name="tos_cts1" cols="30" rows="10">
                        </textarea>
                    </li>
                    <li>
                        
                        <input id="chkbox_tos1" class="chkbox_tos" type="checkbox"/>
                        <label for="chkbox_tos1">
                            <span class="tos_cts1">
                           		위의 약관 내용에 동의합니다.
                            </span>
                        </label>
                    </li>
                    <li>
                        <h2 id="tos_tit2">개인정보수집이용동의</h2>
                        <textarea id="tos_cts2" name="tos_cts2" cols="30" rows="10">
                        </textarea>
                    </li>
                    <li>
                        <input id="chkbox_tos2" class="chkbox_tos" type="checkbox"/>
                        <label for="chkbox_tos2">
                            <span class="tos_cts2">
                               	 위의 약관 내용에 동의합니다.
                            </span>
                        </label>
                    </li>
                    <li class="subs_tit pb35">서비스 신청하기</li>
                    <li class="subs_cts">
                        <form id="skyFrm" class="sky-form" style="width: 940px;">
                            <table class="subs_tbl">
                                <tr>
                                    <td class="tit">상호명</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_CPN_NM" name="rCpnNm" type="text" maxlength="100" style="width:100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                    <td class="tit">대표자명</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_BOSS_NM" name="rBossNm" type="text" maxlength="100" style="width: 100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tit">사업자등록번호</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_BIZ_NO" name="rBizNo" type="text" maxlength="11" onblur="cust_Umask('txtR_BIZ_NO');" placeholder="-없이 입력" style="width:100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                    <td class="tit">법인등록번호</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_CPN_NO" name="rCpnNo" type="text" maxlength="14" onblur="cust_Umask('txtR_CPN_NO');" placeholder="-없이 입력" style="width: 100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tit">주소</td>
                                    <td colspan="3" class="cts" style="max-width: 100%; padding: 20px 20px;">
                                        <table style="width: 100%; border-collapse: collapse;">
                                            <tr>
                                                <td width="100%">
                                                    <label>
                                                        <input id="txtR_ADRS_ZIP" name="rAdrsZip" type="text" maxlength="100" style="width :120px; height: 30px; vertical-align: middle; margin-right:10px">
                                                        <input id="btnR_ADRS_ZIP" name="btnr_Adrs_Zip" type="button" value="주소찾기" style="width: 90px; height: 36px; vertical-align: middle; background:#DCDCDC; border:1px solid #707070">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="10px"></td>
                                            </tr>
                                            <tr>
                                                <td width="100%">
                                                    <label>
                                                        <input id="txtR_ADRS" name="rAdrs" type="text" placeholder="상세주소"  maxlength="100" style="width:100%; height: 30px; vertical-align: middle;">
                                                    </label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tit">휴대폰전화</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_MOBILE" name="rMobile" type="text" maxlength="20" style="width:100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                    <td class="tit">회사전화</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_TEL" name="rTel" type="text" maxlength="20" style="width:100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tit">이메일</td>
                                    <td class="cts">
                                        <label>
                                            <input id="txtR_EMAIL" name="rEmail" type="text" maxlength="30" style="width:100%; height: 30px; vertical-align: middle;">
                                        </label>
                                    </td>
                                    <td class="tit">사용자수</td>
                                    <td class="cts"> 
                                        <label>
                                            <input id="txtR_USER_CNT" name="rUserCnt" type="text" maxlength="10" onkeypress="return onlyNumber();" style="width:100%; height: 30px; vertical-align: middle; ime-mode:disabled;">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tit">기타요청사항</td>
                                    <td colspan="3" class="cts" style="padding: 20px 20px;">
                                        <div class="count_wrap">
                                            <label>
                                                <textarea id="txtR_CTS" name="rRmk" cols="30" rows="10" style="width:100%; height:300px; resize:none; font-size:16px; font-family:Nanum, Nanum Gothic;" onkeyup="chkTxtAraLen(this, 4000)"></textarea>
                                            </label>
                                            <span id="counter">0/500자</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </li>
                    <li class="last" style="width: 940px; float:left; text-align: right;">
                    	<button type="button" id="btnConfirm"></button>
                    </li>
                </ul>
            </div>
        </div>
	</div>
    <form id="frmReqSubScpt" method="post" action="../../Service/HelpDesk/setReqSubscpt.jsp" target="_self">
        <input type="hidden" id="txtParaR_Cpn_Nm" name="rCpnNm" value="">			
        <input type="hidden" id="txtParaR_Boss_Nm" name="rBossNm" value="">
        <input type="hidden" id="txtParaR_Biz_No" name="rBizNo" value="">
        <input type="hidden" id="txtParaR_Cpn_No" name="rCpnNo" value="">
        <input type="hidden" id="txtParaR_Adrs_Zip" name="rAdrsZip" value="">
        <input type="hidden" id="txtParaR_Adrs" name="rAdrs" value="">
        <input type="hidden" id="txtParaR_Mobile" name="rMobile" value="">
        <input type="hidden" id="txtParaR_Tel" name="rTel" value="">
        <input type="hidden" id="txtParaR_Email" name="rEmail" value="">
        <input type="hidden" id="txtParaR_User_Cnt" name="rUserCnt" value="">	
        <input type="hidden" id="txtParaR_Cts" name="rRmk" value="">	
    </form>
</body>
</html>