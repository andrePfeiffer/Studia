<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
<div class="panel panel-default">
	<div class="panel-heading c-list">
		<div class="row">
			<div class="col-sm-3 col-sm-offset-4">
				<span class="title"><h3>Lista de Assuntos</h3></span>
			</div>
			<div class="col-sm-4 col-sm-offset-1 form-inline" style="padding-top:10px;">
				<form action="${pageContext.request.contextPath}/assunto/busca" method="POST">
					<input type="text" name="busca" id="cursoSearch" class="form-control" placeholder="Pesquise por assunto">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
	</div>                
	<div class="row" style="display: none;">
		<div class="col-xs-12">
			<div class="input-group c-search">
				<input type="text" class="form-control" id="contact-list-search">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                </span>
            </div>
        </div>
	</div>
	<ul class="list-group" id="contact-list">
		<c:forEach var="assunto" items="${assuntos}">
			<c:url var="updateLink" value="/assunto/edita">
				<c:param name="assuntoId" value="${assunto.id}" />
			</c:url>
			<c:url var="deleteLink" value="/assunto/remove">
				<c:param name="assuntoId" value="${assunto.id}" />
			</c:url>
			<li class="list-group-item" id="1">
				<div class="col-xs-12 col-sm-3">
					<br/>
					<img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
				</div>
				<div class="col-xs-12 col-sm-7">
					<br>
					<span class="cursoName text-info">${assunto.nome}</span>
					<a href="${updateLink}">Edita</a> | <a href="${deleteLink}" onclick="if(!(confirm('Você tem certeza que quer deletar esse assunto?'))) return false">Remove</a>
				</div>
				<div class="col-xs-12 col-sm-2">
					<br><br>
                    <a href="../cursos/curso" data-toggle="tooltip" data-placement="top" >
                       	<span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span>
					</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" data-toggle="tooltip" data-placement="top" >
						<span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span>
					</a>                        
					<br><br>
				</div>
				<div class="clearfix"><br/></div>
			</li>
		</c:forEach>
	</ul>
</div>
<jsp:include page="../includes/footer.jsp" />