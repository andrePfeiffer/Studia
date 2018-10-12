<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "../styles&Scripts.jsp" %>
<%@ include file = "../menus.jsp" %>
<%@ include file = "../modais.jsp" %>
	
		
		
	<!-- Corpo -->
    
    <div class="panel panel-default">
        <div class="panel-heading c-list">
            <div class="row">
                <div class="col-sm-3 col-sm-offset-4">
                    <span class="title"><h3>Lista de Cursos</h3></span>
                </div>
                <div class="col-sm-4 col-sm-offset-1 form-inline" style="padding-top:10px;">
                    <input type="text" id="cursoSearch" class="form-control" placeholder="Pesquise pelo assunto">
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
        
        <!-- Início da lista de cursos carregada pelo forEach -->
		
			<c:forEach var="curso" items="${cursos}">		

	            <li class="list-group-item" id="1">
	                    <div class="col-xs-12 col-sm-3">
	                        <br/>
	                        <img style="width: 20%; height: auto; border-radius: 10px" src="${pageContext.request.contextPath}/assets/images/cursos/cursos.png"/>
	                    </div>
	                    <div class="col-xs-12 col-sm-7">
	                    <br>
	                        <span class="cursoName text-info">${curso.conteudo.assunto.nome}</span>
	                        <h4><strong>${curso.conteudo.nome}</strong></h4>
	                        <div style="margin:7px">
	                            <label>${curso.conteudo.descricao}</label>                           
	                        </div>
	                    </div>
	                    <div class="col-xs-12 col-sm-2">
	                    <br><br>
	                    <a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
	                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="${updateLink}" data-toggle="tooltip" data-placement="top" ><span class="mbri-edit2 mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
	                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="${deleteLink}" data-toggle="tooltip" data-placement="top" ><span class="mbri-trash mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
	                    <!--  &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>  -->
	                    <br><br>
	                    </div>
	                    <div class="clearfix"><br/></div>
	                </li>
                
                </c:forEach>
                

        
        </ul>
    </div>
	
		
	<%@ include file = "../footer.jsp" %>
	</body>
</html>