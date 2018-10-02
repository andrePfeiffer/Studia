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
<body>´
<h1>listar aulas</h1>
<c:forEach var="aulas" items="${aula}">
	${aula}
</c:forEach>
${nome}
</body>
</html>
