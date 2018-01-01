package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import service.ProductService;

/**
 * Servlet implementation class ProductEditController
 */
@WebServlet("/admin/product-edit")
public class ProductEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductEditController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("partNumber") != null) {
			int partNumber = Integer.parseInt(request.getParameter("partNumber"));
			request.setAttribute("product", new ProductService().findProduct(partNumber));
		}
		request.getRequestDispatcher("/WEB-INF/product-edit.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int partNumber = Integer.parseInt(request.getParameter("partNumber"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
		if (new ProductService().editProduct(partNumber, stock, unitPrice)) {
			request.setAttribute("editSuccess", true);
		} else {
			request.setAttribute("editSuccess", false);
		}
		request.setAttribute("partNumber", partNumber);
		request.getRequestDispatcher("/user/product-catalog").forward(request, response);
		return;
	}

}
