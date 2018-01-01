package controller;

import java.util.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.StringUtils;

import model.Transaction;
import model.TransactionDetails;
import service.CustomerService;
import service.ProductService;
import service.TransactionService;
import service.UserService;

/**
 * Servlet implementation class TransactionAddController
 */
@WebServlet("/user/transaction-add")
public class TransactionAddController extends HttpServlet {

	SimpleDateFormat sdf;

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransactionAddController() {
		super();
		sdf = new SimpleDateFormat("yyyy-MM-dd");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("customerList", new CustomerService().findAllCustomers());
		request.setAttribute("usernameList", new UserService().findAllUsername());
		request.setAttribute("productList", new ProductService().findAllProducts());
		HttpSession session = request.getSession();
		String btnSubmit = request.getParameter("btnSubmit");
		String consumeDate;
		String customerName;
		String username;
		Transaction transaction = null;
		List<TransactionDetails> transDetails = new ArrayList<>();

		if (session.getAttribute("transaction") == null) {
			consumeDate = request.getParameter("consumeDate") == null ? sdf.format(new Date())
					: request.getParameter("consumeDate");

			customerName = request.getParameter("customerName") == null ? null : request.getParameter("customerName");

			username = request.getParameter("username") == null ? null : request.getParameter("username");
			request.setAttribute("consumeDate", consumeDate);
			request.setAttribute("customerName", customerName);
			request.setAttribute("username", username);
		} else {
			transaction = (Transaction) session.getAttribute("transaction");
			consumeDate = sdf.format(transaction.getConsumeDate());
			username = transaction.getUsername();
			customerName = new CustomerService().getCustomerById(transaction.getCustomerId()).getCustomerName();
		}

		if (session.getAttribute("transDetails") != null) {
			transDetails = (List<TransactionDetails>) session.getAttribute("transDetails");
		}

		int partNumber = -1;
		if (request.getParameter("partNumber") != null) {
			partNumber = Integer.parseInt(request.getParameter("partNumber"));
		}
		// 4 conditions ( null, plus, minus, new , cancel )
		if (btnSubmit == null) {
			request.setAttribute("selectedProduct", new ProductService().findProduct(partNumber));
		} else if (btnSubmit.equals("plus")) {
			if (transaction == null) {
				transaction = new Transaction();
				transaction.setTransactionId(new TransactionService().getLastTransId() + 1);
				try {
					transaction.setConsumeDate(sdf.parse(consumeDate));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				transaction.setCustomerId(new CustomerService().findCustomerByName(customerName).getCustomerId());
				transaction.setUsername(username);
				transaction.setCustomer(new CustomerService().getCustomerById(transaction.getCustomerId()));
			}

			TransactionDetails td = new TransactionDetails();
			if (isPartNumberExist(transDetails, partNumber) != null) {
				td = isPartNumberExist(transDetails, partNumber);
				td.setQuantity(td.getQuantity() + Integer.parseInt(request.getParameter("quantity")));
			} else {
				td.setTransactionId(transaction.getTransactionId());
				td.setPartNumber(partNumber);
				td.setProduct(new ProductService().findProduct(partNumber));
				td.setQuantity(Integer.parseInt(request.getParameter("quantity")));
				transDetails.add(td);
			}
			session.setAttribute("transaction", transaction);
			session.setAttribute("transDetails", transDetails);
		} else if (btnSubmit.equals("new")) {
			TransactionService ts = new TransactionService();
			if (ts.createNewTransaction(transaction, transDetails)) {
				request.setAttribute("createNewSuccess", true);
			} else {
				request.setAttribute("createNewSuccess", false);
			}
			clearSession(session);
			request.getRequestDispatcher("/user/transaction-view").forward(request, response);
			return;
		} else if (StringUtils.isStrictlyNumeric(btnSubmit)) {
			int deletePartNumber = Integer.parseInt(btnSubmit);
			for (TransactionDetails td : transDetails) {
				if (td.getPartNumber() == deletePartNumber) {
					transDetails.remove(td);
					break;
				}
			}
			if (transDetails.size() > 0) {
				session.setAttribute("transDetails", transDetails);
			} else {
				clearSession(session);
			}

		} else if (btnSubmit.equals("cancel")) {
			clearSession(session);
		}
		request.getRequestDispatcher("/WEB-INF/transaction-add.jsp").forward(request, response);
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

	private TransactionDetails isPartNumberExist(List<TransactionDetails> transDetails, int partNumber) {
		for (TransactionDetails td : transDetails) {
			if (td.getPartNumber() == partNumber)
				return td;
		}
		return null;
	}

	private void clearSession(HttpSession session) {
		session.removeAttribute("transaction");
		session.removeAttribute("transDetails");
	}

}
