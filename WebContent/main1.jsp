<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script>
	function fnPageMove(page_num){
		document.page_move.page_num.value = page_num;
		document.page_move.submit();
	}
	
    function divResize() {
        var left_div = document.getElementById('left_div');
        var right_div = document.getElementById('right_div');
        var space = document.getElementById('top_div').offsetHeight
        	+ document.getElementById('bottom_div').offsetHeight;
        left_div.style.height = window.innerHeight - space - 50 + 'px';
        right_div.style.height = window.innerHeight - space - 50 + 'px';
    }
    window.onload = function() {
        divResize();
			window.addEventListener('resize', divResize);
    }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main3</title>
<link rel="stylesheet" href="/css/bootstrap.css"/>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>
<div style = "margin:auto; width:1000px">

			<div id="top_div" style = "background:skyblue; height:150px">
				<a href="main1.jsp"><img src="/prjDivTest/images/quizbook.png" width="1000" height="150"/></a>			
			</div>
			
			<div style = "height:50px; float:bottom">
					&nbsp;&nbsp;&nbsp;&nbsp;<img src="/prjDivTest/icons/android-drawer.png" width="60" height="50"/>&nbsp;&nbsp;
					<div class="dropdown">
					  <a href="javascript:fnPageMove('page1.jsp')"><img src="/prjDivTest/icons/android-lightbulb.png" width="60" height="50"/></a>&nbsp;&nbsp;&nbsp;
					  <div class="dropdown-content">
					    <a href="javascript:fnPageMove('page2.jsp')"><img src="/prjDivTest/icons/bonfire.png" width="45" height="40"/></a>
					  </div>
					</div>
					<a href="javascript:fnPageMove('page2.jsp')"><img src="/prjDivTest/icons/bonfire.png" width="45" height="40"/></a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:fnPageMove('page3.jsp')"><img src="/prjDivTest/icons/ios7-americanfootball.png" width="40" height="45"/></a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:fnPageMove('page4.jsp')"><img src="/prjDivTest/icons/social-freebsd-devil.png" width="40" height="45"/></a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:fnPageMove('page5.jsp')"><img src="/prjDivTest/icons/ios7-paper.png" width="45" height="40"/></a>&nbsp;&nbsp;&nbsp;
					<img src="/prjDivTest/icons/android-drawer.png" width="60" height="50"/>&nbsp;&nbsp;
					<div class="dropdown">
						<a href="javascript:fnPageMove('page5.jsp')"><img src="/prjDivTest/icons/ios7-cart.png" width="60" height="50"/></a>&nbsp;&nbsp;
						<div class="dropdown-content">
					    <p>Hello World!</p>
					  </div>
					</div>
					<img src="/prjDivTest/icons/android-drawer.png" width="60" height="50"/>&nbsp;&nbsp;
					<div class="dropdown">
						<a href="javascript:fnPageMove('page5.jsp')"><img src="/prjDivTest/icons/ios7-chatbubble.png" width="60" height="50"/></a>&nbsp;&nbsp;
						<div class="dropdown-content">
					    <p>Hello World!</p>
					  </div>
					</div>
					<img src="/prjDivTest/icons/android-drawer.png" width="60" height="50"/>&nbsp;&nbsp;
					<div class="dropdown">
						<a href="javascript:fnPageMove('page5.jsp')"><img src="/prjDivTest/icons/bug.png" width="60" height="50"/></a>&nbsp;&nbsp;
						<div class="dropdown-content">
					    <p>Hello World!</p>
					  </div>
					</div>
					<img src="/prjDivTest/icons/android-drawer.png" width="60" height="50"/>&nbsp;&nbsp;
			</div>
			<div style = "margin-top:10px">
				<div id="left_div" style = "width:200px; min-height: 300px; overflow:hidden; background:green; float:left; margin-right:10px">
<%          
			if(session.getAttribute("logged") == null){
%>					
					<form method="post" action="login.jsp">
						<img src="/prjDivTest/icons/android-contact.png" width="18" height="18"/> <input type="text" name="userId" value="ID 입력" style="width:100"/>
						<img src="/prjDivTest/icons/android-checkmark.png" width="18" height="18"/> <input type="text" name="userPw" value="Password 입력" style="width:100"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="로그인"/>
					</form>					
<%			
			}
			else{
%>					<form method="post" action="login.jsp">
						<input type="hidden" name="logout" value="guest"/>
						<img src="/prjDivTest/icons/android-contact.png" width="18" height="18"/><br/>
						<%=session.getAttribute("logged")%> 님 방가!!
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="로그아웃"/>
					</form>
<%
			}
%>
				</div>
				<div id="right_div" style = "width:790px; min-height: 300px; overflow:auto; background:#00CC00; float:left">
					<c:if test="${param.page_num == null}">
						<jsp:include page="default1.jsp"/>
					</c:if>
					<c:if test="${param.page_num != null}">
						<jsp:include page="${param.page_num}"/>
					</c:if>
				</div>
			</div>
			<div style = "clear:both"></div>
			<div id="bottom_div" style = "background:yellow; height:100px; margin-top:10px">Bottom Menu</div>
</div>
<form name="page_move" method="post" action="main1.jsp">
	<input type="hidden" name="page_num"/>
</form>
</body>
</html>