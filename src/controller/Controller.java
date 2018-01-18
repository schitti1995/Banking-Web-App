package controller;

import model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@MultipartConfig
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		System.out.println("Initttttttttttttttttttttttttttttttttt");
		Model model = new Model(getServletConfig());

		Action.add(new InitialVerifAction(model));
		Action.add(new RegisterAction(model));
		Action.add(new LoginAction(model));
		Action.add(new LogoutAction(model));
		Action.add(new CheckBalanceAction(model));
		Action.add(new TransferAction(model));
		Action.add(new DepositAction(model));
		Action.add(new UpdateCustomerProfileAction(model));
		Action.add(new ExploreTransactionsAction(model));
		Action.add(new BillPayAction(model));
		Action.add(new BillAction(model));
        Action.add(new PayPayeeAction(model));
        Action.add(new AddPayeeAction(model));
        Action.add(new DeletePayeeAction(model));
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Perform post.");
		String nextPage = performTheAction(request);
		sendToNextPage(nextPage, request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Perform get.");
		String nextPage = performTheAction(request);
		sendToNextPage(nextPage, request, response);
	}

	private String performTheAction(HttpServletRequest request) {
		System.out.println("Perform action.");

		HttpSession session = request.getSession(true);
		String servletPath = request.getServletPath();
		String action = getActionName(servletPath);

		if (session.getAttribute("currentCustomer") != null) {
			if (action.endsWith(".jsp"))
				return Action.perform("check_balance.do", request);
			else if (action.endsWith(".do"))
				return Action.perform(action, request);
		}

		if (session.getAttribute("currentCustomer") == null) {
			if (action.equals("register.do")) {
				return Action.perform(action, request);
			}

			if (action.equals("initialVerif.do")) {
				return Action.perform(action, request);
			}

			if (action.equals("login.do")) {
				return Action.perform(action, request);
			}

			if (action.equals("deposit.do")) {
				return Action.perform(action, request);
			}

			return "illegal-operation.jsp";
		}

		return "illegal-operation.jsp";
	}

	private void sendToNextPage(String nextPage, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (nextPage == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, request.getServletPath());
			return;
		}

		if (nextPage.endsWith(".do")) {
			response.sendRedirect(nextPage);
			return;
		}

		if (nextPage.endsWith(".jsp")) {
			RequestDispatcher d = request.getRequestDispatcher(nextPage);
			d.forward(request, response);
			return;
		}

		throw new ServletException(
				Controller.class.getName() + ".sendToNextPage(\"" + nextPage + "\"): invalid extension.");
	}

	private String getActionName(String path) {
		int slash = path.lastIndexOf('/');
		return path.substring(slash + 1);
	}
}
