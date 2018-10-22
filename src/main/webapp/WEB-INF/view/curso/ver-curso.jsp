<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
  	
		
		
	<!-- Corpo -->
    <div class="panel panel-default">
        <div class="panel-heading c-list">
            <div class="row">
                <div class="col-sm-5 col-sm-offset-1">
                    <span class="title">
                    <h3>
                    ${curso.conteudo.nome}
                     - Lista de aulas
                    </h3></span>
                </div>
                <div class="col-sm-2 form-inline" style="padding-top:10px;">
                        <a class="btn btn-sm btn-primary display-4" id="criaAulaButton"  data-toggle="modal" data-target="#CadastroAulaModal">
                                <span class="mbri-plus mbr-iconfont mbr-iconfont-btn"></span>
                                Criar Aula
                        </a>
                </div>
                <div class="col-sm-4 form-inline" style="padding-top:10px;">
                    <input type="text" id="cursoSearch" class="form-control" placeholder="Pesquise pelo nome">
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
        <ul class="sortable list-group" id="contact-list">
			<c:forEach var="aula" items="${curso.aulas}">		
				<c:url var="showLink" value="/aula/ver">
					<c:param name="aulaId" value="${aula.conteudo.id}" />
				</c:url>
				<c:url var="updateLink" value="/aula/edita">
					<c:param name="aulaId" value="${aula.conteudo.id}" />
				</c:url>
				<c:url var="deleteLink" value="/aula/remove">
					<c:param name="aulaId" value="${aula.conteudo.id}" />
				</c:url>
                <li class="list-group-item ordenamento verifica-historico-aula" id="${aula.conteudo.id}" ordem="${aula.ordem}" >
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="${pageContext.request.contextPath}/assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                        <span class="cursoName">
                        <h4>
                        <strong>${aula.conteudo.nome}</strong>
                        </h4></span>
                        <div style="margin:7px">
                            <label>${aula.conteudo.descricao}</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
	                    <a href="${showLink}" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
	                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="${updateLink}" data-toggle="tooltip" data-placement="top" ><span class="mbri-edit2 mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
	                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="${deleteLink}" data-toggle="tooltip" data-placement="top" ><span class="mbri-trash mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                </c:forEach>
        </ul>
        <script src="${pageContext.request.contextPath}/assets/studia/jquery.sortable.js"></script>
        <script>
            $('.sortable').sortable();
            function reordenaAulas() {
            	var i = 0;
				var arrayIds = [];
				$(".ordenamento").each(function(){
					var actualid = $(this)[0].id;
					arrayIds.push({
							idConteudo:actualid,
							idCurso:${curso.conteudo.id},
							ordem:i+1
						});
					i++;
					})
				listaAulas = JSON.stringify(arrayIds)
				console.log(listaAulas);
				$.ajax({
		    		type: "POST",
		    		url: "${pageContext.request.contextPath}/aula/modifica-ordem",
		    		contentType: "application/json; charset=utf-8",
		    		data: 'json',
		    		data: listaAulas,
		    		async: false,
		    		cache: false,
		    		processData: false,
		    	success: function(response){
		    		console.log(response)
		    	},
		    	error: function(jqXHR, textStatus, errorThrown){
		    		console.log(textStatus);
		    		console.log(errorThrown);
		    	}
		    	});
			}
        </script>
    </div>
<script>
$(".verifica-historico-aula").each(function(){
	verificaAula($(this)[0].id, 1)
})
function verificaAula(idAula, idUsuario){
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/historico/verifica",
		data: {
			conteudoId: idAula,
			tipoConteudo: 'aula',
			usuarioId: idUsuario
		},
		success: function(response){
			if(response == "true"){
				$("#"+idAula+" h4").prepend('<img src="${pageContext.request.contextPath}/assets/images/checkedSmall.png" alt="aula concluída" />')
			}
		},
	});
}
</script>
<jsp:include page="../includes/footer.jsp" />
