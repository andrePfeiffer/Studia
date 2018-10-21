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
	                <li class="list-group-item" id="${componenteAula.id}" ordem="${componenteAula.ordem}"> 
	                	<a href="componente-aula/ver?componenteId=${componenteAula.id}&aulaId=${aula.conteudo.id}">${componenteAula.descricao}</a>
                	</li>
	            </c:forEach>
            </ul>
            
            &nbsp;&nbsp;&nbsp;<a class="concluirConteudo">Concluir conteúdo</a>
            <br><br>
            <a style="color:blue">&nbsp;&nbsp;&nbsp;Próxima aula &nbsp;&nbsp;&nbsp;<span class="mbri-right mbr-iconfont mbr-iconfont-btn"></span></a>
            </div>
            <div class="col-md-7"> 
                    <div class="right-content-bg">
                        <h3>Lorem ipsum dolor sit amet</h3>
                        
                        <div id="conteudoAula">

                        </div>
                        <br><br><br>

                        <!-- Conteúdo perguntas -->

                        <!--
                        <input type="text" class="form-control" placeholder="Digite aqui a sua pergunta">
                        <input type="button" class="btn btn-primary" value="Enviar" onclick="">
                         <br><br>
                        <div class="container">
                            <div class="row">
                            Perguntas anteriores
                            <br><br>
                             <div class="media">
                                <div class="media-left">
                                  <img src="../../../assets/images/cursos/user.png" class="media-object" style="width:40px">
                                </div>
                                <div class="media-body">
                                  <h4 class="media-heading title">João Alberto</h4>
                                  <p class="komen">
                                      Isso funciona no windows 10?<br>
                                        <div class="utilIcons">
                                            <a class="inutil"><span class="mbri-sad-face mbr-iconfont mbr-iconfont-btn askIcons"></span></a>
                                            &nbsp;&nbsp;
                                            <a class="util"><span class="mbri-smile-face mbr-iconfont mbr-iconfont-btn askIcons"></span></a>
                                            &nbsp;&nbsp;
                                            <a class="resposta">Responder</a>
                                        </div>
                                  </p>
                                </div>
                            </div>
                            
                            <div class="geser">
                             <div class="media">
                                <div class="media-left">
                                  <img src="../../../assets/images/cursos/user.png" class="media-object" style="width:40px">
                                </div>
                                <div class="media-body">
                                  <h4 class="media-heading title">Armando Silva</h4>
                                  <p class="komen">
                                      Funciona no Linux?<br>
                                      <div class="utilIcons">
                                            <a class="inutil"><span class="mbri-sad-face mbr-iconfont mbr-iconfont-btn askIcons"></span></a>
                                            &nbsp;&nbsp;
                                            <a class="util"><span class="mbri-smile-face mbr-iconfont mbr-iconfont-btn askIcons"></span></a>
                                            &nbsp;&nbsp;
                                            <a class="resposta">Responder</a>
                                        </div>
                                  </p>
                                </div>
                            </div>
                            </div>

                            <div class="geser">
                                    <div class="media">
                                       <div class="media-left">
                                         <img src="../../../assets/images/cursos/user.png" class="media-object" style="width:40px">
                                       </div>
                                       <div class="media-body">
                                         <h4 class="media-heading title">Armando Silva</h4>
                                         <p class="komen">
                                             Funciona no Linux?<br>
                                             <div class="utilIcons">
                                                   <a class="inutil"><span class="mbri-sad-face mbr-iconfont mbr-iconfont-btn askIcons"></span></a>
                                                   &nbsp;&nbsp;
                                                   <a class="util"><span class="mbri-smile-face mbr-iconfont mbr-iconfont-btn askIcons"></span></a>
                                                   &nbsp;&nbsp;
                                                   <a class="resposta">Responder</a>
                                               </div>
                                         </p>
                                       </div>
                                   </div>
                                   </div>
                            </div>
                            </div> -->
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
    <jsp:include page="../includes/footer.jsp" />
