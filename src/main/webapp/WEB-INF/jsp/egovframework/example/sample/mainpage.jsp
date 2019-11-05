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
    <link rel="stylesheet"  href="./css/egovframework/mainpage.css">
    <script type="text/javaScript" language="javascript" defer="defer">
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateBoardView.do'/>";
           	document.listForm.submit();
        }
        function fn_egov_reg() {
           	document.listForm.action = "<c:url value='/regList.do'/>";
           	document.listForm.submit();
        }
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

<body style="margin:0 auto; display:inline; padding-top:100px;">
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
	<div class="contain">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></a>
				</h4>
				</div>
			<div id="collapse" class="panel-collapse collapse in">
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
		<div class="gallery_wrap">
				<ul class="slide_gallery">
					<li><img src="../images/egovframework/example/college_1.jpg" alt="사진1"></li>
					<li><img src="../images/egovframework/example/ci_e_img01.jpg" alt="사진2"></li>
					<li><img src="../images/egovframework/example/college_2.jpg" alt="사진3"></li>
				</ul>
		</div>
	<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
				<h4 class="panel-title" style="text-align: center;">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">공지사항  </a>
				</h4>
				</div>
			<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body" style="text-align: center;">
				<li class="panel-font"><a class="panel-font" href="boardList.do">공지사항</a></li>
				<li class="panel-font"><a class="panel-font" href="freeboard.do">자유게시판</a></li>
				<li class="panel-font"><a class="panel-font" href="mainNews.do">주요소식</a></li>
			</div>
			</div>
		</div>
		</div>
	<div class="table">
	<input type="hidden" name="selectedId" />
		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="ID, 제목, 내용, 작성자, 조회수">
			<caption style="visibility:hidden">ID, 제목, 내용, 작성자, 조회수</caption>
			<colgroup>
				<col width="20"/>
				<col width="50"/>
				<col width="30"/>
			</colgroup>
			<tr>
				<th align="center">No</th>
				<th align="center">제목</th>
				<th align="center">작성자</th>
			</tr>
			<c:forEach var="result" items="${resultList1}" varStatus="status">
				<tr class="thumbnail">
					<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
					   <td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.bname}"/>')"><c:out value="${result.bname}"/></td>
					   <td align="center" class="listtd"><c:out value="${result.writer}"/></td>
				</tr>
			</c:forEach>
		</table>
		</div>
		</form:form>
		<footer id="re-footer">
			<img src="../images/egovframework/example/footer_logo.png" class="imgsbox">
			<div class="addr">
				대전광역시 서구 대덕대로 325<br>
		
				이젠컴퓨터대학교
				<span class="p">대표자 : 김동욱</span><br>
				
				학교의 명칭 : 이젠컴퓨터대학교
				<p class="copy">Copyright by EZEN. All rights reserved.</p>
				<input type="button" class="cdel" value="쿠키삭제" onclick="deleteCookie()"/>
				<c:if test="${loginId == 'admin'}"> 
				<input type="button" class="cdel" value="회원정보관리" onclick="javascript:fn_egov_reg()"/>
				</c:if>
			</div>
		</footer>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/jquery.bxslider.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript">
	$(function () { $('#collapse').collapse('hide')});
	$(function () { $('#collapseOne').collapse('hide')});
	$(function(){
		$('.slide_gallery').bxSlider({
			auto: true,
			pager: true
		});
	});
	window.onload = pageLoad; // 브라우저에 웹 페이지가 로드될 때 pageLoad() 함수를 호출
	
	function pageLoad(){
		// notShowPop의 쿠키값을 getCookieValue()를 호출하여 얻음.
		notShowPop = getCookieValue();
		if(notShowPop != "true"){ // notShowPop 값이 true가 아니면 팝업창을 연다.4
			window.open("popup.do", "pop", "width=400, height=500, history=0,"+
					"resizable=no, status=no, scrollbars=yes, menubar=no");
		}
		
	}
	
	function getCookieValue(){
		var result = "false";
		if(document.cookie != ""){
			cookie = document.cookie.split("=");
			result = cookie[1];
			
			
		}
				
		return result;
	}
	function deleteCookie(){ 
		
		document.cookie = "notShowPop="+ "false" +";path=/; expires=-1";
		
	}
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
