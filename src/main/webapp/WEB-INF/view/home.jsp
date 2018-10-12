<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "styles&Scripts.jsp" %>
<%@ include file = "inicialMenu.jsp" %>
    
    <div style="width:100%">
        <img src="${pageContext.request.contextPath}/assets/images/cursosOut.jpg" style="width:100%"/>
        <span style="position:absolute; top:15%; left:10%; font-size:5vw; color:white">Cursos online gratuitos de tecnologia.</span>
        <security:authorize access="hasAuthority('ADMIN')">
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
