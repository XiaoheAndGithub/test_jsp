<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
testtesttesttesttesttesttesttest
<%-- <jsp:forward page="index.jsp"></jsp:forward> --%>
<%
	String name = request.getParameter("user");
	String pwd = request.getParameter("pwd");
	String[] hobbys = request.getParameterValues("hobby");
	//添加cookie
	Cookie cookie1 = new Cookie("name",name);
	Cookie cookie2 = new Cookie("pwd",pwd);
	response.addCookie(cookie1);
	response.addCookie(cookie2);
	Cookie[] cs = request.getCookies();
	//String str = URLEncoder.encode(request.getParameter("name"),"utf-8");
	for(int i = 0 ; i < cs.length; i ++){
		Cookie c = cs[i];
		out.print("<p>cookie name:"+c.getName()+"</p>");
		out.print("<p>cookie value:"+c.getValue()+"</p>");
	}
	out.print("<p>用户名:"+name+"</p>");
	out.print("<p>密 码:"+pwd+"</p>");
	out.print("<p>爱好:");
	if(hobbys!=null && hobbys.length!=0){
		for(int i = 0 ; i < hobbys.length; i ++){
			out.print(hobbys[i]+" ");
		}
	}
	out.print("</p>");
	out.print("sessionid---"+session.getId());
	
	out.print("sessionid---"+session.getAttribute("user"));
%>
</body>
</html>