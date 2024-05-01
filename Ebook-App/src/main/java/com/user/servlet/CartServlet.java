package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int itemid = Integer.parseInt(req.getParameter("itemid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDetails b = dao.getBookById(itemid);
			
			Cart c = new Cart();
			c.setItemid(itemid);
			c.setUserId(uid);
			c.setItemname(b.getItemname());
			c.setItemtypename(b.getItemtypename());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if (f)
			{
				session.setAttribute("addCart", "Item Added to Cart");
				resp.sendRedirect("all_new_book.jsp");
			}
			else
			{
				session.setAttribute("failed", "Something went wrong on server");
				resp.sendRedirect("all_new_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
}
