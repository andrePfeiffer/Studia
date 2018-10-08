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
                
        <!--  Fim da lista de cursos. Demais cursos populados somente para ilustrar -->
               
                <li class="list-group-item" id="2">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                        <span class="cursoName text-info">Programação</span>
                        <h4><strong>Lógica de programação com Orientação a objeto</strong></h4>
                        <div style="margin:7px">
                            <label>Inicie na carreira de programação orientada a objeto com as melhores práticas.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                            <span class="cursoName text-info">Design</span>
                            <h4><strong>Adobe Photoshop cs6</strong></h4>
                        <div style="margin:7px">
                            <label>Aprenda a editar imagens de forma profissional com esta fantástica ferramenta.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                            <span class="cursoName text-info">Programação</span>
                            <h4><strong>Excel Avançado com VBA</strong></h4>
                        <div style="margin:7px">
                            <label>Aprenda a criar relatórios complexos e rotinas automatizadas com VBA no Excel.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                            <span class="cursoName text-info">Programação</span>
                            <h4><strong>WebDeveloper em C#</strong></h4>
                        <div style="margin:7px">
                            <label>Aprenda a criar API's na plataforma .NET.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                            <span class="cursoName text-info">Mobile</span>
                            <h4><strong>Cordova e PhoneGap</strong></h4>
                        <div style="margin:7px">
                            <label>Aprenda a criar aplicações web/mobile híbridas.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                        <span class="cursoName text-info">UX</span>
                        <h4><strong>Javascript e Jquery</strong></h4>
                        <div style="margin:7px">
                            <label>Aprenda a deixar suas páginas web dinâmicas com Javascript e Jquery.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                        <span class="cursoName text-info">UX</span>
                        <h4><strong>HTML 5 e CSS3</strong></h4>
                        <div style="margin:7px">
                            <label>Aprenda a embelezar suas páginas web com HTML5 e CSS3.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
                <li class="list-group-item" id="1">
                    <div class="col-xs-12 col-sm-3">
                        <br/>
                        <img style="width: 20%; height: auto; border-radius: 10px" src="../assets/images/cursos/cursos.png"/>
                    </div>
                    <div class="col-xs-12 col-sm-7">
                    <br>
                        <span class="cursoName text-info">Bancos de dados</span>
                        <h4><strong>Views, Triggers e Procedures com Sql Server</strong></h4>
                        <div style="margin:7px">
                            <label>Seja um mestre em Sql Server, criando views, triggers e procedures.</label>                           
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <br><br>
                    <a href="./curso" data-toggle="tooltip" data-placement="top" ><span class="mbri-search mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a>
                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" ><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn" style="font-size:30px;"></span></a> -->
                    <br><br>
                    </div>
                    <div class="clearfix"><br/></div>
                </li>
        
        </ul>
    </div>
</div>
</div>
	
	
	
		
	<%@ include file = "../foot.jsp" %>
	</body>
</html>