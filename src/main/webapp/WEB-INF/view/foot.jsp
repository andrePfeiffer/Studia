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

    $(document).ready(function(){
        userAtual = localStorage.getItem("username");
        $("#usuarioAtual").text(userAtual);
    })

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
    
</script>
    