<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.example.sample.service.LoginVO" %>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>메인페이지</title>
    <link rel="stylesheet"  href="./css/egovframework/classtimetable_style.css">
     <script type="text/javaScript" language="javascript" defer="defer">
        function fn_egov_Select() {
        	if(${loginName != null}) {
        		if(true) {
        		document.listForm.action = "<c:url value='/classSelectpage.do'/>";
               	document.listForm.submit();
        		} 
        	} else if(${loginName == null}) {
        		if(true) {
       			var con_test = confirm("로그인이 필요합니다.");
	   	           	if(con_test == true) {
	   	           		window.location.href = "<c:url value='/login.do'/>";
	   	           	} else {
	   	           		return;
	   	           	}
           		}
        	}
        }
        function fn_egov_time() {
        		if(${loginName != null}) {
            		if(true) {
            		document.listForm.action = "<c:url value='/Classtimetable.do'/>";
                   	document.listForm.submit();
            		} 
            	} else if(${loginName == null}) {
            		if(true) {
            		var con_test = confirm("로그인이 필요합니다.");
	    	           	if(con_test == true) {
	    	           		window.location.href = "<c:url value='/login.do'/>";
	    	           	}else {
	       	           		return;
	       	           	}
            		}
            	}
            }
       </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <div class="contain">
    <div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapsehead">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></a>
				</h4>
				</div>
			<div id="collapsehead" class="panel-collapse collapse in">
			<div class="panel-body">
				<li class="panel-font"><a href="javascript:fn_egov_Select()">출결관리</a></li>
				<li class="panel-font"><a href="javascript:fn_egov_time()">강의시간표</a></li>
				<li class="panel-font"><a href="collegemain.do">대학 홈페이지</a></li>
			</div>
			</div>
		</div>
		<div id = "logo"><a href="mainpage.do">E Z E N</a></div>
		<%
       LoginVO loginVO = (LoginVO)session.getAttribute("loginVO"); 
       if(loginVO == null){ 
    	%>
    <div id="header_loginname">
        <a href="#" ></a>
    </div>
    <div class="header_loginconnection"></div>
    <ul class="sec1 login">
        <li class="righttop_bgmiddle"><a href="<c:url value='login.do'/>">Login</a></li>
    </ul>
    <% }else { %>
    
        <c:set var="loginId" value="<%= loginVO.getId() %>"/>
	    <c:set var="loginName" value="<%= loginVO.getName() %>"/>
	    <ul class="sec1 Logout">
	        <li class="righttop_bgmiddle">
	        <c:choose>
	        <c:when test="${loginId == 'admin'}">
	        	<c:out value="관리자"/>님 	
	        </c:when>
	    	<c:otherwise>
	        <c:out value="${loginName}"/>님
	        </c:otherwise> 
	        </c:choose>
	        <a href="actionLogout.do" class="logoutbt">Logout</a></li>
	    </ul>
    <% } %>
	</div>
    	
       	<div class="home">
		    <a href="https://www.hit.ac.kr/hit_new/html/kor/sub/greeting.html" target="_blank"><button type="button" class="btn btn-primary btn-lg btn-block">대학안내</button></a>
		    <a href="https://iceman.hit.ac.kr/ipsi/intro.jsp" target="_blank"><button type="button" class="btn btn-primary btn-lg btn-block">입학안내</button></a>
		    <a href="https://www.hit.ac.kr/hit_new/html/kor/sub/major_cls.html" target="_blank"><button type="button" class="btn btn-primary btn-lg btn-block">학과안내</button></a>
		    <a href="https://www.hit.ac.kr/hit_new/html/kor/sub/schedule1.html" target="_blank"><button type="button" class="btn btn-primary btn-lg btn-block">대학생활</button></a>
		    <a href="https://www.hit.ac.kr/hit/board/boardView?categoryNo=1" target="_blank"><button type="button" class="btn btn-primary btn-lg btn-block">대학광장</button></a>
		</div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/jquery.bxslider.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript">
	$(function () { $('#collapsehead').collapse('hide')});
	$(".logoutbt").on("click", function() {
		if(${loginId == "admin"}) {
			alert("관리자님 로그아웃되었습니다.");
		} else {
		alert("<c:out value="${loginName}"/>님 " + "로그아웃되었습니다.");
		}
	});
	</script>
</body>
</html>
