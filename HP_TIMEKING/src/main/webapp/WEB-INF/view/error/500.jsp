<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tfCommon" tagdir="/WEB-INF/tags/common" %>
<%
 /**
  * [404에러 View]
  *
  * 관리책임 : 김병철
  * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
  *     1. 2020-03-16 / 김병철 / - / 최초작성
  */	
%>
<!DOCTYPE html>
<html>
<head>
	<title>에러</title>
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/Favicon/favicon.ico"/>
	   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="에러">
    <meta name="author" content="Timeking">
    <meta name="robots" content="noindex,nofollow">   
    <meta property="og:title" content="404">   
    <meta property="og:description" content="404">
    <meta property="og:type" content="website">  
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
	
</head>
<body>
	<!--top Menu Start-->
		<tfCommon:top/> 
	<!--top Menu End-->
	
	<div class="container" style="height:auto; text-align: center; min-height: 500px;">
		<div class="error_contents">
			<div class="error_img">
				<img src="${pageContext.request.contextPath}/img/404_error.gif" />
			</div>
			<div class="error_tit">
				<p style="font-size:25px;">
					<strong style="color: #4A67A0;">							
						<br/><br/>서비스 이용에 불편을 드려 죄송합니다.<br/>
						"서비스 처리도중 문제가 발생하였습니다."<br/><br/>
					</strong>
				</p>		
				<span>
					지속적으로 메세지가 표시된다면<br>
					관리자에게 문의하세요.
				</span>
				<div class="error_btn">
					<button onclick="commonMovePage('main'); return false;">홈으로 가기</button>
				</div>
			</div>
		</div>							
	</div>
	
	<!--Bottom Menu Start-->
		<tfCommon:bottom/> 
	<!--Bottom Menu Start-->
</body>
</html>