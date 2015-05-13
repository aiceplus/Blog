package com.aice.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.aice.model.Blog;
import com.aice.model.Sort;
import com.aice.model.User;

public class DBConn {
	private static String USER = "aice";
	private static String PSW = "000000";
	private static String URL = "jdbc:mysql://localhost:3306/blog";
	private static String DRIVER = "com.mysql.jdbc.Driver";
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	public static User user;
	public static Sort sort;
	public static int id;

	// get conn connection
	public static Connection getConn() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PSW);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	// insert new user
	public static int insertUser(String sql) {
		int result = 0;
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getNiname());
			pstmt.setString(3, user.getPsw());
			pstmt.setInt(4, user.getAge());
			pstmt.setInt(5, user.getSex());
			pstmt.setString(6, user.getHeadImgUrl());
			pstmt.setString(7, user.getBirthday());
			pstmt.setString(8, user.getAddress());
			pstmt.setString(9, user.getContact());
			pstmt.setInt(10, user.getGrade());
			pstmt.setInt(11, user.getScore());
			pstmt.setString(12, user.getCreateTime());
			pstmt.setString(13, user.getUpdateTime());
			result = pstmt.executeUpdate();
			
			String userIdSql = "SELECT ID FROM AICE_USER WHERE NAME='" + user.getName() + "' AND NINAME='" + user.getNiname() + "'";
			pstmt = conn.prepareStatement(userIdSql);
			rs = pstmt.executeQuery();
			int userId = 0;
			while(rs.next()){
				userId = rs.getInt(1);
			}
			if (result != 0) {
				String sortSql = "INSERT INTO AICE_SORT(USERID,SORTNAME,CREATETIME,UPDATETIME,COUNT) VALUES(" + userId +  "," + "'default','" + user.getCreateTime() + "','" + user.getUpdateTime() + "'," + "0" + ")";
				pstmt = conn.prepareStatement(sortSql);
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// query userid
	public static int queryId(String sql) {
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	// close conn
	public static void close() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// check user logining
	public static int checkUser(String sql) {
		int id = 0;
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		return id;
	}

	// query user by id
	public static User queryById(int id) {
		user = new User();
		String sql = "SELECT * FROM AICE_USER WHERE ID='" + id + "'";
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setNiname(rs.getString(3));
				user.setPsw(rs.getString(4));
				user.setAge(rs.getInt(5));
				user.setSex(rs.getInt(6));
				user.setHeadImgUrl(rs.getString(7));
				user.setBirthday(rs.getString(8));
				user.setAddress(rs.getString(9));
				user.setContact(rs.getString(10));
				user.setGrade(rs.getInt(11));
				user.setScore(rs.getInt(12));
				user.setCreateTime(rs.getString(13));
				user.setUpdateTime(rs.getString(14));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	// update user by id
	public static int updateById(int id) {
		String sql = "UPDATE AICE_USER SET NINAME=?,PSW=?,Age=?,SEX=?,HEADIMGURL=?,BIRTHDAY=?,ADDRESS=?,CONTACT=?,GRADE=?,SCORE=?,CREATETIME=?,UPDATETIME=? WHERE ID='" + id + "'";
		System.out.println(sql);
		int result = 0;
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getNiname());
			pstmt.setString(2, user.getPsw());
			pstmt.setInt(3, user.getAge());
			pstmt.setInt(4, user.getSex());
			pstmt.setString(5, user.getHeadImgUrl());
			pstmt.setString(6, user.getBirthday());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getContact());
			pstmt.setInt(9, user.getGrade());
			pstmt.setInt(10, user.getScore());
			pstmt.setString(11, user.getCreateTime());
			pstmt.setString(12, user.getUpdateTime());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// query blog by userid
	public static ArrayList<Blog> queryBlogById(int id, String IDType) {
		getConn();
		ArrayList<Blog> list = new ArrayList<Blog>();
		String sql = "SELECT * FROM AICE_BLOG WHERE " + IDType + "='" + id + "'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Blog blog = new Blog();
				blog.setId(rs.getInt(1));
				blog.setUserId(rs.getInt(2));
				blog.setTitle(rs.getString(3));
				blog.setContent(rs.getString(4));
				blog.setSortId(rs.getInt(5));
				blog.setCreateTime(rs.getString(6));
				blog.setUpdateTime(rs.getString(7));
				list.add(blog);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// update blog by blogid
	public static int updateBlogByBlogId(int blogId) {
		int result = 0;
		getConn();
		String sql = "UPDATE AICE_BLOG SET TITLE=" + "" + ",CONTENT=" + "" + " WHERE BLOGID=" + blogId;
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// query sort by userid
	public static ArrayList<Sort> querySortById(int id) {
		getConn();
		ArrayList<Sort> list = new ArrayList<Sort>();
		String sql = "SELECT * FROM AICE_SORT WHERE USERID='" + id + "'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Sort sort = new Sort();
				sort.setId(rs.getInt(1));
				sort.setUserid(rs.getInt(2));
				sort.setSortName(rs.getString(3));
				sort.setCreateTime(rs.getString(4));
				sort.setUpdateTime(rs.getString(5));
				sort.setCount(rs.getInt(6));
				list.add(sort);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// insert sort
	public static int addSort(String sql) {
		getConn();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sort.getUserid());
			pstmt.setString(2, sort.getSortName());
			pstmt.setString(3, sort.getCreateTime());
			pstmt.setString(4, sort.getUpdateTime());
			pstmt.setInt(5, sort.getCount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// delete sort by id
	public static int deleteOrUpdateSortById(String sql) {
		getConn();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// update sort count
	public static void updateSortCount(int currentSortId, int updateSortId) {
		String sql = "SELECT COUNT(*) FROM AICE_BLOG WHERE SORTID=" + currentSortId;
		String updateSql = "SELECT COUNT(*) FROM AICE_BLOG WHERE SORTID=" + updateSortId;
		getConn();
		int result = 0;
		int updateResult = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
			sql = "UPDATE AICE_SORT SET COUNT=" + result + " WHERE ID=" + currentSortId;
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			if (updateSortId != 0) {
				pstmt = conn.prepareStatement(updateSql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					updateResult = rs.getInt(1);
				}
				updateSql = "UPDATE AICE_SORT SET COUNT=" + updateResult + " WHERE ID=" + updateSortId;
				pstmt = conn.prepareStatement(updateSql);
				updateResult = pstmt.executeUpdate();
			}

			System.out.println("count:" + result + "sortId" + currentSortId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// insert blog
	public static int addOrUpdateBlog(String sql) {
		int result = 0;
		getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
