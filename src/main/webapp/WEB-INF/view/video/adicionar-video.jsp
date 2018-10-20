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
                    <input type="button" class="btn btn-primary" value="Adicionar Material" onclick="">
                    <input type="button" class="btn btn-primary" value="Adicionar Video" onclick="">
                    <input type="button" class="btn btn-primary" value="Adicionar Exercício" onclick="">
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
            <form action="${pageContext.request.contextPath}/video/adiciona" method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="aulaId" value="${aula.conteudo.id}" />
                <Div class="container">
                    <h2>Adicionar video</h2>
                    <label>Arquivo</label>
                    <input type="file" name="video" class="form-control" required />
                    <br>
                    <label>Descrição</label>
                    <input type="text" name="descricao" class="form-control" required/>
                    <br>
                    <label class="radio-inline"><input type="radio" name="videoPublico" value="true" checked />Video público</label>
                    <label class="radio-inline"><input type="radio" name="videoPublico" value="false" />Video privado</label>
                    <br><br>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Salvar" class="btn btn-primary">

                </Div>
                <br>
            </form>
        </div>
    </div>
<jsp:include page="../includes/footer.jsp" />
