<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp">
	<jsp:param name="modal" value="false" />
</jsp:include>
    
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
        <security:authorize access="isAuthenticated()">
        	<h1>logado</h1>
        </security:authorize>
        <security:authorize access="isAnonymous()">
        	<h1>nao logado</h1>
        </security:authorize>
    
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
    
<jsp:include page="includes/footer.jsp">
	<jsp:param name="front" value="true" />
</jsp:include>