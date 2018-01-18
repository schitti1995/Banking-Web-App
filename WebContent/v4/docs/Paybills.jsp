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

    Pay for a utility

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
        <h2 class="dashhead-title">Pay for a utility</h2>
      </div>
        </div>

          <div class="message">
          <br>
            <p>Choose the utility from the list below to pay up.</p>
            <hr>
          </div>
          
          <c:if test="${not empty errors_paypayee}">
                        <c:forEach items="${errors_paypayee}" var="error">
                            <div class="alert alert-danger col-10" role="alert">
                                <c:out value="${error}" />
                            </div>
                        </c:forEach>
                    </c:if>

        <br>
       	    <form action="paypayee.do" method="POST" class="xyz">	
			<table style="width:100%">
				<tr>
				    <th>Payee Name</th>
				    <th>Utility</th>
				    <th>From account</th>
				    <th>Enter the amount in USD</th>
				    <th>Click to pay</th>
				  </tr>
        
        <%
		PayeeInfo[] allpayees = (PayeeInfo[]) session.getAttribute("allpayees");
		if (allpayees != null) {
			for (PayeeInfo p: allpayees) {
		%>	
				<%if (p.getFromAccount_no().equals(((Account)session.getAttribute("savingAccount")).getAccount_no()) || p.getFromAccount_no().equals(((Account)session.getAttribute("checkingAccount")).getAccount_no())) {%>
				<tr>
				    <td><%=p.getPayee_name()%></td>
				    <td><%=p.getUtility()%></td>
				    <td>xxxxxx<%=p.getFromAccount_no().substring(6)%></td>
				    <td><input type="text" name=<%=p.getPayee_account_no()%> ></td>
				    <td><input type="submit" name="button" value="Pay <%=p.getPayee_account_no()%>!" class="btn btn-outline-primary px-3"></td>
				  </tr><%} %>
        <%
			}
		%>	
		</table>
	        </form>		
		<% }
			else {
		%>
		    <h4 style="color:red"> Oops. Looks like you haven't added any payees yet.</h4>
		    <h4><a href="Addpayee.jsp">Add Payees?</a></h4>
<%
		}
		
%>
        </div>
	
    </div></div>