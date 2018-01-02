package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;
import service.ProductService;

/**
 * Servlet implementation class CatalogController
 */
@WebServlet("/user/product-catalog")
public class ProductCatalogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int countPerPage = 6;
	private static final int maxPages = 3;

	private int pageCount;
	private int currentPage;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductCatalogController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> productList = new ProductService().findAllProducts();

		int totalPages = productList.size() / countPerPage;
		if (productList.size() % countPerPage != 0) {
			totalPages += 1;
		}
		int currentPage = 0;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if (currentPage > totalPages) {
			request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
			return;
		}

		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("maxPages", maxPages);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("/WEB-INF/product-catalog.jsp").forward(request, response);
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
