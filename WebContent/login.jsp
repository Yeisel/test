<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
<%
	String id = "kskim1";
	String pass = "4444";
	String guest = "guest";
		
	if(id.equals(request.getParameter("userId")) && pass.equals(request.getParameter("userPw"))){
		session.setAttribute("logged", id);
		response.sendRedirect("main1.jsp");
	}
	else if(guest.equals(request.getParameter("logout"))){
		session.invalidate();
		response.sendRedirect("main1.jsp");
	}
	else{
		session.invalidate();
		response.sendRedirect("main1.jsp");
	}
%>
</body>
</html>