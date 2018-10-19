<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />
    
    <section class="mbr-section article content1 cid-qSg7ltdNzT" id="content2-w">
        <div class="container">
            <div class="media-container-row">
                <div class="mbr-text col-12 col-md-12 mbr-fonts-style display-7" style="text-align: justify;font-family=font-family: 'Yantramanav', sans-serif;">
<div class="col-md-8 offset-md-2">
    <center><h1>Redefinir Senha</h1></center>
	<c:if test="${mensagem != null }">
		${mensagem}<br />
	</c:if>	        

    <form method="POST"  action="${pageContext.request.contextPath}/nova-senha">
        <input type="text" name="userLogin" id="userLogin" class="form-control" placeholder="Usuário" required>
        <br>
        <input type="password" name="senha1" class="form-control" placeholder="Senha" required>
        <br>
        <input type="password" name="senha2" class="form-control" placeholder="Repita a senha" required>
        <br>
        <input type="submit" id="loginButton" class="btn btn-primary btn-block" value="Salvar" style="margin:0px;">
		<input type="hidden" name="code" value="${code}" /> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        <br>
        <br>
        
    </form>
</div>
                    <blockquote>
                        <p>
						</p>
                    </blockquote>
                </div>
            </div>
        </div>
    </section>
    <!-- FIM TEXTO -->
    
<jsp:include page="includes/footer.jsp" />