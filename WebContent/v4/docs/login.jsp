<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <link href="assets/css/toolkit-light.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">

        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                padding: 0;
            }

            ::-webkit-input-placeholder {
                font-size: 13px!important;
            }

            :-moz-placeholder { /* Firefox 18- */
                font-size: 13px!important;
            }
            ::-moz-placeholder {  /* Firefox 19+ */
                font-size: 13px!important;
            }

            #inputPassword, #inputEmail {
                padding-left: 13px;
            }
          </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div id="left_column" class="col-md-12 col-lg-4" align="center">
                    <div style="margin-left: 28px;">
                        <img src="logo.png" style="width: 230px; float: left;" alt="">
                    </div>

                    <div id="login" align="left">
                        <form action="login.do" method="POST">
                            <div class="col-10 input-group input-group-lg">
                                <input type="text" class="form-control" id="inputEmail" placeholder="User ID" name="customer_id">
                            </div>
                            <br>
                            <div class="col-10 input-group input-group-lg">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">
                            </div>
                            <br>

                            <div style="height: 40px; display: table; width: 100%;" class="col-10">
                            <a style="vertical-align: middle; display: table-cell;" href="#">Forget My Password</a>
                            <button style="float: right; font-size: 13px;" type="submit" class="btn btn-primary btn-lg">Submit</button>
                            </div>
                        </form>
                    </div>
                    <a class="col-lg-4 fixed-bottom" style="bottom: 50px;" href="Registration.jsp">
                        Just got your PIN? Click here for registration!
                    </a>

                    <br>
                    <c:if test="${not empty errors}">
                        <c:forEach items="${errors}" var="error">
                            <div class="alert alert-danger col-10" role="alert">
                                <c:out value="${error}" />
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div id="right_column" class="col-lg-8 hidden-md-down">
                    <img style="height: 100vh; max-width: 100%; float: right;" src="login_bg.jpg" alt="login_bg">
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    </body>
</html>