<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
  	
		
		
    <div class="panel panel-default">
        <div class="panel-heading c-list">
            <div class="row">
                <div class="col-sm-3 col-sm-offset-4">
                    <span class="title">
                    <h3>
                    ${aula.curso.conteudo.nome}
                    -
                    ${aula.conteudo.nome}
                    </h3></span>
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
        
        <!-- Inicio conteudo aula -->

        <div class="container" style="margin-top:40px; margin-left:0px;">
            <div class="col-md-3">
	            <ul class="list-group" style="color:black !important" id="componenteAula-list">
		            <c:forEach var="componenteAula" items="${aula.componenteAulas}">
		                <li class="list-group-item verifica-historico-componente" id="${componenteAula.id}" ordem="${componenteAula.ordem}"> 
		                	<a href="${pageContext.request.contextPath}/componente/ver?componenteId=${componenteAula.id}&aulaId=${aula.conteudo.id}">
		                	${componenteAula.titulo}
		                	</a>
	                	</li>
		            </c:forEach>
	            </ul>
	            
			&nbsp;&nbsp;&nbsp;<a style="color:blue" href="${pageContext.request.contextPath}/aula/concluir?aulaId=${aula.conteudo.id}&cursoId=${aula.curso.conteudo.id}">Concluir aula</a>
            </div>
            <div class="col-md-7"> 
                    <div class="right-content-bg">
                        
                        <div id="conteudoAula">

                        </div>
                        <br><br><br>

                    </div>
            </div>
            <div class="col-md-1">
                <div class="utilIcons">
                    &nbsp; <a class="inutil disabled" ><span disabled class="mbri-sad-face mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span>
                                <br>
                                <span>Não útil</span>
                            </a>
                    
                    
                </div>
            </div>
            <div class="col-md-1">
                <div class="utilIcons">
                    <a class="util"><span class="mbri-smile-face mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span>
                        <br>
                        &nbsp;<span>Útil</span>
                    </a>                   
                    
                </div>
            </div>
            
        </div>  

        <!-- Fim conteudo aula -->
        
    </div>
    <script>
$(".verifica-historico-componente").each(function(){
	verificaComponente($(this)[0].id, 1)
})
function verificaComponente(idConteudo, idUsuario){
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/historico/verifica",
		data: {
			conteudoId: idConteudo,
			tipoConteudo: 'componente',
			usuarioId: idUsuario
		},
		success: function(response){
			if(response == "true"){
				console.log(idConteudo)
				$("#"+idConteudo).prepend('<img src="${pageContext.request.contextPath}/assets/images/checkedSmall.png" alt="conteúdo concluído" />')
			}
		},
	});
}
</script>
    <jsp:include page="../includes/footer.jsp" />
