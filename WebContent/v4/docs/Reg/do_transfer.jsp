<%
	String srcAcc = (String)request.getParameter("srcAcc");
	String receiver = (String)request.getParameter("receiver");
	String destAcc = (String)request.getParameter("account");
	String amount = (String)request.getParameter("amount");
	
	session.setAttribute("account",destAcc);
	session.setAttribute("amount",amount);
	response.sendRedirect("check_balance.jsp");
%>