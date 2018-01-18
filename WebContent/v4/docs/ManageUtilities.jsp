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

    Manage Payments

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
    <div class="dashhead">
      <div class="dashhead-titles">
        <h2 class="dashhead-title">Manage your utilites</h2>
      </div>
        </div>

          <div class="message">
          <br>
            <p>Please choose an option in the bill pay section below.</p>
            <hr>
          </div>

        <br>

    <div class="options" style="font-size:125%">
      <li><a href="paybill.do">Pay Loans</a></li>
      <li><a href="deletepayee.do">Manage Payees</a></li>
      <li><a href="addpayee.do">Add payee</a></li>
      <li><a href="paypayee.do">Pay Utilities</a></li>
      <li><a href="Utility_history.jsp">Show utility transaction history</a></li>
    </div>
</div>
	
    </div></div>