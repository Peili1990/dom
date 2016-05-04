package org.nv.dom.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nv.dom.cache.CacheData;

public class InitDataFilter extends HttpServlet implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String url = request.getScheme() + "://" + request.getServerName();
		int port = request.getServerPort();
		if (port == 80) {
			url += request.getContextPath();
		} else {
			url += ":" + request.getServerPort() + request.getContextPath();
		}
		if (!CacheData.getBaseUrl().equals(url)) {
			CacheData.setBaseUrl(url.concat("/"));
		}
		String basePath = request.getSession().getServletContext().getRealPath("/");
		if (!CacheData.getBasePath().equals(basePath)) {
			CacheData.setBasePath(basePath);
		}
		chain.doFilter(request, response);

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
