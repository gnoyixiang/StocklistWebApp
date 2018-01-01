package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import model.Transaction;
import service.ProductService;
import service.TransactionService;

/**
 * Servlet implementation class TransactionDetailController
 */
@WebServlet("/user/transaction-detail")
public class TransactionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransactionDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("index") != null) {
			TransactionService tService = new TransactionService();
			int index = Integer.parseInt(request.getParameter("index"));
			Transaction t = tService.findTransByIndex(index);
			request.setAttribute("transaction", t);
			request.setAttribute("tdList", tService.findTransDetails(t));
			request.setAttribute("count", tService.findAllTrans().size());
			request.setAttribute("index", index);
		}
		request.getRequestDispatcher("/WEB-INF/transaction-detail.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
