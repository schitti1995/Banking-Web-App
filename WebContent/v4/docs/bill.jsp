<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="databean.*" %>
 <%
 Bill student_loan = new Bill();
 Bill auto_loan = new Bill();
 if (session.getAttribute("studentLoan") != null) {
	 student_loan = (Bill)session.getAttribute("studentLoan");
 }
 
 if (session.getAttribute("autoLoan") != null) {
	 auto_loan = (Bill)session.getAttribute("autoLoan");
 }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title> Overview &middot; </title>

    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
    <link href="assets/css/toolkit-light.css" rel="stylesheet">
    <link href="assets/css/application.css" rel="stylesheet">

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
        <div class="dashhead" style="padding-bottom: 50px">
  <div class="dashhead-titles">
    <h6 class="dashhead-subtitle">Dashboards</h6>
    <h2 class="dashhead-title">Loans </h2>
  </div>
 <div class="btn-toolbar dashhead-toolbar">
    <div class="btn-toolbar-item input-with-icon">
      <input type="text" value="01/01/15 - 01/08/15" class="form-control" data-provide="datepicker">
      <span class="icon icon-calendar"></span>
    </div>
  </div>
</div>

<c:forEach var="error" items="${form.formErrors}">
	<h3 style="color:red"> ${error} </h3>
</c:forEach>

 <div class="row statcards">
      <div style="width:45%; padding-left:20px;">
        <div class="statcard statcard-danger">
          <div class="p-3">
            <span class="statcard-desc"><%=student_loan.getDescription() %> Balance</span>
            <h2 class="statcard-number">
              $ <%=student_loan.getAmount()%>
            </h2>
            <hr class="statcard-hr mb-0">
          </div>
          <!--<canvas id="sparkline1" width="378" height="94" class="sparkline" data-chart="spark-line" data-value="[{data:[4,34,64,27,96,50,80]}]" data-labels="['a', 'b','c','d','e','f','g']" style="width: 189px; height: 47px;"></canvas>-->

            <div style="padding-top:0px; padding-bottom:20px; padding-left:20px; padding-right:20px; ">
                <span class="statcard-desc">
                    Interest Rate: 7%
                    <br>
                    Next Installment Due Date: 01.01.18
                    <br>
                    Amount Paid: $800
                </span>
            </div>
        </div>
      </div>

      <div style="width: 45%; padding-left:20px;">
        <div class="statcard statcard-success">
          <div class="p-3">
            <span class="statcard-desc"><%=auto_loan.getDescription() %> Balance </span>
            <h2 class="statcard-number">
              $ <%=auto_loan.getAmount() %>
            </h2>
            <hr class="statcard-hr mb-0">
          </div>
          <!--<canvas id="sparkline1" width="378" height="94" class="sparkline" data-chart="spark-line" data-value="[{data:[28,68,41,43,96,45,100]}]" data-labels="['a','b','c','d','e','f','g']" style="width: 189px; height: 47px;"></canvas>-->

            <div style="padding-top:0px; padding-bottom:20px; padding-left:20px; padding-right:20px; ">
                <span class="statcard-desc">
                    Interest Rate: 5%
                    <br>
                    Next Installment Due Date: 12.01.18
                    <br>
                    Amount Paid: $200
                </span>
            </div>
        </div>
      </div>
      </div>




				
  </div>






</div>
</div>

<script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/tether.min.js"></script>
    <script src="assets/js/chart.js"></script>
    <script src="assets/js/tablesorter.min.js"></script>
    <script src="assets/js/toolkit.js"></script>
    <script src="assets/js/application.js"></script>
    <script>
      // execute/clear BS loaders for docs
      $(function(){while(window.BS&&window.BS.loader&&window.BS.loader.length){(window.BS.loader.pop())()}})
    </script>
</body>
</html>