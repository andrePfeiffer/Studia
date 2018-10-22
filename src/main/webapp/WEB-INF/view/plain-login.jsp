<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp">
	<jsp:param name="modal" value="false" />
</jsp:include>
    
    <!-- INICIO TEXTO -->
    <section class="mbr-section article content1 cid-qSg7ltdNzT" id="content2-w">
        <div class="container">
            <div class="media-container-row">
                <div class="mbr-text col-12 col-md-12 mbr-fonts-style display-7" style="text-align: justify;font-family=font-family: 'Yantramanav', sans-serif;">
	<c:if test="${mensagem != null }">
		${mensagem}<br />
	</c:if>	        
<form:form action="${pageContext.request.contextPath}/autenticateTheUser" method="POST">
	<c:if test="${param.error != null }">
		Você digitou usuário ou senha errados<br />
	</c:if>
	<c:if test="${param.logout != null }">
		Você saiu com sucesso<br />
	</c:if>
	<c:if test="${param.denied != null }">
		Acesso negado<br />
	</c:if>
	   <input type="text" name="username" id="userLogin" class="form-control" placeholder="Usuário" required>
	   <br>
	   <input type="password" name="password" id="password" class="form-control" placeholder="Senha" required>
	   <br>
	<input type="submit" id="loginButton" class="btn btn-primary btn-block" value="Entrar" style="margin:0px;">
	<!--
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	 -->
</form:form>
                    <blockquote>
                        <p>
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