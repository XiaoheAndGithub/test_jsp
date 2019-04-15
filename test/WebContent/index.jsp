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
<p>包含另一个页面</p>
<jsp:include page="head.jsp"></jsp:include>
<%
out.println(path);
out.println(basePath);
%>
<p>java Bean对象的使用</p>
<jsp:useBean id="san" class="test.User"></jsp:useBean>
<jsp:setProperty property="name" value="张三" name="san"/>
<jsp:setProperty property="pwd" value="666666" name="san"/>
<p>姓名：<jsp:getProperty property="name" name="san"/></p>
<%
	session.setAttribute("user", "张三");
	//session.invalidate();
	//session.setMaxInactiveInterval(2);
	Integer count = (Integer)application.getAttribute("count");
	if(count!=null){
		application.setAttribute("count",count+1);
	}else{
		application.setAttribute("count",1);
	}
	
	out.print("共访问了:"+count);
	Cookie[] cs = request.getCookies();
	//String str = URLEncoder.encode(request.getParameter("name"),"utf-8");
	String name = "";
	String pwd = "";
	for(int i = 0 ; i < cs.length; i ++){
		Cookie c = cs[i];
		if(c.getName().equals("name")){
			name = c.getValue();
		}
		if(c.getName().equals("pwd")){
			pwd = c.getValue();
		}
	}
%>
<p>姓名：<%=san.getName() %></p>
<form action="test.jsp" method="get">
	<p>姓名：<input type="text" name="user" placeholder="请输入用户名" value="<%=name %>"/></p>
	<p>姓名：<input type="text" name="pwd" placeholder="请输入用户名" value="<%=pwd %>"/></p>
	<p>爱好:
		<input type="checkbox" name="hobby" value="王者"/>王者&nbsp;
		<input type="checkbox" name="hobby" value="追剧"/>追剧&nbsp;
		<input type="checkbox" name="hobby" value="抖音"/>抖音&nbsp;
		<input type="checkbox" name="hobby" value="学习"/>学习&nbsp;
	</p>
	<p><input type="submit" value="登录"/><input type="reset" value="重置"/></p>
</form>
<%-- <jsp:include page="left.jsp"></jsp:include> --%>
<%@ include file="left.jsp" %>
</body>
</html>