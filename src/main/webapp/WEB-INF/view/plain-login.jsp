<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp">
	<jsp:param name="modal" value="false" />
</jsp:include>
    
        <security:authorize access="hasAuthority('ADMIN')">
	        User: <security:authentication property="principal.username" /><br />
	        Role: <security:authentication property="principal.authorities" /><br />
	    </security:authorize>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
        	<input type="submit" value="Logout" />
        </form:form>
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
        <security:authorize access="hasAuthority('EMPLOYEE')">
        <h1>é EMPLOYEE</h1>
        </security:authorize>
        <security:authorize access="hasAuthority('ADMIN')">
        <h1>é ADMIN</h1>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
        <security:authentication property="principal.username"/>
        <security:authentication property="principal.authorities"/>
        </security:authorize>
	<c:if test="${mensagem != null }">
		${mensagem}<br />
	</c:if>	        
<form:form action="${pageContext.request.contextPath}/autenticateTheUser" method="POST">
	<c:if test="${param.error != null }">
		Sorry! You entered invalid username/password<br />
	</c:if>
	<c:if test="${param.logout != null }">
		You have been logged out<br />
	</c:if>
	<c:if test="${param.denied != null }">
		Access denied<br />
	</c:if>
	Username: <input type="text" name="username" /><br />
	Password: <input type="password" name="password" /><br />
	<input type="submit" value="Login" /><br />
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