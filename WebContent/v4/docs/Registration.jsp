<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%
ArrayList<String> errorMessages = new ArrayList<String>();
if (session.getAttribute("errors") != null) {
	errorMessages = (ArrayList<String>)session.getAttribute("errors");
	session.setAttribute("errors", new ArrayList<String>());
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

    <title>OBS Registration</title>

    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
    <link href="./assets/css/toolkit-light.css" rel="stylesheet">
    <link href="./assets/css/register.css" rel="stylesheet">
    <link href="./assets/css/application.css" rel="stylesheet">

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
            <h2 class="dashhead-title">Prove your identity</h2>
          </div>
        </div>

          <div class="message">
            <p>Enter the User Id and Temporary PIN the bank would have posted to you.</p>
          </div>

          	<%if (errorMessages.size() != 0) {
          		for (String e : errorMessages) {
          	%>
          	<p style="color:red;"><%= e%></p>
          	<%} }%>
          <div class="form-position">
            <form method="POST" action="initialVerif.do">
              <div class="form-group">
                <label class="col-form-label" for="userID">User ID</label>
                <input type="text" class="form-control" id="userID" placeholder="User ID" name = "customer_id">
              </div>
              <div class="form-group">
                <label class="col-form-label" for="temporaryPIN">Temporary PIN</label>
                <input type="password" class="form-control" id="temporaryPIN" placeholder="Temporary PIN" name="initial_password">
              </div>

              <div class="form-group">
                <label for="">
                <a href="#"> Forgot PIN? Contact a bank employee?</a> 
                </label>
                <br>
               <button type="submit" class="btn btn-primary proceed-button">Proceed</button>
              </div>
          </form>
        </div>

        <br>

        <div class="note">
          <h4> Forgot User ID?</h4>
          <hr>
            <li>If you have misplaced it, we strongly recommend you to look for the post we sent to you.</li>
            <li>User ID is 8 characters long</li>
            <li>There are 3 numbers, 4 letters of the English alphabet, and 1 special character.</li>
            <li>For security purposes, we don't electronically let you retrieve the User ID.</li>
            <li>Doesn't ring a bell? Please visit the nearest Devonshire Bank. We shall see you through.</li>
        </div>
</div>
</div>
</body>
</html>