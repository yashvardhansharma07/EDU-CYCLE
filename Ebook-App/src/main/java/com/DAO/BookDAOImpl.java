package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetails b) {
		boolean f = false;
		try {
			String sql = "insert into item_details(itemname,itemtypename,price,itemcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getItemname());
			ps.setString(2, b.getItemtypename());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getItemcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDetails> getAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from item_details";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public BookDetails getBookById(int id) {

		BookDetails b = null;
		try {
			String sql = "select * from item_details where itemid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateEditBooks(BookDetails b) {
		boolean f = false;
		try {
			String sql = "update item_details set itemname=?,itemtypename=?,price=?,status=? where itemid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getItemname());
			ps.setString(2, b.getItemtypename());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getItemid());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from item_details where itemid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getNewBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from item_details where itemCategory=? and status=? order by itemid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getRecentBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from item_details where status=? order by itemid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from item_details where itemCategory=? and status=? order by itemid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "OLd");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from item_details where status=? order by itemid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from item_details where itemCategory=? and status=? order by itemid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from item_details where itemCategory=? and status=? order by itemid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "OLd");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {

				b = new BookDetails();
				b.setItemid(rs.getInt(1));
				b.setItemname(rs.getString(2));
				b.setItemtypename(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItemcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails c = null;
		try {
			String sql = "select * from item_details  where itemname like ? or itemtypename like ? or itemCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			

			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				c = new BookDetails();
				c.setItemid(rs.getInt(1));
				c.setItemname(rs.getString(2));
				c.setItemtypename(rs.getString(3));
				c.setPrice(rs.getString(4));
				
				c.setItemcategory(rs.getString(5));

				c.setStatus(rs.getString(6));
				c.setPhoto(rs.getString(7));
				c.setEmail(rs.getString(8));
				list.add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	

}
