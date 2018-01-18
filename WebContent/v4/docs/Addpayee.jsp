<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="databean.*" %>
    <%@ page import="formbean.*" %>
        <%@ page import="java.util.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Account checkingAcc = new Account();
if (session.getAttribute("checkingAccount") != null) {
	checkingAcc = (Account)session.getAttribute("checkingAccount");
}

Account savingAcc = new Account();
if (session.getAttribute("savingAccount") != null) {
	savingAcc = (Account)session.getAttribute("savingAccount");
}

/* CustomerInfo currentUser = new CustomerInfo();
if(session.getAttribute("user") != null) {
    currentUser = (User)session.getAttribute("user"); 
}*/
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

    Add a utility

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
<%
	if(session.getAttribute("savingAccount") == null || session.getAttribute("checkingAccount") == null) {
	    response.sendRedirect("login.jsp");
	}
%>

<div class="container">
  <div class="row">
  <jsp:include page="dashboard.jsp" />

  <div class="col-md-9 content">
    <div class="dashhead">
      <div class="dashhead-titles">
        <h2 class="dashhead-title">Add payee details</h2>
      </div>
        </div>

          <div class="message">
          <br>
            <p>Fill in the fields below to add a payee to pay to.</p>
            <hr>
          </div>

        <br>
<%--         <%
			List<String> errors = (List<String>) request.getAttribute("errors_addpayee");
			if (errors != null) {
				for (String error : errors) {
		%>		
						<h3 style="color:red"> <%= error %> </h3>
		<%
				}
			}
		%>	 --%>
        
        <form action="addpayee.do" method="POST">
        
        <c:if test="${not empty errors_addpayee}">
                        <c:forEach items="${errors_addpayee}" var="error">
                            <div class="alert alert-danger col-10" role="alert">
                                <c:out value="${error}" />
                            </div>
                        </c:forEach>
                    </c:if>
		
		  <div class="form-group">
		    <label> Payee's name: </label>
		    <input class="form-control col-6" type="text" name="payeeName" placeholder="Firstname Lastname" value="${form.payee_name}">
		  </div>
		  
		  <div class="form-group">
		    <label> Utility name: </label>
		    <input class="form-control col-6" type="text" name="utility" placeholder="Ex: Electricity"value="${form.utility}">
		  </div>
		  
		  <div class="form-group">
		    <label> Payee account Number</label>    
		    <input class="form-control col-6" type="text" name="payeeAcc" placeholder="xxxxxxxxxx" value="${form.payee_acc}">
		  </div>
		    
		  <div class="form-group">
		      <label for="scrAcc"> Source Account </label>    
		      <select class="form-control col-6" name="srcAcc">
		      <%if(session.getAttribute("checkingAccount") != null && session.getAttribute("savingAccount") != null) {%>
		        <option value="<%=checkingAcc.getAccount_no()%>">Checking Account xxxxxx<%=checkingAcc.getAccount_no().substring(6)%></option>
		        <option value="<%=savingAcc.getAccount_no()%>">Saving Account   xxxxxx<%=savingAcc.getAccount_no().substring(6)%></option>
		        <%} %>
		      </select>
  		  </div>
		
		  <br>
		  <input type="submit" name="button" value="Add Payee" class="btn btn-outline-primary px-3">
		</form>
        </div>
	
    </div></div>
    </body>
    </html>