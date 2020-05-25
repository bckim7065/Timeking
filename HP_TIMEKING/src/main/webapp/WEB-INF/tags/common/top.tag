<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%							
/** 
 * [Top Frame]
 *
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-21 / 김병철 / - / 최초작성
 */
%>
<script type="text/javascript">
</script>
<div id="header">
    <div class="container">
        <div class="nav_logo">
            <h1 class="ir_su">nav_logo</h1>
            <a href="#"><img src="${pageContext.request.contextPath}/img/logo_top.png" alt="logo_top"></a>
        </div>
        <div class="nav_menu">
            <h1 class="ir_su">nav_menu</h1>
            <ul class="gnb_menu">
                <li><a href="#func_overview">주요기능</a></li>
                <li><a href="#step">절차안내</a></li>
                <li><a href="javascript:commonPopupPage('subScribe');">서비스신청</a></li>
                <li><a href="#price">서비스요금</a></li>
                <li class="admin_link">
               		<span class="at_bar" style="height: 16px; margin-left: 0; margin-right: 15px;"></span>
                	<a href="javascript:commonMovePage('admin');">
                		관리자
                	</a>
               	</li>
            </ul>
        </div>
        <div id="h_bar">
            <span class="h_bar">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </span>
        </div>
    </div>
</div>
<div id="nav_hmenu">
	<ul class="gnb_hmenu">
        <li><a href="#func_overview">주요기능</a></li>
        <li><a href="#step">절차안내</a></li>
        <li><a href="javascript:commonPopupPage('subScribe');">서비스신청</a></li>
        <li><a href="#price">서비스요금</a></li>
        <li class="admin_link">
	       	<a href="javascript:commonMovePage('admin');">
	       		관리자
	       	</a>
  		</li>
    </ul>
</div>