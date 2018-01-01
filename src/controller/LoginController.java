package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        us = new UserService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(us.loginUser(username, password)) {
			request.getSession().setAttribute("userSession", username);
			request.getSession().setAttribute("userRole", us.getRole(username));
			response.sendRedirect(request.getContextPath() + "/user/product-catalog");
			return;
		} else {
			request.setAttribute("loginFail", true);
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			return;
		}
		
		
	}

}
