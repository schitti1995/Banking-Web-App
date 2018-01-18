<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="databean.*" %>
    <%@ page import="formbean.*" %>
        <%@ page import="java.util.*" %>
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

    Manage Payees

  </title>

  <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
  <link href="assets/css/toolkit-light.css" rel="stylesheet">

  <link href="assets/css/application.css" rel="stylesheet">
  <link href="assets/css/UtilityPay.css" rel="stylesheet">
  

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
    <div class="dashhead">
      <div class="dashhead-titles">
        <h2 class="dashhead-title">View/Delete payees</h2>
      </div>
        </div>

          <div class="message">
          <br>
          <hr>
            <p>Here's your current list of payees. Choose the 'X' against a payee to delete them.</p>
            <p> Alternatively, do you want to <a href="Addpayee.jsp">add</a> more payees?</p>
          </div>
          
          <%
        		if(request.getAttribute("errors_delete") != null) {
        %>
          <h4 style="color:red;"><%=request.getAttribute("errors_delete") %></h4>
          <br>
	<ol>
     <%
   		}
   		PayeeInfo[] allpayees = (PayeeInfo[]) session.getAttribute("allpayees");
   		if (allpayees != null) {
   			for (PayeeInfo p: allpayees) {
     
     %> 
					<li>
					   <%=p.getPayee_name()%> (Utility = <%=p.getUtility()%>, Payee account No = <%=p.getPayee_account_no()%>)
					    <form action="deletepayee.do" method="POST">
					    		<input type="hidden" name="id" value=<%=p.getPayee_account_no()%>>
					    		<button type="submit" style="text-align:centre">Delete</button>
					    </form>
					    <br>
				  </li>
    <%}} %>
    </ol>
		
        </div>
    </div></div></body></html>