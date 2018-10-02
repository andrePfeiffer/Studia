<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
</head>
<body>
<form:form action="${pageContext.request.contextPath}/autenticateTheUser" method="POST">
	<c:if test="${param.error != null }">
		Sorry! You entered invalid username/password<br />
	</c:if>
	<c:if test="${param.logout != null }">
		You have been logged out<br />
	</c:if>
	<c:if test="${param.denied != null }">
		Access denied<br />
	</c:if>
	Username: <input type="text" name="username" /><br />
	Password: <input type="password" name="password" /><br />
	<input type="submit" value="Login" /><br />
	<!--
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	 -->
</form:form>
</body>
</html>