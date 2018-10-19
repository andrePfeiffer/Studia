
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
                    
                </div>
            </div>
        </div>
    </section>
    <footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer2-p" style="background-color: rgba(51, 50, 50, 0.95);; padding-top: 0.875rem; padding-bottom: 0.875rem;">

        <div class="container">
            <p style="text-align: center;margin: auto;padding: 0;color: #acacac;">Desenvolvido por <a target="_blank" href="#" style="color:#f76f3e;text-decoration:none;">TeamPuc</a></p>
        </div>
    </footer>
    
    <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i></i></a></div>
    <input name="animation" type="hidden">
    
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
    <script type="text/javascript">
        $( "#cursoSearch" ).keyup(function() {
            var actualInput = $( "#cursoSearch" ).val();

            $(".cursoName").each(function(){
                var actualName = $(this).text();
                
                if(actualName.indexOf(actualInput) != -1){
                    $(this).parent().parent().css("display", "block");
                }else{
                    $(this).parent().parent().css("display", "none");
                }
            })
        });

        /*
    $(document).ready(function(){
        userAtual = localStorage.getItem("username");
        $("#usuarioAtual").text(userAtual);
    })
    */

    function startToast(msg) {
			var x = document.getElementById("toast");
			x.className = "show";
			$("#toast").text(msg);
			setTimeout(function(){ x.className = x.className.replace("show", ""); }, 6000);
	}
    $(".mbr-iconfont-btn").click(function(){
        startToast("Favorito adicionado com sucesso!");
    })
    $("#cadastroButton").click(function(){
        startToast("Assunto cadastrado com sucesso!");
    })
    </script>

<script type="text/javascript">

    $("#assuntoCadastro").keyup(function(){
        var assunto = $("#assuntoCadastro").val();
        localStorage.setItem("assuntoCadastro", assunto);
    }) 

    $("#assuntoPesquisa").keyup(function(){
        var pesquisa = $("#assuntoPesquisa").val();
        localStorage.setItem("cursoSearch", pesquisa);
    }) 

    $("#assuntoPesquisa").click(function(){
        $("#cursoSearch").val(localStorage.getItem("cursoSearch"));

    })

    $(document).ready(function(){
        $("#cursoSearch").val(localStorage.getItem("cursoSearch"));
        $("#cursoSearch").keyup();
        localStorage.setItem("cursoSearch", "");
    })
    
    $(document).ready(function(){
        if(localStorage.getItem("assuntoCadastro") != null){
            startToast("Curso adicionado com sucesso!");
        }
    })
    $("#searchUsers2Button").click(function(){
        $("#emailConta").val($("#usuarioContaSearchField").val()+"@gmail.com");
        $("#userConta2").val($("#usuarioContaSearchField").val());        
        $("#listaUsuariosConta").removeClass("hidden");
        
    })

    $("#searchUsersButton").click(function(){
        $("#userConta").val($("#usuarioSearchField").val());        
        $("#listaUsuarios").removeClass("hidden");
        
    })
   
// login
$("#loginButton").click(function(){
	if($('#userLogin').val().length > 0 && $('#password').val().length > 0){
    	$.ajax({
    		type: "POST",
    		url: "${pageContext.request.contextPath}/autenticateTheUser",
    		data: {username: $('#userLogin').val(), password: $('#password').val()},
    		async: true,
    	success: function(response){
    		if(response == "false"){
    			$('#loginError').text('Usuário ou senha incorretos');	
    		}else{
    			window.location.href='${pageContext.request.contextPath}';
    		}
    		
    	},
    	error: function(jqXHR, textStatus, errorThrown){
    		console.log(textStatus);
    		console.log(errorThrown);
    	}
    	});
	}
})

// cadastro de usuario
$("#cadastroUsuarioButton").click(function(){
	console.log("click")
	if(
			$('#emailCadastro').val().length > 0 && 
			$('#userCadastro').val().length > 0 && 
			$('#senhaCadastro1').val().length > 0 && 
			$('#senhaCadastro2').val().length > 0
			){
		console.log("if")
    	$.ajax({
    		type: "POST",
    		url: "${pageContext.request.contextPath}/adicionarUsuario",
    		data: {
    			emailCadastro: $('#emailCadastro').val(), 
    			userCadastro: $('#userCadastro').val(),
    			senhaCadastro1: $('#senhaCadastro1').val(), 
    			senhaCadastro2: $('#senhaCadastro2').val()
    			},
    		async: true,
    	success: function(response){
    		console.log(response)
    		if(response == "false1"){
    			$('#cadastroUsuarioError').text('As senhas devem ser idênticas');	
    		}else if(response == "false2"){
    			$('#cadastroUsuarioError').text('O email informado já está vinculado a outro usuário existente no sistema');
    		}else if(response == "false3"){
    			$('#cadastroUsuarioError').text('O usuário informado já existe');
    		}else if(response == "false4"){
    			$('#cadastroUsuarioError').text('A senha não atende aos requisitos de segurança');
    		}else{
    			window.location.href='${pageContext.request.contextPath}';
    		}
    	},
    	error: function(jqXHR, textStatus, errorThrown){
    		console.log(textStatus);
    		console.log(errorThrown);
    	}
    	});
	}
})


</script>

    	</body>
</html>