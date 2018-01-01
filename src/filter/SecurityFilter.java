package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SecurityFilter
 */
@WebFilter(urlPatterns={"/*"})
public class SecurityFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SecurityFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpSession session = ((HttpServletRequest) request).getSession();
		
		String username = (String) session.getAttribute("userSession");
		String role = (String) session.getAttribute("userRole");
		
		int auth = 0;
		if (username != null && role != null) {
			if(role.equals("admin")) {
				auth = 2;
			} else {
				auth = 1;
			}
		}
		
		String path = ((HttpServletRequest) request).getServletPath();
		int access = 0;
		if(path.startsWith("/user/")) {
			access = 1;
		}
		if(path.startsWith("/admin/")) {
			access = 2;
		}
		
		if(auth<access) {
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/error");
			return;
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
