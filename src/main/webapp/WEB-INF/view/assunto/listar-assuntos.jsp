<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Listar assuntos</title>
	</head>
	<body>
	<form:form action="buscaAssuntos" method="POST">
		Busca por assuntos: <input type="text" name="busca" />
		<input type="submit" value="Buscar" />
	</form:form>
        <table>
			<tr>
				<th>id</th>
				<th>Nome</th>
				<th>Ações</th>
			</tr>
			<c:forEach var="assunto" items="${assuntos}">
				<c:url var="updateLink" value="/assunto/editaAssunto">
					<c:param name="assuntoId" value="${assunto.id}" />
				</c:url>
				<c:url var="deleteLink" value="/assunto/removeAssunto">
					<c:param name="assuntoId" value="${assunto.id}" />
				</c:url>
				<tr>
					<td>${assunto.id}</td>
					<td>${assunto.nome}</td>
					<td><a href="${updateLink}">Edita</a> | <a href="${deleteLink}" onclick="if(!(confirm('Você tem certeza que quer deletar esse assunto?'))) return false">Remove</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>