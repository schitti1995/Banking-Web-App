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

    Utility History

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
        <h2 class="dashhead-title">History of past payments</h2>
      </div>
        </div>
        <div>
        <br>
        <%
        		if(request.getAttribute("utilitypay_pass") != null) {
        %>
          <h4 style="color:darkgreen;"><%=request.getAttribute("utilitypay_pass") %></h4>
          
          <% } %>
          
           <%
        		if(request.getAttribute("utilitypay_fail") != null) {
        %>
          <h4 style="color:red;"><%=request.getAttribute("utilitypay_fail") %></h4>
          
          <% } %>
          
        <br>
        
        </div>
			<table style="width:100%">
				<tr>
				    <th>Payment Id</th>
				    <th>Amount</th>
				    <th>From account</th>
				    <th>Payee Name</th>
				    <th>Status</th>
				    <th>Payee's Account</th>
				    <th>Date of Trnsctn</th>
				  </tr>
        
        <%
		Payee[] allpayees = (Payee[]) session.getAttribute("payee_transactions");
		if (allpayees != null) {
			for (Payee p: allpayees) {
		%>	
				<tr>
				    <td><%=p.getPayment_id()%></td>
				    <td><%=p.getAmount()%></td>
				    <td>xxxxxx<%=p.getFromAccount_no().substring(6)%></td>
				    <td><%=p.getPayee_name()%></td>
				    <td><%=p.getStat()%></td>
				    <td><%=p.getToAccount_no()%></td>
				    <td><%=p.getTrdate()%></td>
				  </tr>
        <%
			}
		%>	
		</table>	
		<% }
			else {
		%>
		    <h4 style="color:red"> No transactions yet. Your transaction history shows here.</h4>
		    <hr><br>
<%
		}
		
%>
        </div>
	
    </div></div>