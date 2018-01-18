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
    
      <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
    
    
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
      <div class="col-md-3 sidebar">
        <nav class="sidebar-nav">
          <div class="sidebar-header">
            <button class="nav-toggler nav-toggler-md sidebar-toggler" type="button" data-toggle="collapse" data-target="#nav-toggleable-md">
              <span class="sr-only">Toggle nav</span>
            </button>
            <a class="sidebar-brand img-responsive" href="index.html">
              <span class="icon icon-leaf sidebar-brand-icon"></span>
            </a>
          </div>

          <div class="collapse nav-toggleable-md" id="nav-toggleable-md">
            <form class="sidebar-form">
              <input class="form-control" type="text" placeholder="Search...">
              <button type="submit" class="btn-link">
                <span class="icon icon-magnifying-glass"></span>
              </button>
            </form>
            <ul class="nav nav-pills nav-stacked flex-column">
              <li class="nav-header">Dashboards</li>
              <li class="nav-item">
                <a class="nav-link active" href="index.html">Overview</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="order-history/index.html">Order history</a>
              </li>
              <li class="nav-item">
                <a class="nav-link "href="fluid/index.html">Fluid layout</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="icon-nav/index.html">Icon nav</a>
              </li>

              <li class="nav-header">More</li>
              <li class="nav-item">
                <a class="nav-link "href="docs/index.html">
                  Toolkit docs
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="http://getbootstrap.com" target="blank">
                  Bootstrap docs
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="index-light/index.html">Light UI</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#docsModal" data-toggle="modal">
                  Example modal
                </a>
              </li>
            </ul>
            <hr class="visible-xs mt-3">
          </div>
        </nav>
      </div>


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
<%
	String srcAcc = (String)request.getParameter("srcAcc");
	String receiver = (String)request.getParameter("receiver");
	String destAcc = (String)request.getParameter("account");
	String amount = (String)request.getParameter("amount");
	
	session.setAttribute("account",destAcc);
	session.setAttribute("amount",amount);
%>
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
      <td><%=amount %></td>     
    </tr>
    <tr>
      <td style="padding-top: 20px; padding-bottom: 20px;">
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