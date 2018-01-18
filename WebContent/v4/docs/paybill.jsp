
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="databean.*" %>
<%@ page import="formbean.BillPayForm" %>
<%
    Account checkingAcc = new Account();
    if (session.getAttribute("checkingAccount") != null) {
        checkingAcc = (Account)session.getAttribute("checkingAccount");
    }

    Account savingAcc = new Account();
    if (session.getAttribute("savingAccount") != null) {
        savingAcc = (Account)session.getAttribute("savingAccount");
    }

    Bill student_loan = new Bill();
    Bill auto_loan = new Bill();
    if (session.getAttribute("studentLoan") != null) {
        student_loan = (Bill)session.getAttribute("studentLoan");
    }

    if (session.getAttribute("autoLoan") != null) {
        auto_loan = (Bill)session.getAttribute("autoLoan");
    }

    String[] errorMessages = new String[0];
    if (request.getAttribute("form") != null) {
        errorMessages = ((BillPayForm)request.getAttribute("form")).getFormErrors();
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
                    <h2 class="dashhead-title">Online Bill pay </h2>
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
            <form action="paybill.do" method="POST">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu">
                        <td class="image">Pay To</td>
                        <td class="price">Pay From</td>
                        <td class="quantity">Amount</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cart_product" >
                            <select class="form-control col-12" name="description">
                                <option value="StudentLoan"> Student Loan </option>
                                <option value="AutoLoan">Auto Loan</option>
                            </select>

                        </td>
                        <td class="cart_description">
                            <select class="form-control col-12" name="srcAcc">
                                <option value="<%=checkingAcc.getAccount_no()%>">Checking Account <%=checkingAcc.getAccount_no()%></option>
                                <option value="<%=savingAcc.getAccount_no()%>">Saving Account   <%=savingAcc.getAccount_no()%></option>
                            </select>
                        </td>
                        <td class="cart_price">
                            <input class="form-control col-8" type="text" name="amount" value="">
                        </td>


                        <td class="cart_delete">
                            <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                        </td>
                    </tr>

                    </tbody>
                </table>
                <input type="submit" name="action" value="Make payment" class="btn btn-outline-primary px-3" style ="margin-left:450px;">
            </form>
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
