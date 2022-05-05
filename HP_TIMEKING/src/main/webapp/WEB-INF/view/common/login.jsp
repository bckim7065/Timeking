<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tfCommon" tagdir="/WEB-INF/tags/common" %>
<%
 /**
  * [관리자페이지로그인 View]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-03-14 / 김병철 / - / 최초작성
  */	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인</title>
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/Favicon/favicon.ico"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    
    <meta name="robots" content="noindex,nofollow">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>    	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js?contextPath=${pageContext.request.contextPath}"></script>
	
    <script type="text/javascript">
	    $(document).ready(function() {	
			validatorFormLogin = $("#formLogin").validate({
	            rules: {
	            	userId: {
	                    required: true
	                }, 
	                userPwd: {
	                    required: true	                    
	                }
	            },
	            messages: {
	            	userId: {
	                	required: '사용자ID를 입력하세요.'
	                },
	                userPwd: {
	                	required: '비밀번호를 입력하세요.'
	                }
	            },                  	            	            
	            errorPlacement: function(error, element) {
	                error.insertAfter(element.parent());	            	
	            },
	            submitHandler: function(form) {	            	
	            	$.ajax({
	    				type: "post",
	    				url: "<c:url value='/admin/loginProcess'/>",
	    				data: ({	
	    					"userId": $("#userId").val(),
	    					"userPwd": $("#userPwd").val()
	    				}),
	    				async: false,
	    				cache: false,
	    				dataType: "json",
	    				success: function (pData) {	    					
	    					if (pData.rstCd == 200) {					    					
								if (!commonIsNull(pData.url)) {    								    							
	    							location.href = pData.url;		
	    						} else {
	    							commonMovePage("admin");
	    						}	
	    					} else if (pData.rstCd == 400) {
	    						$("#userPwd").val("");
	    						validatorFormLogin.element("#userPwd");
	    						
	    						var sHtml = "";
	    						sHtml += '<div class="alert">';
	    						sHtml += '    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
	    						sHtml += '    <i class="fa fa-exclamation-circle"></i> ' + pData.errMsg;	    						
	    						sHtml += '</div>';  
	    						
	    						$("#divMsgLoginCheckResult").html(sHtml);
	    						
	    						$(".close").click(function() {
	    							$("#divMsgLoginCheckResult").empty();
	    						});	
	    					} else {
	    						alert("Login Error.");
	    					}												    					
	    				}, 
	    				error: function (xhr, status, error) {							
	    					alert(error);
	    				} 
	    			});		
	            }
	        })
	    });
    </script>
</head>
<body>
    <div id="login_wrap">
        <div class="login_container">
			<form id="formLogin" class="login_form" method="post">
                <div class="login_header">
                    <h2>Login</h2>
                </div>

	            <div class="mt45 mb15">	
                    <label class="input">
                        <div class="input-group">							
                            <span class="input-group-addon"><i class="fa fa-user" style="width:14px"></i></span>
                            <input type="text" placeholder="ID" id="userId" name="userId">
                        </div>															
                    </label>				 			
                </div>
                
                <div class="mb15">
                    <label class="input">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock" style="width:14px"></i></span>
                            <input type="password" placeholder="PASSWORD" id="userPwd" name="userPwd">
                        </div>
                    </label>
                </div>		
                <div id="divMsgLoginCheckResult">
               	</div>
                <div class="mb15" style="height: 21px">						
                    <button class="btn_login pull-right">Login</button>    		
                </div>
        		<div class="demoDesc mt25">
        			데모계정 비밀번호로 로그인 가능합니다.<br>
        			admin / admin
               	</div>	
			</form>
        </div> 
    </div>
</body>
</html>