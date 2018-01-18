<%@page import="java.text.DecimalFormat"%>
<%
	String srcAcc = (String)request.getParameter("sourceAccount");
	System.out.println(srcAcc);
	String receiver = (String)request.getParameter("receiver");
	String destAcc = (String)request.getParameter("account");
	String amount = (String)request.getParameter("amount");
	
	String transAmount = new DecimalFormat("#,##0.00").format(Double.parseDouble(amount));
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
            <h2 class="dashhead-title">Internal Transfer</h2>
          </div>

          <div class="btn-toolbar dashhead-toolbar">
            <div class="btn-toolbar-item input-with-icon">
              <input type="text" value="01/01/15 - 01/08/15" class="form-control" data-provide="datepicker">
              <span class="icon icon-calendar"></span>
            </div>
          </div>
        </div>

        <form action="doConfirmTransfer.jsp" method="POST">
          <input type="hidden" name="destAcc" value="<%= destAcc %>">
          <input type="hidden" name="amount" value="<%= amount%>">
          <table>
            <tr>
              <td style="padding-top: 20px; padding-bottom: 20px;">Source account: </td>
              <td><%=srcAcc %></td>
            </tr>
            <tr >
              <td style="padding-top: 20px; padding-bottom: 20px;">Destination account: </td>
              <td><%=destAcc %></td>
            </tr>
            <tr>
              <td style="padding-top: 20px; padding-bottom: 20px;">Name of receiver: </td>
              <td><%=receiver %></td>

            </tr>
            <tr>
              <td style="padding-top: 20px; padding-bottom: 20px;">Amount: </td>
              <td>$ <%=transAmount %></td>
            </tr>
            <tr>
              <td style="padding-top: 20px; padding-bottom: 20px;">
                <a href="transfer.jsp"><input type="button" name="back" value="Go back to edit" class="btn btn-outline-primary px-3"></a>
                <input type="submit" name="submit" value="Submit Transfer Request" class="btn btn-outline-primary px-3">
              </td>
            </tr>
          </table>
        </form>

        <div id="docsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog">
            <div class="modal-content">

              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Example modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              </div>
              <div class="modal-body">
                <p>You're looking at an example modal in the dashboard theme.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cool, got it!</button>
              </div>
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