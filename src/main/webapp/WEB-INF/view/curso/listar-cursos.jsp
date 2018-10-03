<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Listar cursos</title>
	</head>
	<body>
	<a href="adiciona">Adicionar curso</a>
	<form:form action="busca" method="POST">
		Busca por cursos: <input type="text" name="busca" />
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
				<th>Ações</th>
			</tr>
			<c:forEach var="curso" items="${cursos}">
				<c:url var="updateLink" value="/curso/edita">
					<c:param name="cursoId" value="${curso.conteudo.id}" />
				</c:url>
				<c:url var="deleteLink" value="/curso/remove">
					<c:param name="cursoId" value="${curso.conteudo.id}" />
				</c:url>
				<tr>
					<td>${curso.conteudo.id}</td>
					<td>${curso.conteudo.nome}</td>
					<td>${curso.conteudo.descricao}</td>
					<td>${curso.conteudo.publico}</td>
					<td>${curso.conteudo.aprovado}</td>
					<td>${curso.conteudo.assunto.nome}</td>
					<td><a href="${updateLink}">Edita</a> | <a href="${deleteLink}" onclick="if(!(confirm('Você tem certeza que quer deletar esse curso?'))) return false">Remove</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>