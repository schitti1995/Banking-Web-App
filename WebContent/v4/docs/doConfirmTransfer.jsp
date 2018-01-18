<%
	String srcAcc = (String)request.getParameter("srcAcc");
	String receiver = (String)request.getParameter("receiver");
	String destAcc = (String)request.getParameter("destAcc");
	String amount = (String)request.getParameter("amount");
	
	System.out.println(destAcc);
	System.out.println(amount);
	
	session.setAttribute("account",destAcc);
	session.setAttribute("amount",amount);
	response.sendRedirect("check_balance.jsp");
%>