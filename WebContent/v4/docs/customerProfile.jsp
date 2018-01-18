<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="databean.CustomerCredential"%>
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
      
        Customer Profile
      
    </title>

    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
    <link href="./assets/css/toolkit-light.css" rel="stylesheet">
    <link href="./assets/css/application.css" rel="stylesheet">

    <style>
      /* note: this is a hack for ios iframe for bootstrap themes shopify page */
      /* this chunk of css is not part of the toolkit :) */
      body {
        width: 1px;
        min-width: 100%;
        *width: 100%;
      }

      .button-position {
        text-align: center;
        margin: 25px 0px;
      }
    </style>
  </head>


  <body>
    <div class="container">
      <div class="row">
		<jsp:include page="dashboard.jsp" />
		<!-- Customer Profile -->
        <div class="col-md-9 content">
          <!--Title-->
          <div class="dashhead">
            <div class="dashhead-titles">
              <h2 class="dashhead-title title-margin">Customer Profile</h2>
            </div>
          </div>
          <div class="hr-divider my-4">
            <ul class="nav nav-pills hr-divider-content hr-divider-nav" role="tablist">
<%			
	String buttonName = (String) request.getAttribute("buttonClicked");
	boolean isPersonalInfo = buttonName == null || buttonName.equals("Update Personal Information");
	boolean isSecurityInfo = (buttonName != null && (buttonName.equals("Update Security Information") || buttonName.equals("Submit")));
  	boolean isCommunicationInfo = buttonName != null && buttonName.equals("Update Communication Information");
%>
              <li class="nav-item" role="presentation">
    				<a href="#personal" class="nav-link <%=isPersonalInfo ? "active" : ""%>" role="tab" data-toggle="tab" aria-controls="personal">Personal Info</a>
	          </li>
              <li class="nav-item" role="presentation">
	    			<a href="#security" class="nav-link <%=isSecurityInfo ? "active" : ""%>" role="tab" data-toggle="tab" aria-controls="security">Security Info</a>
              </li>
              <li class="nav-item" role="presentation">
				<a href="#communication" class="nav-link <%=isCommunicationInfo ? "active" : ""%>" role="tab" data-toggle="tab" aria-controls="communication">Communication Info</a>         
              </li>
            </ul>
          </div>

          <!--Personal Info Tab-->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane <%=isPersonalInfo ? "active" : ""%>" id="personal">
              <!-- Action -->
              <form action="update_profile.do" method="POST">
                <h4>Basic Information</h4>
                <div class="form-control">
                  <div class="row" style="margin:10px;">
                    <div class="col-6 form-group">
                      <label for="firstName">First Name: </label>
                      <input type="text" id="firstName" class="form-control" value="${currentCustomerInfo.firstname}" name="firstName" readonly>
                    </div>

                    <div class="col-6 form-group">
                      <label>Last Name: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.lastname}"  name="lastName" readonly>
                    </div>

                    <div class="col-6 form-group">
                      <label>Email Address:</label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.email}" name="email">
                    </div>

                    <div class="col-6 form-group">
                      <label>Mobile Phone Number:</label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.mobile_phone}" name="mobile_phone">
                    </div>

                    <div class="col-12 form-group">
                      <label>Mailing Address: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.mailing_address}" name="mailing_address">
                    </div>
                  </div>
                </div>
                <br>

                <h4>Work Information</h4>
                <div class="form-control">
                  <div class="row" style="margin:10px;">
                    <div class="col-4 form-group">
                      <label>Occupation: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.occupation}" name="occupation">
                    </div>

                    <div class="col-4 form-group pull-right">
                      <label>Salary: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.income}" name="salary">
                    </div>

                    <div class="col-4 form-group pull-right">
                      <label>Work Phone Number: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.work_phone}" name="work_phone">
                    </div>

                    <div class="col-12 form-group pull-right">
                      <label>Work Address: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.work_address}" name="work_address">
                    </div>
                  </div>
                </div>
				 <c:forEach var="field" items="${personalForm.visibleFields}">
				 	<c:if test="${!(empty field.error)}">
                  	<p style="color:red; text-align:center;">${field.name}: ${field.error}</p>
                  	</c:if>
                  </c:forEach>
                <div class="button-position">
                  <input type="submit" class="btn btn-primary" value="Update Personal Information" name="submit">
                </div>
              </form>   
            </div>
            <!--Security-->
            <div role="tabpanel" class="tab-pane <%=isSecurityInfo ? "active" : ""%>" id="security">
              <!-- Action -->
              <form action="update_profile.do" method="POST">
                <h4>Basic Credentials</h4>
                <div class="form-control">
                  <div class="row" style="margin:10px;">
                    <div class="col-6 form-group">
                      <label>User ID: </label>
                      <input type="text" class="form-control" value="${currentCustomer.customer_id}" name="costomer_id" readonly>
                    </div>

                    <div class="col-6 form-group">
                      <label>Social Security Number: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.SSN}" name="sSN" readonly>
                    </div>

                    <div class="col-6 form-group">
                      <label>Driver License:</label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.driver_license}" name="driver_license">
                    </div>

                    <div class="col-6 form-group">
                      <label>Passport: </label>
                      <input type="text" class="form-control" value="${currentCustomerInfo.passport}" name="passport">
                    </div>
                  </div>
                </div> 
              <br>
<%
	CustomerCredential currentCustomer =
	(CustomerCredential) session.getAttribute("currentCustomer");
	String securityQ_1 = currentCustomer.getSecurity_question1();
    String securityQ_2 = currentCustomer.getSecurity_question2();
    boolean Sq1isq1 = securityQ_1.equals("What is your nickname?");
    boolean Sq1isq2 = securityQ_1.equals("What is the name of your first pet?");
    boolean Sq1isq3 = securityQ_1.equals("What's your favorite food?");
    boolean Sq1isq4 = securityQ_1.equals("What was the name of your middle school best friend?");
    
    boolean Sq2isq1 = securityQ_2.equals("What is your nickname?");
    boolean Sq2isq2 = securityQ_2.equals("What is the name of your first pet?");
    boolean Sq2isq3 = securityQ_2.equals("What's your favorite food?");
    boolean Sq2isq4 = securityQ_2.equals("What was the name of your middle school best friend?");
%>
              <h4>Security Questions</h4>
                <div class="form-control">
                  <div style="margin:20px;">
                    <label>1st security question:</label>                    
	                    <select class="form-control" onchange="this.form.submit()" name="securityQ_1">
	                      <option value="What is your nickname?" <%=Sq1isq1 ? "selected='selected'" : ""%>>What is your nickname?</option>
	                      <option value="What is the name of your first pet?" <%=Sq1isq2 ? "selected='selected'" : ""%>>What is the name of your first pet?</option>
	                      <option value="What's your favorite food?" <%=Sq1isq3 ? "selected='selected'" : ""%>>What's your favorite food?</option>
	                      <option value="What was the name of your middle school best friend?" <%=Sq1isq4 ? "selected='selected'" : ""%>>What was the name of your middle school best friend?</option>
	                    </select>
	                    <br>
                    <label>Your answer:</label>
                    <input type="text" class="form-control" size="40" name="securityA_1" value="${currentCustomer.security_question1_answer}">                  
                    <br>
	
	               <label>2nd security question:</label>
	                    <select class="form-control" onchange="this.form.submit()" name="securityQ_2">
	                      <option value="What is your nickname?" <%=Sq2isq1 ? "selected='selected'" : ""%>>What is your nickname?</option>
	                      <option value="What is the name of your first pet?" <%=Sq2isq2 ? "selected='selected'" : ""%>>What is the name of your first pet?</option>
	                      <option value="What's your favorite food?" <%=Sq2isq3 ? "selected='selected'" : ""%>>What's your favorite food?</option>
	                      <option value="What was the name of your middle school best friend?" <%=Sq2isq4 ? "selected='selected'" : ""%>>What was the name of your middle school best friend?</option>
	                    </select>
	                    <br>
	               <label>Your answer:</label>
	               <input type="text" class="form-control" size="40" name="securityA_2" value="${currentCustomer.security_question2_answer}">
					 
					    <c:forEach var="field" items="${securityForm.visibleFields}">
							<c:if test="${!(empty field.error)}">
		                  		<p style="color:red; text-align:center;">${field.name}: ${field.error}</p>
		                  	</c:if>
		                </c:forEach>
	                  
	                    <div class="button-position">
	                      <label></label>
	                      <input type="submit" class="btn btn-primary text-center" value="Update Security Information" name="submit">
	                    </div>            
                  	</div>
                	  </div>
                </form> 
               <br>
                
              <h4>Password</h4>
              <div class="form-control">
                <div class="row"  style="margin:10px;">
                  
                  <div class="col-6 form-group"> 
                    <label>Password: </label>               
                    <input type="password" class="form-control" value="${currentCustomer.password}" name="displayPwd" readonly>
                  </div>
                  <!--Add a modal for modify password-->
                  <div class="col-6 button-position">
                    <label></label>
                    <a href=#docsModal class="btn btn-primary text-center" data-toggle="modal">Change Password</a>
                  </div>
                </div>
                 <%--field errors--%>
                 <c:forEach var="field" items="${changePasswordForm.visibleFields}">
				 	<c:if test="${!(empty field.error)}">
                  	<p style="color:red; text-align:center;">${field.name}: ${field.error}</p>
                  	</c:if>
                  </c:forEach>
                  <%--form errors--%>
                  <c:forEach var="error" items="${changePasswordForm.formErrors}">
                  	<p style="color:red; text-align:center;">${error}</p>
                  </c:forEach>
              </div>
            </div>

			<%-- Communication Info --%>
            <div role="tabpanel" class="tab-pane <%=isCommunicationInfo ? "active" : ""%>" id="communication">
              <!-- Action -->
              <form action="update_profile.do" method="POST">
                  <h4>Preferred Contact Methods: </h4>
                  <div class="form-control">
                  <p>Current Contact Method is: ${currentCustomerInfo.preference_contact} </p>
                  	<div style="margin:15px;">                  	 
	                  <div class="form-group">
	                      <input id=radio value="Phone Call" name="preference_contact" type="radio" style="margin: 0px 15px;">
	                      <label for="radio">Phone Call</label>
	                  </div>
	
	                  <div class="form-group">
	                      <input id=radio1 value= "Email" name="preference_contact" type="radio" style="margin: 0px 15px;">
	                      <label for="radio1">Email</label>
	                  </div>
	
	                  <div class="form-group">
	                      <input id=radio2 value="Text Message" name="preference_contact" type="radio" style="margin: 0px 15px;">
	                      <label for="radio2">Text Message</label>
	                  </div>
	                  <div class="form-group">
	                      <input id=radio3 value="All" name="preference_contact" type="radio" style="margin: 0px 15px;">
	                      <label for="radio3">All</label>
	                  </div>
	                  
	                  	<c:forEach var="field" items="${communicationForm.visibleFields}">
							<c:if test="${!(empty field.error)}">
		                  		<p style="color:red; text-align:center;">${field.name}: ${field.error}</p>
		                  	</c:if>
		                </c:forEach>
		                
	                  <div class="button-position">
	                    <input type="submit" class="btn btn-primary" value="Update Communication Information" name="submit">
	                  </div>
	                </div>
                  </div>
              </form>  
            </div>
          </div><!--End of All Tabs-->

          <!--Modal-->
          <div id="docsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Change Password</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <form action="update_profile.do" method="POST">
                  <div class="modal-body">
                    <!--Modal Body!!!-->
                    <div class="col-6 form-group">
                      <label>New Password: </label>
                      <input type="password" class="form-control" name="newPassword" id="newPwd">
                    </div>

                    <div class="col-6 form-group">
                      <label>Confirm New Password:</label>
                      <input type="password" class="form-control" name="confirmNewPwd" id="confirmNewPwd" onkeyup="checkPwd(); return false;">
                      <br>
                      <span id="confirmMessage"></span>
                    </div>

                    <div class="col-12" style="font-size: 110%;">Please enter your current online banking password: </div><br>
                    <div class="col-6 form-group">
                      <label>Current Password:</label>
                      <input type="password" class="form-control" name="currentPwd">
                    </div>
                    <!---->
                  </div>
                  <div class="modal-footer">
                    <input type="submit" name="submit" class="btn btn-primary" value="Submit"/>
                  </div>
                </form>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
    <!--Validate password and confirm password-->
    <script>
      function checkPwd() {
        var newPwd = document.getElementById("newPwd");
        var confirmNewPwd = document.getElementById("confirmNewPwd");
        var confirmMessage = document.getElementById("confirmMessage");
        var validColor = "#66cc66";
        var invalidColor = "#E34234";
        if (newPwd.value != confirmNewPwd.value) {
          newPwd.style.borderColor = invalidColor;
          confirmNewPwd.style.borderColor = invalidColor;
          confirmMessage.style.color = invalidColor;
          confirmMessage.innerHTML = "Passwords Do Not Match!";
        } else {
          newPwd.style.borderColor = validColor;
          confirmNewPwd.style.borderColor = validColor;
          confirmMessage.style.color = validColor;
          confirmMessage.innerHTML = "Passwords Match!";
        }
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

