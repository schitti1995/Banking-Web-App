<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      
        Transaction history
      
    </title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
    <link href="./assets/css/toolkit-light.css" rel="stylesheet">
    <link href="./assets/css/application.css" rel="stylesheet">
    <link href="./assets/css/transaction-history.css" rel="stylesheet">

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
          <!--Title-->
          <div class="dashhead">
            <div class="dashhead-titles">
              <h2 class="dashhead-title title-margin">Transaction Details</h2>
            </div>
          </div>          
       		 <%--Table--%>
       		 <div>
	            <table class="table table-hover">
			  	<tbody>
				    <tr>
				      <th scope="row">Date</th>
				      <td>${detailsTransaction.date}</td>
				    </tr>
				    <tr>
				      <th scope="row">Transaction ID</th>
				      <td>${detailsTransaction.transaction_id}</td>
				    </tr>
				    <tr>
				      <th scope="row">Account</th>
				      <td>${detailsTransaction.account_no}</td>
				    </tr>
				    	<tr>
				      <th scope="row">Description</th>
				      <td>${detailsTransaction.description}</td>
				    </tr>
				    <tr>
				      <th scope="row">Category</th>
				      <td>${detailsTransaction.category}</td>
				    </tr>
				    	<tr>
				      <th scope="row">Amount</th>
				      <td>${detailsTransaction.amount_change}</td>
				    </tr>
				    <tr>
				      <th scope="row">Status</th>
				      <td>${detailsTransaction.status}</td>
				    </tr>
			  	</tbody>
				</table>
          	</div>
          <%--Table End --%>
          <div class="modal-footer">
            <button onclick="myFunction()" class="btn btn-primary" data-dismiss="modal">Print</button>
          </div>
			    
      </div>
    </div>
  </div>
  
  <script>
	function myFunction() {
	    window.print();
	}
  </script>

    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/tether.min.js"></script>
    <script src="./assets/js/chart.js"></script>
    <script src="./assets/js/tablesorter.min.js"></script>
    <script src="./assets/js/toolkit.js"></script>
    <script src="./assets/js/application.js"></script>
    <script>
      // execute/clear BS loaders for docs
      $(function(){while(window.BS&&window.BS.loader&&window.BS.loader.length){(window.BS.loader.pop())()}})
    </script>
  </body>
</html>