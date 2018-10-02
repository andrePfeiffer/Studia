<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="edita" modelAttribute="assunto" method="POST">
		<form:hidden path="id"/>
		<table>
			<tbody>
				<tr>
					<td><label>Nome do assunto:</label></td>
					<td><form:input path="nome" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Salvar" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>

</body>
</html>