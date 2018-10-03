<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Listar aulas</title>
	</head>
	<body>
	<a href="adiciona">Adicionar aula</a>
	<form:form action="busca" method="POST">
		Busca por aulas: <input type="text" name="busca" />
		<input type="submit" value="Buscar" />
	</form:form>
        <table>
			<tr>
				<th>id</th>
				<th>Nome</th>
				<th>Descrição</th>
				<th>Público</th>
				<th>Aprovado</th>
				<th>Assunto</th>
				<th>Curso</th>
				<th>Ações</th>
			</tr>
			<c:forEach var="aula" items="${aulas}">
				<c:url var="updateLink" value="/aula/edita">
					<c:param name="aulaId" value="${aula.conteudo.id}" />
				</c:url>
				<c:url var="deleteLink" value="/aula/remove">
					<c:param name="aulaId" value="${aula.conteudo.id}" />
				</c:url>
				<tr>
					<td>${aula.conteudo.id}</td>
					<td>${aula.conteudo.nome}</td>
					<td>${aula.conteudo.descricao}</td>
					<td>${aula.conteudo.publico}</td>
					<td>${aula.conteudo.aprovado}</td>
					<td>${aula.conteudo.assunto.nome}</td>
					<td>${aula.curso.conteudo.nome}</td>
					<td><a href="${updateLink}">Edita</a> | <a href="${deleteLink}" onclick="if(!(confirm('Você tem certeza que quer deletar essa aula?'))) return false">Remove</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>