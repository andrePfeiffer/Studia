<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<form:form action="adiciona" modelAttribute="curso" method="POST">
		<table>
			<tbody>
				<tr>
					<td><label>Assunto:</label></td>
					<td>
						<select name="assuntoId">
							<c:forEach var="assunto" items="${assuntos}">
								<option value="${assunto.id}">${assunto.nome}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>Nome:</label></td>
					<td><form:input path="conteudo.nome" /></td>
				</tr>
				<tr>
					<td><label>Descrição:</label></td>
					<td><form:input path="conteudo.descricao" /></td>
				</tr>
				<tr>
					<td><label>Conteúdo público:</label></td>
					<td>				
						<form:radiobutton path="conteudo.publico" value="true" /> público<br />
						<form:radiobutton path="conteudo.publico" value="false" /> privado
					</td>
				</tr>
				<tr>
					<td><label>Conteúdo aprovado:</label></td>
					<td>				
						<form:radiobutton path="conteudo.aprovado" value="true" /> sim<br />
						<form:radiobutton path="conteudo.aprovado" value="false" /> não
					</td>
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