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
    
    <security:authorize access="hasRole('ADMIN')">
	        User: <security:authentication property="principal.username" /><br />
	        Role: <security:authentication property="principal.authorities" /><br />
	 </security:authorize>
    <!-- FIM MENU -->