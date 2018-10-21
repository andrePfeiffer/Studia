<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
        <div class="panel panel-default">
        <div class="panel-heading c-list">
            <div class="row">
                <div class="col-sm-3">
                    <span class="title">
                    </span>
                </div>
                <div class="col-sm-7 col-offset-5">
                    <input type="button" class="btn btn-primary" value="Adicionar Material" onclick="window.location.href='${pageContext.request.contextPath}/material/adiciona?aulaId=${aula.conteudo.id}'">
                    <input type="button" class="btn btn-primary" value="Adicionar Video" onclick="window.location.href='${pageContext.request.contextPath}/video/adiciona?aulaId=${aula.conteudo.id}'">
                    <input type="button" class="btn btn-primary" value="Adicionar Exercício" onclick="window.location.href='${pageContext.request.contextPath}/exercicio/adiciona?aulaId=${aula.conteudo.id}'">
                </div>
            </div>
        </div>                
        <div class="container" style="margin-top:40px; margin-left:0px;">
            <div class="col-md-3">
            <ul class="list-group" style="color:black !important" id="mainPanel">
            <c:forEach var="componenteAula" items="${aula.componenteAulas}">
                <li class="list-group-item" id="content1">
                	<a href="${pageContext.request.contextPath}/componente/ver?componenteId=${componenteAula.id}&aulaId=${aula.conteudo.id}">${componenteAula.descricao}</a>
                	-
                	<a href="${pageContext.request.contextPath}/componente/editar?componenteId=${componenteAula.id}&aulaId=${aula.conteudo.id}">edita</a> |
                	<a href="${pageContext.request.contextPath}/componente/remover?componenteId=${componenteAula.id}&aulaId=${aula.conteudo.id}">remove</a>
               	</li>
            </c:forEach>
            </ul>
            </div>
            <div class="col-md-9"> 
                <div class="right-content-bg">
                    <h3>
                    ${aula.curso.conteudo.nome}
                    -
                    ${aula.conteudo.nome}
                    </h3>
                    <div id="conteudoAula">
                            <div class="container">
                                    <div class="row">
                                       <div class="col-md-6">
                                       <h1>${mensagemFlash}</h1>
            <form action="${pageContext.request.contextPath}/aula/edita" method="POST">
            	<input type="hidden" name="conteudoId" value="${aula.conteudo.id}" />
                <Div class="container">
                    <h2>Edição de aula</h2>
                    <label>Título</label>
                    <input type="text" name="nome" class="form-control" value="${aula.conteudo.nome}" required/>
                    <br>
                    <label>Descrição</label>
                    <input type="text" name="descricao" class="form-control" value="${aula.conteudo.descricao}" required/>
                    <br>
                    <label class="radio-inline"><input type="radio" name="conteudoPublico" value="true" <c:if test="${aula.conteudo.publico}">checked</c:if>>Aula pública</label>
                    <label class="radio-inline"><input type="radio" name="conteudoPublico" value="false" <c:if test="${!aula.conteudo.publico}">checked</c:if>>Aula privada</label>
                    <br><br>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Salvar" class="btn btn-primary">

                </Div>
                <br>
            </form>
                                      </div>
                                    </div>
                                </div>
                    </div>
                    <br><br><br>
                </div>
            </div>
            </div>
<jsp:include page="../includes/footer.jsp" />
