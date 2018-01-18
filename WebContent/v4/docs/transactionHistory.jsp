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
              <h2 class="dashhead-title title-margin">Transaction History</h2>
            </div>
          </div>

          <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-primary">
              <input type="radio" name="options" id="oneWeek" autocomplete="off" value="One Week"> One Week
            </label>
            <label class="btn btn-primary">
              <input type="radio" name="options" id="oneMonth" autocomplete="off" value="One Month"> One Month
            </label>
            <label class="btn btn-primary active">
              <input type="radio" name="options" id="threeMonths" checked autocomplete="off" value="Three Months">Three Months
            </label>
            <label class="btn btn-primary">
              <input type="radio" name="options" id="oneYear" autocomplete="off" value="One Year"> One Year
            </label>
            <label class="btn btn-primary">
              <input type="radio" name="options" id="threeYears" autocomplete="off" value="Three Years"> Three Years
            </label>
          </div>

          <div class="table-responsive" id="transactionTableInOneWeek">
            <table class="table" data-sort="table">
              <thead>
                <tr>
                  <th><input type="checkbox" class="select-all" id="selectAll"></th>
                  <th>Transfer Date</th>
                  <th>ID</th>
                  <th>Account</th>
                  <th>Description</th>
                  <th>Category</th>
                  <th>Amount</th>
                   <th>Status</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="transaction" items="${transactionsInOneWeek}">
                <tr>
                <%-- Date --%>
                  <td><input type="checkbox" class="select-row"></td>
                  <c:set var="splitedDate" value="${fn:split(transaction.date, ' ')}" />
                  <td>${splitedDate[0]}</td>
                  <%-- ID --%>
                  <td>
                      <form id="my_form" method="post" action="explore_transactions.do">
                          <input type="hidden" name="transactionId" value="${transaction.transaction_id}">
                          <a href="javascript:{}" data-target="#detailModal" onclick="document.getElementById('my_form').submit();">${fn:substring(transaction.transaction_id, 9, -1)}</a>
                      </form>
                  </td>
                  <!-- Source Account -->
                  <c:choose>
	                  <c:when test="${transaction.account_no eq checkingAccount.account_no}">
	                  	<td>Checking</td>
	                  </c:when>
	                  <c:when test="${transaction.account_no eq savingAccount.account_no}">
	                  	<td>Saving</td>
	                  </c:when>
	                  <c:when test="${!(empty transaction.account_no)}">
                  		<td>xxxxxx${fn:substring(transaction.src_account_no, 6, -1)}</td>
                      </c:when>
	                  <c:otherwise>
	                  	<td>${transaction.account_no}</td>
	                  </c:otherwise>
                  </c:choose>

                  <!-- Description -->
                  <c:set var="splitedDescription" value="${fn:split(transaction.description, ' ')}" />
                  <c:choose>
	                  <c:when test="${splitedDescription[2] eq checkingAccount.account_no}">
	                  	<td>${splitedDescription[0]} ${splitedDescription[1]} Checking</td>
	                  </c:when>
	                  <c:when test="${splitedDescription[2] eq savingAccount.account_no}">
	                  	<td>${splitedDescription[0]} ${splitedDescription[1]} Saving</td>
	                  </c:when>
	                  <c:when test="${!(empty splitedDescription[2])}">
                  		<td>${splitedDescription[0]} ${splitedDescription[1]} xxxxxx${fn:substring(splitedDescription[2], 6, -1)}</td>
                      </c:when>
	                  <c:otherwise>
	                  	<td></td>
	                  </c:otherwise>
                  </c:choose>
                  <td>${transaction.category}</td>
                  <td>${transaction.amount_change}</td>
                  <td>${transaction.status}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        <!--The table-->
          <div class="table-responsive" id="transactionTableInOneMonth">
            <table class="table" data-sort="table">
              <thead>
                <tr>
                  <th><input type="checkbox" class="select-all" id="selectAll"></th>
                  <th>Transfer Date</th>
                  <th>ID</th>
                  <th>Account</th>
                  <th>Description</th>
                  <th>Category</th>                  
                  <th>Amount</th>
                   <th>Status</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="transaction" items="${transactionsInOneMonth}">
                <tr>
                <%-- Date --%>
                  <td><input type="checkbox" class="select-row"></td>
                  <c:set var="splitedDate" value="${fn:split(transaction.date, ' ')}" />
                  <td>${splitedDate[0]}</td>
                  <%-- ID --%>
                  <td>
                  <%--Redirect to another .jsp page --%>
                      <form id="my_form" method="post" action="explore_transactions.do">
                          <input type="hidden" name="transactionId" value="${transaction.transaction_id}">
                          <a href="javascript:{}" data-target="#detailModal" onclick="document.getElementById('my_form').submit();">${fn:substring(transaction.transaction_id, 9, -1)}</a>
                      </form>

		        	<%--Try to use modal --%>
<%--         			 <c:choose>
	        			 <c:when test="${!(empty transactionId)}">
	        			 	<a data-toggle="modal" data-target="#detailModal">
	        			 	   ${fn:substring(transaction.transaction_id, 9, -1)}
	                    </a>
	        			 </c:when>
	        			 <c:otherwise>
		        			 <form id="my_form" method="post" action="explore_transactions.do">
		                  	<input type="hidden" name="transactionId" value="${transaction.transaction_id}">
		            			<a href="javascript:{}" data-toggle="modal" data-target="#detailModal" onclick="document.getElementById('my_form').submit();">${fn:substring(transaction.transaction_id, 9, -1)}</a>
		        			 </form>
	        			 </c:otherwise>
        			 </c:choose> --%>
        			 
<%--                     <a href="#" onclick="$('#detailModal').modal({'backdrop': 'static'});">
                    <a data-toggle="modal" data-id="${transaction.transaction_id}" data-target="#detailModal">
                    	  <!--Only display last 4 digit-->
                      ${fn:substring(transaction.transaction_id, 9, -1)}
                    </a> --%>
                  </td>
                  <!-- Source Account -->
                  <c:choose>
	                  <c:when test="${transaction.account_no eq checkingAccount.account_no}">
	                  	<td>Checking</td>
	                  </c:when>
	                  <c:when test="${transaction.account_no eq savingAccount.account_no}">
	                  	<td>Saving</td>
	                  </c:when>
	                  <c:when test="${!(empty transaction.account_no)}">
                  		<td>xxxxxx${fn:substring(transaction.src_account_no, 6, -1)}</td>
                      </c:when>
	                  <c:otherwise>
	                  	<td>${transaction.account_no}</td>
	                  </c:otherwise>
                  </c:choose>

                  <!-- Description -->
                  <c:set var="splitedDescription" value="${fn:split(transaction.description, ' ')}" />
                  <c:choose>
	                  <c:when test="${splitedDescription[2] eq checkingAccount.account_no}">
	                  	<td>${splitedDescription[0]} ${splitedDescription[1]} Checking</td>
	                  </c:when>
	                  <c:when test="${splitedDescription[2] eq savingAccount.account_no}">
	                  	<td>${splitedDescription[0]} ${splitedDescription[1]} Saving</td>
	                  </c:when>
	                  <c:when test="${!(empty splitedDescription[2])}">
                  		<td>${splitedDescription[0]} ${splitedDescription[1]} xxxxxx${fn:substring(splitedDescription[2], 6, -1)}</td>
                      </c:when>
	                  <c:otherwise>
	                  	<td></td>
	                  </c:otherwise>
                  </c:choose>
                  <td>${transaction.category}</td>                  
                  <td>${transaction.amount_change}</td>
                  <td>${transaction.status}</td>
                </tr> 		        
              </c:forEach>
              </tbody>
            </table>
          </div>

          <div class="table-responsive" id="transactionTableInThreeMonth">
            <table class="table" data-sort="table">
              <thead>
              <tr>
                <th><input type="checkbox" class="select-all" id="selectAll"></th>
                <th>Transfer Date</th>
                <th>ID</th>
                <th>Account</th>
                <th>Description</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Status</th>
              </tr>
              </thead>

              <tbody>
              <c:forEach var="transaction" items="${transactionsInThreeMonths}">
                <tr>
                    <%-- Date --%>
                  <td><input type="checkbox" class="select-row"></td>
                  <c:set var="splitedDate" value="${fn:split(transaction.date, ' ')}" />
                  <td>${splitedDate[0]}</td>
                    <%-- ID --%>
                    <td>
                        <form id="my_form" method="post" action="explore_transactions.do">
                            <input type="hidden" name="transactionId" value="${transaction.transaction_id}">
                            <a href="javascript:{}" data-toggle="modal" onclick="document.getElementById('my_form').submit();">${fn:substring(transaction.transaction_id, 9, -1)}</a>
                        </form>
                    </td>
                  <!-- Source Account -->
                  <c:choose>
                    <c:when test="${transaction.account_no eq checkingAccount.account_no}">
                      <td>Checking</td>
                    </c:when>
                    <c:when test="${transaction.account_no eq savingAccount.account_no}">
                      <td>Saving</td>
                    </c:when>
                    <c:when test="${!(empty transaction.account_no)}">
                      <td>xxxxxx${fn:substring(transaction.src_account_no, 6, -1)}</td>
                    </c:when>
                    <c:otherwise>
                      <td>${transaction.account_no}</td>
                    </c:otherwise>
                  </c:choose>

                  <!-- Description -->
                  <c:set var="splitedDescription" value="${fn:split(transaction.description, ' ')}" />
                  <c:choose>
                    <c:when test="${splitedDescription[2] eq checkingAccount.account_no}">
                      <td>${splitedDescription[0]} ${splitedDescription[1]} Checking</td>
                    </c:when>
                    <c:when test="${splitedDescription[2] eq savingAccount.account_no}">
                      <td>${splitedDescription[0]} ${splitedDescription[1]} Saving</td>
                    </c:when>
                    <c:when test="${!(empty splitedDescription[2])}">
                      <td>${splitedDescription[0]} ${splitedDescription[1]} xxxxxx${fn:substring(splitedDescription[2], 6, -1)}</td>
                    </c:when>
                    <c:otherwise>
                      <td></td>
                    </c:otherwise>
                  </c:choose>
                  <td>${transaction.category}</td>
                  <td>${transaction.amount_change}</td>
                  <td>${transaction.status}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>

          <div class="table-responsive" id="transactionTableInOneYear">
            <table class="table" data-sort="table">
              <thead>
              <tr>
                <th><input type="checkbox" class="select-all" id="selectAll"></th>
                <th>Transfer Date</th>
                <th>ID</th>
                <th>Account</th>
                <th>Description</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Status</th>
              </tr>
              </thead>

              <tbody>
              <c:forEach var="transaction" items="${transactionsInOneYear}">
                <tr>
                    <%-- Date --%>
                  <td><input type="checkbox" class="select-row"></td>
                  <c:set var="splitedDate" value="${fn:split(transaction.date, ' ')}" />
                  <td>${splitedDate[0]}</td>
                    <%-- ID --%>
                    <td>
                        <form id="my_form" method="post" action="explore_transactions.do">
                            <input type="hidden" name="transactionId" value="${transaction.transaction_id}">
                            <a href="javascript:{}" onclick="document.getElementById('my_form').submit();">${fn:substring(transaction.transaction_id, 9, -1)}</a>
                        </form>
                    </td>
                  <!-- Source Account -->
                  <c:choose>
                    <c:when test="${transaction.account_no eq checkingAccount.account_no}">
                      <td>Checking</td>
                    </c:when>
                    <c:when test="${transaction.account_no eq savingAccount.account_no}">
                      <td>Saving</td>
                    </c:when>
                    <c:when test="${!(empty transaction.account_no)}">
                      <td>xxxxxx${fn:substring(transaction.src_account_no, 6, -1)}</td>
                    </c:when>
                    <c:otherwise>
                      <td>${transaction.account_no}</td>
                    </c:otherwise>
                  </c:choose>

                  <!-- Description -->
                  <c:set var="splitedDescription" value="${fn:split(transaction.description, ' ')}" />
                  <c:choose>
                    <c:when test="${splitedDescription[2] eq checkingAccount.account_no}">
                      <td>${splitedDescription[0]} ${splitedDescription[1]} Checking</td>
                    </c:when>
                    <c:when test="${splitedDescription[2] eq savingAccount.account_no}">
                      <td>${splitedDescription[0]} ${splitedDescription[1]} Saving</td>
                    </c:when>
                    <c:when test="${!(empty splitedDescription[2])}">
                      <td>${splitedDescription[0]} ${splitedDescription[1]} xxxxxx${fn:substring(splitedDescription[2], 6, -1)}</td>
                    </c:when>
                    <c:otherwise>
                      <td></td>
                    </c:otherwise>
                  </c:choose>
                  <td>${transaction.category}</td>
                  <td>${transaction.amount_change}</td>
                  <td>${transaction.status}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>

          <div class="dispute-transaction">
            <button type="button" class="btn btn-primary">Print Selected Transactions</button>
          </div>
          <div style="clear: both;"></div>

        <!--Pagers-->
        <div class="centerred-pager">
          <nav>
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                  <span class="sr-only">Previous</span>
                </a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                  <span class="sr-only">Next</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
       		 <%--Modal --%>
        			<div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			      <div class="modal-dialog"> 
			        <div class="modal-content">
			
			          <div class="modal-header">
			            <h4 class="modal-title" id="myModalLabel">Transaction</h4>
			            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			          </div>
			          <div class="modal-body edit-content">
			          <input type="hidden" id="id">
 			            <table class="table table-hover">
						  <tbody>
						    <tr>
						      <th scope="row">Date</th>
						      <td id="modal-date"></td>
						    </tr>
						    <tr>
						      <th scope="row">Transaction ID</th>
						      <td>Jacob</td>
						    </tr>
						    <tr>
						      <th scope="row">Account</th>
						      <td>Jacob</td>
						    </tr>
						    	<tr>
						      <th scope="row">Description</th>
						      <td>Jacob</td>
						    </tr>
						    <tr>
						      <th scope="row">Category</th>
						      <td>Jacob</td>
						    </tr>
						    	<tr>
						      <th scope="row">Amount</th>
						      <td>Jacob</td>
						    </tr>
						  </tbody>
						</table>
			          </div>
			          <div class="modal-footer">
			            <button type="submit" class="btn btn-primary" data-dismiss="modal">Print</button>
			          </div>
			        </div>
			      </div>
			    </div>
			    <%--Modal End --%>
      </div>
    </div>
  </div>

    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/tether.min.js"></script>
    <script src="./assets/js/chart.js"></script>
    <script src="./assets/js/tablesorter.min.js"></script>
    <script src="./assets/js/toolkit.js"></script>
    <script src="./assets/js/application.js"></script>
    <script>
      // execute/clear BS loaders for docs
      $(function() {
          while (window.BS && window.BS.loader && window.BS.loader.length) {
              (window.BS.loader.pop())()
          }

          $(".table-responsive").css("display", "none");
          $("#transactionTableInThreeMonth").css("display", "initial");

          $("#oneWeek").change(function() {
              if ($("#oneWeek").is(":checked")) {
                  $(".table-responsive").css("display", "none");
                  $("#transactionTableInOneWeek").css("display", "initial");
              }
          });

          $("#oneMonth").change(function() {
              if ($("#oneMonth").is(":checked")) {
                  $(".table-responsive").css("display", "none");
                  $("#transactionTableInOneMonth").css("display", "initial");
              }
          });

          $("#threeMonths").change(function() {
              if ($("#threeMonths").is(":checked")) {
                  $(".table-responsive").css("display", "none");
                  $("#transactionTableInThreeMonth").css("display", "initial");
              }
          });

          $("#oneYear").change(function() {
              if ($("#oneYear").is(":checked")) {
                  $(".table-responsive").css("display", "none");
                  $("#transactionTableInOneYear").css("display", "initial");
              }
          });
      });
    </script>
    </div>
  </body>
</html>