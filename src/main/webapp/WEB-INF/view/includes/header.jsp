<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon-85x100-1.png" type="image/x-icon">
  <meta name="description" content="">
  <title>StudiaTech</title>
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/tether/tether.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/animatecss/animate.min.css">
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/assets/prime-icons/prime-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/dropdown/css/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/prime/css/mbr-additional.css">
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/prime/css/3.3.7.bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web-fonts-with-css/css/fontawesome-all.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style type="text/css">
        .slider-item{
            border: 1px solid #E1E1E1;
            border-radius: 5px;
            background: #FFF;
        }
        .slider-item .slider-image img{
            margin: 0 auto;
            width: 100%;
        }
        .slider-item .slider-main-detail{
            padding: 10px;
            border-radius: 0 0 5px 5px;
        }
        .slider-item:hover .slider-main-detail{
            background-color: #FFF !important;
        }
        .slider-item .price{
            float: left;
            margin-top: 5px;
        }
        .slider-item .price h5{
            line-height: 20px;
            margin: 0;
        }
        .detail-price{
            color: #212529;
            font-family: 'Fira Sans', sans-serif;
        }
        .slider-item .slider-main-detail .rating{
            color: #777;
        }
        .slider-item .rating{
            float: left;
            font-size: 17px;
            text-align: right;
            line-height: 52px;
            margin-bottom: 10px;
            height: 52px;
        }
        .slider-item .btn-add{
            width: 50%;
            float: left;
            border-right: 1px solid #E1E1E1;
        }
        .slider-item .btn-details{
            width: 50%;
            float: left;
        }
        .controls{
            margin-top: 20px;
        }
        .btn-info,.btn-info:visited{
            background-color: #7f7f7f !important;
            border-color: #7f7f7f !important;
        }
        .btn-info{
            margin-left:5px;
        }
        .btn-info:hover{
            background-color: #000 !important;
            border-color: #000 !important;
        }

        .slider-main-detail:hover{
            background-color: #dbeeee !important;
        }

        .AddCart{
            margin: 0px;
            padding:5px;
            border-radius:22px;
            margin-right:10px;
            width: 100%;
        }
        .review {
            margin-bottom: 5px;
            padding-top:5px;
        }
        
        .mensagemErro{
        	color: red;
        }
    </style>

</head>
<body>
<section class="menu cid-qRQFsF87rC" once="menu" id="menu2-p">
    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm bg-color">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="${pageContext.request.contextPath}">
                        <div id="logo"><img src="${pageContext.request.contextPath}/assets/images/studia.png" title="" style="height: 3.8rem;"></div>
                    </a>
                </span>
            </div>
        </div>
        
		<security:authorize access="isAuthenticated()">
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">

                <li class="nav-item dropdown">
                    <a class="nav-link link dropdown-toggle text-secondary display-4" href="${pageContext.request.contextPath}/curso/verTodos" data-toggle="dropdown-submenu" aria-expanded="false">
                        <span class="mbri-hot-cup mbr-iconfont mbr-iconfont-btn"></span>
                        Cursos
                    </a>
                    <div class="dropdown-menu">
                            <a class="dropdown-item text-secondary display-4 submenu" href="${pageContext.request.contextPath}/curso/verTodos"><span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>Listar Cursos</a>
                        <a class="dropdown-item text-secondary display-4 submenu" href="${pageContext.request.contextPath}/curso/adiciona"><span class="mbri-plus mbr-iconfont mbr-iconfont-btn"></span>Manter Cursos</a>
                        
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link link dropdown-toggle text-secondary display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                        <span class="mbri-flag mbr-iconfont mbr-iconfont-btn"></span>
                        Assuntos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item text-secondary display-4 submenu"  data-toggle="modal" data-target="#PesquisaAssuntoModal" aria-expanded="false"><span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>Pesquisar assuntos</a>
                        <a class="dropdown-item text-secondary display-4 submenu" data-toggle="modal" data-target="#CadastroAssuntoModal" aria-expanded="false"><span class="mbri-plus mbr-iconfont mbr-iconfont-btn"></span>Criar um novo assunto</a>
                        
                    </div>
                </li>
                <li class="nav-item">
                        <a class="nav-link link text-secondary display-4" href="/favoritos"><span class="mbri-hearth mbr-iconfont mbr-iconfont-btn"></span>Favoritos</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link link dropdown-toggle text-secondary display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                        <span class="mbri-setting3 mbr-iconfont mbr-iconfont-btn"></span>
                        Opções
                    </a>
                    <div class="dropdown-menu" style="text-align:left !important">
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#promoveInstrutorModal" aria-expanded="false"><span class="mbri-up mbr-iconfont mbr-iconfont-btn"></span>Promover à instrutor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#aprovaConteudoModal" aria-expanded="false"><span class="mbri-like mbr-iconfont mbr-iconfont-btn"></span>Aprovar conteúdos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#aprovaPerguntaModal" aria-expanded="false"><span class="mbri-like mbr-iconfont mbr-iconfont-btn"></span>Aprovar perguntas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#respondePerguntaModal" aria-expanded="false"><span class="mbri-cust-feedback mbr-iconfont mbr-iconfont-btn"></span>Responder perguntas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#corrigeExercicioModal" aria-expanded="false"><span class="mbri-success mbr-iconfont mbr-iconfont-btn"></span>Corrigir exercícios&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#mantemPermissaoModal" aria-expanded="false"><span class="mbri-key mbr-iconfont mbr-iconfont-btn"></span>Manter permissões&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a class="dropdown-item text-secondary display-4 submenu"   data-toggle="modal" data-target="#mantemUsuarioModal" aria-expanded="false"><span class="mbri-users mbr-iconfont mbr-iconfont-btn"></span>Manter contas de usuários</a>
                        
                    </div>
                </li>
                <li class="nav-item dropdown">
                        <a class="nav-link link dropdown-toggle text-secondary btn btn-sm btn-primary display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>
                            <label id="usuarioAtual"><security:authentication property="principal.username" /></label> &nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item text-secondary display-4 submenu" href="${pageContext.request.contextPath}/editar-usuario"><span class="mbri-edit2 mbr-iconfont mbr-iconfont-btn"></span>Alterar Conta</a>
                            <a class="dropdown-item text-secondary display-4 submenu" href="${pageContext.request.contextPath}/logout"><span class="mbri-logout mbr-iconfont mbr-iconfont-btn"></span>Sair&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        </div>
                </li>
            </ul>
        </div>
        </security:authorize>
        <security:authorize access="isAnonymous()">
                <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-sm btn-primary display-4" data-toggle="modal" data-target="#loginModal">
                        <span class="mbri-lock mbr-iconfont mbr-iconfont-btn"></span>
                        Login 
                    </a>
                    <a class="btn btn-sm btn-default display-4" data-toggle="modal" data-target="#CadastroUsuarioModal">
                        <span class="mbri-plus mbr-iconfont mbr-iconfont-btn"></span>
                        Incluir conta 
                    </a>
                </div>
        </security:authorize>
        
    </nav>

</section>
<br><br><br><br>

<!-- Modais -->
<div id="CadastroUsuarioModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<center><h3>Cadastro de novo usuário</h3></center>
                <button type="button" class="close" data-dismiss="modal"> &times;</button>
			</div>
			<div class="modal-body">
				<div class="form-group">  
					<form onsubmit="return false">
						<input type="email" id="emailCadastro" name="emailCadastro" class="form-control" placeholder="E-mail" required>
						<br>
						<input type="text" id="userCadastro" name="userCadastro" class="form-control" placeholder="Usuário desejado" required>
						<br>
						<input type="password" id="senhaCadastro1" name="senhaCadastro1" class="form-control" placeholder="Senha" required>
						<br>
						<input type="password" id="senhaCadastro2" name="senhaCadastro2" class="form-control" placeholder="Confirme a senha" required>
						<br>
						<center><label class="mensagemErro" id="cadastroUsuarioError"></label></center>
						<input type="submit" id="cadastroUsuarioButton" class="btn btn-primary btn-block" value="Entrar" style="margin:0px;">
                   	</form>
				</div>
			</div>
			<div class="modal-footer">
				<div style="padding:10px"></div>
			</div>
		</div>
	</div>
</div>
    
<div id="loginModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center><h3>Login</h3></center>
	            <button type="button" class="close" data-dismiss="modal"> &times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">  
                	<form onsubmit="return false">
                        <input type="text" name="username" id="userLogin" class="form-control" placeholder="Usuário" required>
                        <br>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Senha" required>
                        <br>
                        <center><label class="mensagemErro" id="loginError"></label></center>
                        <input type="submit" id="loginButton" class="btn btn-primary btn-block" value="Entrar" style="margin:0px;">
                    </form>
                        <br>
                        <br>
                        <a href="${pageContext.request.contextPath}/reset-senha" style="color:blue" id="resetPass">Redefinir senha</a>
                </div>
            </div>
			<div class="modal-footer">
				<div style="padding:10px"></div>
			</div>
        </div>
    </div>
</div>


<div id="CadastroAulaModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center><h3>Cadastro de nova aula</h3></center>
	            <button type="button" class="close" data-dismiss="modal"> &times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">  
                    <form method="POST" action="/cursos">
                        <input type="text" id="tituloAula" class="form-control" placeholder="Título" required>
                        <br>
                        <textarea type="text" id="descricaoAula" class="form-control" placeholder="Descrição aula" required></textarea>
                        <br>
                        <select class="form-control">
                            <option>Selecione o assunto...</option>
                        </select>
                        <br>
                        <input type="button" class="btn btn-primary" value="Salvar">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <div style="padding:10px"></div>
            </div>
        </div>
    </div>
</div>


<div id="PesquisaAssuntoModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<center><h3>Pesquisar Assunto</h3></center>
					<button type="button" class="close" data-dismiss="modal"> &times;</button>
			</div>
			<div class="modal-body">
				<div class="form-group">  
					<form method="POST" action="${pageContext.request.contextPath}/assunto/busca">
						<input type="text" id="assuntoPesquisa" name="busca" class="form-control" placeholder="Assunto" required>
						<br>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<div style="padding:10px"></div>
			</div>
		</div>
	</div>
</div>


<div id="CadastroAssuntoModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
    		<div class="modal-header">
        		<center><h3>Cadastro de novo Assunto</h3></center>
    			<button type="button" class="close" data-dismiss="modal"> &times;</button>
    		</div>
    		<div class="modal-body">
        		<div class="form-group">  
            		<form action="${pageContext.request.contextPath}/assunto/adiciona" method="POST">
            			<input name="nome" class="form-control" />
                		<br>
                		<input type="submit" id="cadastroButton" class="btn btn-primary btn-block" value="Cadastrar" style="margin:0px;">
                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            		</form>
        		</div>
    		</div>
                        
			<div class="modal-footer">
				<div style="padding:10px"></div>
			</div>
		</div>
	</div>
</div>


<div id="mantemUsuarioModal" class="modal fade" role="dialog" style="width:100vw !important">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center><h3>Manter contas de usuários</h3></center>
            <button type="button" class="close" data-dismiss="modal"> &times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="panel panel-default">
                            <div class="panel-heading c-list">
                                <div class="row">
                                    <div class="col-sm-4 form-inline" style="padding-top:10px;">
                                        <input type="text" id="usuarioContaSearchField" class="form-control" placeholder="Pesquise por usuário">
                                    </div>
                                    <div class="col-sm-4 form-inline" style="padding-top:10px;">
                                        <a class="btn btn-sm btn-primary display-4" id="searchUsers2Button">
                                                <span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                                                Pesquisar 
                                        </a>
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
                            <div id="listaUsuariosConta" class="hidden">
                                <ul class="list-group" id="contact-list">
                                    <li class="list-group-item" id="1">
                                        <form method="POST" action="/cursos">
                                            <input type="email" id="emailConta" class="form-control" placeholder="E-mail" required>
                                            <br>
                                            <input type="text" id="userConta2" class="form-control" placeholder="Usuário" required>
                                            <br>
                                            <br>
                                            <input type="submit" id="cadastroButton" class="btn btn-primary btn-block" value="Salvar" style="margin:0px;">
                                        </form>
                                    </li>
                                </ul>
                            </div>
                    </div>
                </div>
            </div>      
            <div class="modal-footer">
                <div style="padding:10px"></div>
            </div>
        </div>
    </div>
</div>


<!-- Futuro -->
<div id="promoveInstrutorModal" class="modal fade" role="dialog" style="width:100vw !important">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center><h3>Promover usuário à Instrutor</h3></center>
            <button type="button" class="close" data-dismiss="modal"> &times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="panel panel-default">
                            <div class="panel-heading c-list">
                                <div class="row">
                                    <div class="col-sm-4 form-inline" style="padding-top:10px;">
                                        <input type="text" id="usuarioSearchField" class="form-control" placeholder="Pesquise por usuário">
                                    </div>
                                    <div class="col-sm-4 form-inline" style="padding-top:10px;">
                                        <a class="btn btn-sm btn-primary display-4" id="searchUsersButton">
                                                <span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                                                Pesquisar 
                                        </a>
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
                            <div id="listaUsuarios" class="hidden">
                                <ul class="list-group" id="contact-list">
                                    <li class="list-group-item" id="1">
                                        <form method="POST" action="/cursos">
                                            <input type="text" id="userConta" class="form-control" placeholder="Usuário" readonly>
                                            <br>
                                            <select class="form-control">
                                                <option>Selecione o assunto...</option>
                                            </select>
                                            <br>
                                            <input type="submit" id="cadastroButton" class="btn btn-primary btn-block" value="Promover à Instrutor" style="margin:0px;">
                                        </form>
                                    </li>
                                </ul>
                            </div>
                    </div>
                </div>
            </div>      
            <div class="modal-footer">
                <div style="padding:10px"></div>
            </div>
        </div>
    </div>
</div>
<div id="aprovaPerguntaModal" class="modal fade" role="dialog">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <center><h3>Aprovar Perguntas</h3></center>
        <button type="button" class="close" data-dismiss="modal"> &times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">  
                <form method="POST" action="/cursos">
                    <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                    <br>
                    <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
                </form>
            </div>
        </div>
                            
                    <div class="modal-footer">
                        <div style="padding:10px"></div>
                    </div>
        
    </div>
</div>
</div>

<div id="aprovaConteudoModal" class="modal fade" role="dialog">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <center><h3>Aprovar conteúdo</h3></center>
        <button type="button" class="close" data-dismiss="modal"> &times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">  
                <form method="POST" action="/cursos">
                    <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                    <br>
                    <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
                </form>
            </div>
        </div>
                            
                    <div class="modal-footer">
                        <div style="padding:10px"></div>
                    </div>
        
    </div>
</div>
</div>


<div id="aprovaPerguntaModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
    <div class="modal-header">
        <center><h3>Aprovar Perguntas</h3></center>
    <button type="button" class="close" data-dismiss="modal"> &times;</button>
    </div>
    <div class="modal-body">
        <div class="form-group">  
            <form method="POST" action="/cursos">
                <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                <br>
                <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
            </form>
        </div>
    </div>
                        
                <div class="modal-footer">
                    <div style="padding:10px"></div>
                </div>
    
</div>
</div>
</div>


<div id="respondePerguntaModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
    <div class="modal-header">
        <center><h3>Responder perguntas</h3></center>
    <button type="button" class="close" data-dismiss="modal"> &times;</button>
    </div>
    <div class="modal-body">
        <div class="form-group">  
            <form method="POST" action="/cursos">
                <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                <br>
                <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
            </form>
        </div>
    </div>
                        
                <div class="modal-footer">
                    <div style="padding:10px"></div>
                </div>
    
</div>
</div>
</div>

<div id="corrigeExercicioModal" class="modal fade" role="dialog">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <center><h3>Corrigir exercícios</h3></center>
        <button type="button" class="close" data-dismiss="modal"> &times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">  
                <form method="POST" action="/cursos">
                    <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                    <br>
                    <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
                </form>
            </div>
        </div>
                            
                    <div class="modal-footer">
                        <div style="padding:10px"></div>
                    </div>
        
    </div>
</div>
</div>

<div id="respondePerguntaModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center><h3>Responder perguntas</h3></center>
            <button type="button" class="close" data-dismiss="modal"> &times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">  
                    <form method="POST" action="/cursos">
                        <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                        <br>
                        <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
                    </form>
                </div>
            </div>
                                
                        <div class="modal-footer">
                            <div style="padding:10px"></div>
                        </div>
            
        </div>
    </div>
</div>

<div id="mantemPermissaoModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <center><h3>Manter Permissões de usuários</h3></center>
                <button type="button" class="close" data-dismiss="modal"> &times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">  
                        <form method="POST" action="/cursos">
                            <input type="text" id="assuntoPesquisa" class="form-control" placeholder="Assunto" required>
                            <br>
                            <input type="submit" id="PesquisaAssuntoButton" class="btn btn-primary btn-block" value="Pesquisar" style="margin:0px;">
                        </form>
                    </div>
                </div>
                                    
                            <div class="modal-footer">
                                <div style="padding:10px"></div>
                            </div>
                
            </div>
        </div>
    </div>

