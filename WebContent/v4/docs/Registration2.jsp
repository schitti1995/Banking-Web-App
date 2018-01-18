<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
    crossorigin="anonymous">
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
          <h1>Register</h1>
          <p style="font-size:125%;">Some Information has already been filled</p>

          <h2> Personal Information </h3>
          <c:forEach var="error" items="${registerErrors}">
          <a style="color:red">${error}</a><br>
          </c:forEach>
		<form action="register.do" method="POST">
            <div class="row">
              <div class="col-5 form-group">
                <label for="firstName">First Name: </label>
                <input type="text" class="form-control" value="${c.firstname}" name="firstname" readonly>
              </div>

              <div class="col-5 form-group pull-right">
                <label>Last Name: </label>
                <input type="text" class="form-control" value="${c.lastname}" name="lastname" readonly>
              </div>

              <div class="col-5 form-group">
                <label>Address Line 1: </label>
                <input type="text" class="form-control" value="" name="addr1">
              </div>

              <div class="col-5 form-group pull-right">
                <label>Address Line 2(Optional): </label>
                <input type="text" class="form-control" value="" name="addr2">
              </div>

              <div class="col-5 form-group">
                <label>Zip Code: </label>
                <input type="text" class="form-control" value="" name="zipcode">
              </div>

              <div class="col-5 form-group pull-right">
                <label>City:</label>
                <input type="text" class="form-control" value="" name="city">
              </div>

              <div class="col-5 form-group">
                <label>State:</label>
                <input type="text" class="form-control" value="" name="state">
              </div>

              <div class="col-5 form-group pull-right">
                <label>Phone number:</label>
                <input type="text" class="form-control" value="" name="phoneNumber">
              </div>
              
              <div class="col-5 form-group">
                <label>Email address:</label>
                <input type="text" class="form-control" value="" name="email">
              </div>
              <p style="padding-left:20px;">(Your phone number and email address will be used for Two-faction authentication)</p>
            </div>
            <br> 

            <h2> Bank Details</h2>
            <div class="col-6 form-group row">
              <label>Card Number:</label>
              <input type="text" class="form-control" value="1234-5678-9876-6543" name="card_number" readonly>
            </div>

			<!--
            <div class="col-6 form-group row">
              <label>Bank Branch Address: </label>
              <input type="text" class="form-control" value="1234, Murray Avenue, PA, Pittsburgh" name="">
            </div>

            <div class="col-6 form-group row">
              <label>Routing Number:</label>
              <input type="text" class="form-control" size="20">
            </div>

            <div class="col-6 form-group row">
              <label>Swift Code:</label>
              <input type="text" class="form-control" size="20">
            </div>
            
            <br>
            
            <label>
              <strong>
                What accounts would you like to link?
                Check the boxes and enter account numbers.
              </strong>
            </label>


              <div class="form-control">
              
                <input type="checkbox">
                <label>Checking Account:</label>
                <input type="text" class="form-control" placeholder="xxxxxxxxxx">
                <br>
                <input type="checkbox">
                <label> Spend Account:</label>
                <input type="text" class="form-control" placeholder="xxxxxxxxxx">
            </div>-->

            <br>

            <h2>Set up credentials </h2>
            <div class="col-6 form-group row">
              <label>User ID:</label>
              <input type="text" class="form-control" value="<%=session.getAttribute("registerUser") %>" size="20" readonly>
            </div>

            <div class="col-6 form-group row">
              <label>Set a PIN:</label>
              <input type="password" class="form-control" size="20" name="password">
            </div>

            <div class="col-6 form-group row">
              <label>Confirm PIN:</label>
              <input type="password" size="20" class="form-control" name="confirm_password">
            </div>

            <br>

            <h2> Security Questions </h2>
              <div class="form-control">
                <label>Select the 1st security question:</label>
                <select class="form-control" name="security_question1">
                  <option>What is your nickname?</option>
                  <option>What is the name of your first pet?</option>
                  <option>What's your favorite food?</option>
                  <option>What was the name of your middle school best friend?</option>
                </select>

                <label>Your answer:</label>
                <input type="text" class="form-control" size="40" name="security_question1_answer"">
                
                <br>
                <label>Select the 2nd security question:</label>
                <select class="form-control" name="security_question2">
                  <option>Set a 5 digit PIN</option>
                  <option>Set an alphanumeric password</option>
                </select>

                <label>Your answer:</label>
                <input type="text" class="form-control" size="40" name="security_question2_answer">
              </div>

          <br>
          <!--<h2>Set up two factor Authentication</h2>
          <p>You could provide one/both of your phone number and email address</p>

            <div class='form-control'>
            <input type="checkbox">
            
            <label>Email address:</label>
            <input class="form-control" type="text" size="25">
            
            <br>
            
            <input type="checkbox">
            <label>Phone Number:</label>
            
            <input type="text" class="form-control" size="14">
            <br>            
            </div>
            <br>-->
            <input type="submit" style="font-size:110%;" class="btn btn-primary" name="submit">
         </form>
</body>
</html>