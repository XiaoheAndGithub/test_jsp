<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String remember = request.getParameter("remember");
	out.print(remember);
	if(name!=null){
		Cookie c = new Cookie("name",name);
		response.addCookie(c);
	}
	if(pwd!=null){
		Cookie c = new Cookie("pwd",pwd);
		response.addCookie(c);
	}
	Cookie[] cookie = request.getCookies();
	for(int i = 0 ; i < cookie.length ; i ++ ){
		out.print(cookie[i].getName()+"------"+cookie[i].getValue());
	}
%>
</body>
</html>