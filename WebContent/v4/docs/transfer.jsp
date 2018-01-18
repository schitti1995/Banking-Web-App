<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="databean.*" %>
    <%@ page import="formbean.*" %>
        <%@ page import="java.util.*" %>
<%
Account checkingAcc = new Account();
if (session.getAttribute("checkingAccount") != null) {
	checkingAcc = (Account)session.getAttribute("checkingAccount");
}

Account savingAcc = new Account();
if (session.getAttribute("savingAccount") != null) {
	savingAcc = (Account)session.getAttribute("savingAccount");
}


String[] errorMessages = new String[0];
if (request.getAttribute("form") != null) {
	errorMessages = ((TransferForm)request.getAttribute("form")).getFormErrors();
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
    <title>
      
        Overview &middot; 
      
    </title>

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
    <h2 class="dashhead-title">Internal Transfer</h2>
  </div>

  <div class="btn-toolbar dashhead-toolbar">
    <div class="btn-toolbar-item input-with-icon">
      <input type="text" value="01/01/15 - 01/08/15" class="form-control" data-provide="datepicker">
      <span class="icon icon-calendar"></span>
    </div>
  </div>
</div>

<%  for (String error : errorMessages) {%>
	<h3 style="color:red"> <%=error %> </h3>
<%} %>
<form action="transfer.do" method="POST">
  <div class="form-group">
      <label for="scrAcc"> Source Account </label>    
      <select class="form-control col-6" name="srcAcc">
        <option value="<%=checkingAcc.getAccount_no()%>">Checking Account <%=checkingAcc.getAccount_no()%></option>
        <option value="<%=savingAcc.getAccount_no()%>">Saving Account   <%=savingAcc.getAccount_no()%></option>
      </select>
  </div>
    
  <div class="form-group">
    <label for="account"> Destination account </label>    
    <input class="form-control col-6" type="text" name="destAcc">
  </div>

  <div class="form-group">
    <label for="receiver"> Name of receiver: </label>
    <input class="form-control col-6" type="text" name="receiverFirstname" placeholder="Firstname">
    <input class="form-control col-6" type="text" name="receiverLastname" placeholder="Lastname">
  </div>

  <div class="form-group">
    <label for="amount"> Amount in USD: </label>
    <input class="form-control col-6" type="text" name="amount" value="">
  </div>
    
  <div class="form-group">
    <label for="verificationCode">
      Verification code:
    </label>
    <input class="form-control col-6" type="text" name="verifCode" value="">
  </div>

  <div class="form-group">
    <label>
      How do you like to receive the verification code?
    </label>
    <br>
    <button type="button" class="btn btn-primary">Send me by email</button>
    <button type="button" class="btn btn-primary">Send me by text message</button>
  </div>
  <input type="submit" name="action" value="Submit Transfer Request" class="btn btn-outline-primary px-3">

</form>

  <div id="docsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Example modal</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>You're looking at an example modal in the dashboard theme.</p>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" data-dismiss="modal">Cool, got it!</button>
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