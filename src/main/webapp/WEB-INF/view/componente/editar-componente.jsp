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
                    <h3>
                    ${aula.curso.conteudo.nome}
                    -
                    ${aula.conteudo.nome}
                    </h3></span>
                </div>
                <div class="col-sm-7 col-offset-5">
                    <input type="button" class="btn btn-primary" value="Adicionar Material" onclick="window.location.href='${pageContext.request.contextPath}/material/adiciona?aulaId=${aula.conteudo.id}'">
                    <input type="button" class="btn btn-primary" value="Adicionar Video" onclick="window.location.href='${pageContext.request.contextPath}/video/adiciona?aulaId=${aula.conteudo.id}'">
                    <input type="button" class="btn btn-primary" value="Adicionar Exercício" onclick="window.location.href='${pageContext.request.contextPath}/exercicio/adiciona?aulaId=${aula.conteudo.id}'">
                </div>
            </div>
        </div>                
        <div class="row" style="display: none;">
            <div class="col-xs-12">
                <div class="input-group c-edit2">
                    <input type="text" class="form-control" id="contact-list-edit2">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-edit2 text-muted"></span></button>
                    </span>
                </div>
            </div>
        </div>
        <div id="formWrapper">
	<h2>Message : ${message}</h2>
            <form action="${pageContext.request.contextPath}/componente/editar" method="POST">
            	<input type="hidden" name="aulaId" value="${aula.conteudo.id}" />
            	<input type="hidden" name="componenteId" value="${componente.id}" />
                <Div class="container">
                    <h2>Editar componente</h2>
                    <label>Descrição</label>
                    <textarea name="descricao" class="form-control" required>${componente.descricao}</textarea>
                    <br>
                    <label class="radio-inline"><input type="radio" name="componentePublico" value="true" <c:if test="${componente.publico}">checked</c:if> />Conteudo público</label>
                    <label class="radio-inline"><input type="radio" name="componentePublico" value="false" <c:if test="${!componente.publico}">checked</c:if> />Conteudo privado</label>
                    <br><br>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Salvar" class="btn btn-primary">

                </Div>
                <br>
            </form>
        </div>
    </div>
<jsp:include page="../includes/footer.jsp" />
