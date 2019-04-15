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
String name = "";
String pwd = "";

Cookie[] cookie = request.getCookies();
for(int i = 0 ; i < cookie.length ; i ++ ){
	if(cookie[i].getName().equals("name")){
		name = cookie[i].getValue();
	}else if(cookie[i].getName().equals("pwd")){
		pwd = cookie[i].getValue();
	}
}
%>

<form action="cookieForm2.jsp" method="get">
	<p>姓名：<input type="text" name="name" placeholder="请输入用户名" value="<%=name %>"/></p>
	<p>姓名：<input type="text" name="pwd" placeholder="请输入用户名" value="<%=pwd %>"/></p>
	<p>记住密码：<input type="checkbox" name="remember" /></p>
	<p><input type="submit" value="登录"/><input type="reset" value="重置"/></p>
</form>
</body>
</html>