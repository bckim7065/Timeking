<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tfCommon" tagdir="/WEB-INF/tags/common" %>
<%							
/** 
 * [신청완료 View]
 *
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-17 / 김병철 / - / 최초작성
 */
%>
<!DOCTYPE html>
<html>
<head>
	<title>서비스신청완료</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    
    <meta name="description" content="서비스신청완료">    
    <meta name="author" content="타임킹">
    <meta name="robots" content="index,follow">
    <meta name="keywords" content="스마트근태관리,근태관리,시간관리,타임킹,근태어플,근태앱,52시간제,주요기능">
        
    <meta property="og:title" content="서비스신청완료">   
    <meta property="og:description" content="서비스신청완료">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://www.timeking.co.kr">
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeking.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	
	<script type="text/javascript">
		function closePopup() {
			window.close();
		}
	</script>
<title>서비스 신청 완료</title>
</head>
<body>
	<div class="wrap">
        <div class="sucess_img">
            <img src="${pageContext.request.contextPath}/img/step1.png" alt="신청완료"/>
        </div>
        <div class="sucess_contents">
            <h2><span class="font_blue_bold" style="font-size: 35px">서비스신청</span>이<span class="font_blue_bold" style="font-size: 35px">완료</span> 되었습니다.</h2>
            <p>담당자가 빠른 확인 후 연락드리겠습니다.<br><p>
            <p>자세한 업무 및 영업관련 문의는 <strong style="color:#0d55e4"> timeking@gmail.co.kr</strong> 로 연락 바랍니다.</p>
            <div class="mt20">
                <a href="javascript:closePopup()" class="btn_close">
					<i class="fa fa-times-circle"></i>
					 닫기
                </a>
            </div>
        </div>
    </div>
</body>
</html>