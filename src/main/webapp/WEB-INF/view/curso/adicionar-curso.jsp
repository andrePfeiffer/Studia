<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
<div class="panel panel-default">
        <div class="panel-heading c-list">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <span class="title"><h3>Painel de manutenção de cursos</h3></span>
                </div>
                <div class="col-sm-2 col-sm-offset-1 form-inline" style="padding-top:10px;">
                        <a class="btn btn-sm btn-primary display-4" id="exibeCursoButton">
                                <span class="mbri-plus mbr-iconfont mbr-iconfont-btn"></span>
                                Criar Curso
                        </a>
                </div>
                <div class="col-sm-3 form-inline" style="padding-top:10px;">
                    <input type="text" id="cursoedit2" class="form-control" placeholder="Pesquise por assunto">
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
            <form action="${pageContext.request.contextPath}/curso/adiciona" method="POST">
                <Div class="container">
                    <h2>Criação de novo curso</h2>
                    <label>Título</label>
                    <input type="text" name="nome" class="form-control" required/>
                    <br>
                    <label>Descrição</label>
                    <input type="text" name="descricao" class="form-control" required/>
                    <br>
                    <label>Assunto</label>
					<select name="assuntoId" class="form-control">
						<c:forEach var="assunto" items="${assuntos}">
							<option value="${assunto.id}">${assunto.nome}</option>
						</c:forEach>
					</select>
                    <br>
                    <label class="radio-inline"><input type="radio" name="conteudoPublico" value="true" checked>Curso público</label>
                    <label class="radio-inline"><input type="radio" name="conteudoPublico" value="false">Curso privado</label>
                    <br><br>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Salvar" class="btn btn-primary">
                </Div>
                <br>
            </form>
        </div>
    </div>
<jsp:include page="../includes/footer.jsp" />