package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String itemname = req.getParameter("bname");
			String itemtypename = req.getParameter("itemtypename");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			BookDetails b=new BookDetails();
			
			b.setItemid(id);
			b.setItemname(itemname);
			b.setItemtypename(itemtypename);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				
				session.setAttribute("succMsg","item updated successfully...");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
			
				session.setAttribute("failedMsg","Something Wrong on server...");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
