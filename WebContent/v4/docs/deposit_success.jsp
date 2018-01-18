<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>
        Overview &middot;
    </title>

    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
    <link href="assets/css/toolkit-light.css" rel="stylesheet">
    <link href="assets/css/application.css" rel="stylesheet">
    <link href="assets/css/deposit.css" rel="stylesheet">

    <style>
        /* note: this is a hack for ios iframe for bootstrap themes shopify page */

        /* this chunk of css is not part of the toolkit :) */

        body {
            width: 1px;
            min-width: 100%;
            *width: 100%;
        }
    </style>
</head>


<body>
<div class="container">
    <div class="row">
        <jsp:include page="dashboard.jsp" />

        <div class="col-md-9 content">
            <h1 color="green">
                Deposit Request Has Been Received!
            </h1>

            <c:if test="${not empty errors}">
                <c:forEach items="${errors}" var="error">
                    <div class="alert alert-danger col-10" role="alert">
                        <c:out value="${error}" />
                    </div>
                </c:forEach>
            </c:if>
        </div>


        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/"></script>
        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>
        <script src="assets/js/capture.js"></script>
    </div>
</div>
</body>
</html>