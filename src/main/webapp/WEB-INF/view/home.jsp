<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon-85x100-1.png" type="image/x-icon">
  <meta name="description" content="">
  <title>StudiaTech</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/assets/prime-icons/prime-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/dropdown/css/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/prime/css/mbr-additional.css" type="text/css">
  
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
        /*
        .img-responsive{
            border-radius: 5px 5px 0px 0px;
        }*/

        .slider-item .slider-image img{
            margin: 0 auto;
            width: 100%;
        }
        .slider-item .slider-main-detail{
            padding: 10px;
            border-radius: 0 0 5px 5px;
        }
        .slider-item:hover .slider-main-detail{
            /*background-color: #dbeeee !important;*/
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
    </style>

</head>
<body>
    <!-- INICIO MENU -->
    <section class="menu cid-qRQFsF87rC" once="menu" id="menu2-p">
        <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm bg-color transparent">
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
                        <a href="index.html">
                            <img src="${pageContext.request.contextPath}/assets/images/studia.png" alt="StudiaTech" title="" style="height: 3.8rem;">
                        </a>
                    </span>
                </div>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">

                    <!-- <li class="nav-item">
                        <a class="nav-link link text-secondary display-4" href="#"><span class="mbri-hot-cup mbr-iconfont mbr-iconfont-btn"></span>Cursos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-secondary display-4" href="#"><span class="mbri-flag mbr-iconfont mbr-iconfont-btn"></span>Assuntos</a>
                    </li> -->
                    <!-- <li class="nav-item">
                        <a class="nav-link link text-secondary display-4" href="#form4-11"><span class="socicon socicon-mail mbr-iconfont mbr-iconfont-btn"></span>Contato</a>
                    </li>
                    -->
                </ul>

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

            </div>
        </nav>

        <div id="CadastroUsuarioModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h3>Cadastro de novo usuário</h3></center>
                        <button type="button" class="close" data-dismiss="modal"> &times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">  
                                <form method="POST" action="/cursos">
                                    <input type="email" id="emailCadastro" class="form-control" placeholder="E-mail" required>
                                    <br>
                                    <input type="text" id="userCadastro" class="form-control" placeholder="Usuário desejado" required>
                                    <br>
                                    <input type="password" class="form-control" placeholder="Senha" required>
                                    <br>
                                    <input type="password" class="form-control" placeholder="Confirme a senha" required>
                                    <br>
                                    <input type="submit" id="cadastroButton" class="btn btn-primary btn-block" value="Entrar" style="margin:0px;">
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
                            <form method="POST"  action="/cursos">
                                <input type="text" id="userLogin" class="form-control" placeholder="Usuário" required>
                                <br>
                                <input type="password" class="form-control" placeholder="Senha" required>
                                <br>
                                <input type="submit" id="loginButton" class="btn btn-primary btn-block" value="Entrar" style="margin:0px;">
                                <br>
                                <br>
                                <a style="color:blue">Redefinir senha</a>
                            </form>
                        </div>
                    </div>
                                        
                                <div class="modal-footer">
                                    <div style="padding:10px"></div>
                                </div>
                   
                </div>
            </div>
        </div>
    </section>
    <!-- FIM MENU -->
    <div style="width:100%">
        <img src="${pageContext.request.contextPath}/assets/images/cursosOut.jpg" style="width:100%"/>
        <span style="position:absolute; top:15%; left:10%; font-size:5vw; color:white">Cursos online gratuitos de tecnologia.</span>
        <security:authorize access="hasRole('ADMIN')">
	        User: <security:authentication property="principal.username" /><br />
	        Role: <security:authentication property="principal.authorities" /><br />
	    </security:authorize>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
        	<input type="submit" value="Logout" />
        </form:form>
    </div>
    <!-- INICIO TEXTO -->
    <section class="mbr-section article content1 cid-qSg7ltdNzT" id="content2-w">
        <div class="container">
            <div class="media-container-row">
                <div class="mbr-text col-12 col-md-12 mbr-fonts-style display-7" style="text-align: justify;font-family=font-family: 'Yantramanav', sans-serif;">
                    <blockquote>
                        <p>
                            A<strong> StudiaTech</strong>&nbsp;é ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis laoreet risus eget faucibus. Donec vulputate metus in ipsum eleifend, quis faucibus ligula faucibus. Duis tincidunt consequat consequat. Sed ullamcorper fringilla blandit. Donec eu metus feugiat, rutrum ipsum eu, blandit nibh. Donec tincidunt interdum purus, at bibendum turpis blandit id. Sed nunc dui, interdum quis augue accumsan, ultrices luctus felis. In in aliquet nibh. Aliquam nisi elit, volutpat ut lacus nec, venenatis pulvinar risus. Morbi mollis dignissim auctor. Suspendisse ac tellus ut erat dignissim cursus non eu mauris. Curabitur cursus ligula in urna mattis varius. In finibus mauris tortor, id tincidunt tortor malesuada eget. Aenean efficitur justo libero, id ornare justo fermentum eleifend. Integer tempor ante non lacus congue bibendum.

							Cras nibh eros, interdum et pharetra vel, efficitur vitae urna. Praesent egestas nisi vel quam lobortis consectetur. Aliquam sit amet rhoncus nunc. Suspendisse eget consequat mi. Etiam varius, orci ut lacinia posuere, tortor libero vestibulum odio, in commodo massa odio ac arcu. Cras et varius ligula. Nulla bibendum lobortis urna vitae mattis. Nulla fringilla neque nec erat hendrerit, quis venenatis purus finibus. Phasellus nibh ligula, sollicitudin at lorem ut, tempus mattis massa. Ut ultricies diam ac dolor tempus, a blandit felis gravida.
						</p>
                    </blockquote>
                </div>
            </div>
        </div>
    </section>
    <!-- FIM TEXTO -->
    
    <section class="cid-qSgoZc68Wc" id="footer1-17" style="padding-top: 0 !important;">
        <div class="container">
            <div class="footer-lower">
                <div class="media-container-row">
                    <div class="col-sm-12">
                        <hr>
                    </div>
                </div>
                <div class="media-container-row mbr-white">
                    <div class="col-sm-6 copyright">
                        <p class="mbr-text mbr-fonts-style display-7">
                            Copyright © 2018 StudiaTech Todos os direitos reservados
                        </p>
                    </div>
                    <div class="col-md-6">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer2-p" style="background-color: rgba(51, 50, 50, 0.95);; padding-top: 0.875rem; padding-bottom: 0.875rem;">

        <div class="container">
            <p style="text-align: center;margin: auto;padding: 0;color: #acacac;">Desenvolvido por <a target="_blank" href="#" style="color:#f76f3e;text-decoration:none;">TeamPuc</a></p>
        </div>
    </footer>

    <!-- FIM RODAPÉ -->

    <script src="${pageContext.request.contextPath}/assets/web/assets/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/tether/tether.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/smoothscroll/smooth-scroll.js"></script>
    <script src="${pageContext.request.contextPath}/assets/dropdown/js/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/touchswipe/jquery.touch-swipe.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/viewportchecker/jquery.viewportchecker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/ytplayer/jquery.mb.ytplayer.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
    <script src="${pageContext.request.contextPath}/assets/mbr-clients-slider/mbr-clients-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/slidervideo/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/formoid/formoid.min.js"></script>

    <script type="text/javascript">
            $("#userLogin").keyup(function(){
                var user = $("#userLogin").val();
                setUserName(user);
            })
            
            $("#userCadastro").keyup(function(){
                var user = $("#userCadastro").val();
                setUserName(user);
            })
            
        function setUserName(user){
            // Salva dados na sessão
        localStorage.setItem("username", user);
        }
    </script>


    <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i></i></a></div>
    <input name="animation" type="hidden">
</body>
</html>
