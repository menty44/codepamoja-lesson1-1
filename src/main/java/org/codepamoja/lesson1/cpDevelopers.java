package org.codepamoja.lesson1;

import java.sql.*;
import java.io.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;
import javax.servlet.*;
import javax.servlet.http.*;

public class cpDevelopers extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		String sp = request.getServletPath();
		String resp = "";
		if(sp.equals("/add_developer")) resp = addDeveloper(request);
		else if(sp.equals("/add_attendance")) resp = addAttendance(request);

		response.setContentType("text/html");
		try {
		    PrintWriter out = response.getWriter();
		    out.println(resp);
		} catch(IOException ex) {}
	}

	private String addAttendance(HttpServletRequest request) {
		String userIP = request.getRemoteAddr();
		String userName = request.getRemoteUser();
		String locationName = request.getParameter("location_name");
		String gettingIn = request.getParameter("getting_in");
		String narrative = request.getParameter("narrative");
System.out.println("Attendnace  : " + locationName + " : " + gettingIn);

		// Opening database connection
		Connection db = connectDB("java:/comp/env/jdbc/database");

		String mySql = "SELECT developer_id FROM developers WHERE user_name = '" + userName + "'";
		String developerId = executeFunction(db, mySql);

		// Generate the SQL
		mySql = "INSERT INTO attendance(developer_id, location_name, "
			+ "attendance_date, attendance_time, getting_in, narrative) "
			+ "VALUES ('" + developerId + "', '" + locationName + "' "
			+ ", current_date, current_time, " + gettingIn
			+ ", '" + narrative + "');";
System.out.println("SQL : " + mySql);
		executeQuery(db, mySql);


		// closing database connection
		close(db);

        String resp = "<html>\n<head>\n<title>CodePamoja Attendance</title>\n</head>"
		+ "\n<body>\n<h3>Added Attendnace for " + userName + "</h3>"
		+ "\n</body>\n</html>";

		return resp;
    }

	private String addDeveloper(HttpServletRequest request) {
		String developerName = request.getParameter("developer_name");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
System.out.println("Developer name : " + developerName);

		// Opening database connection
		Connection db = connectDB("java:/comp/env/jdbc/database");

		// Generate the SQL
		String mySql = "INSERT INTO developers (developer_name, joining_date, user_name, user_password) "
		+ " VALUES('" + developerName + "', current_date "
		+ ", '" + userName + "', md5('" + userPassword + "'));";
System.out.println("SQL : " + mySql);
		executeQuery(db, mySql);

		// closing database connection
		close(db);

        String resp = "<html>\n<head>\n<title>CodePamoja Attendance</title>\n</head>"
		+ "\n<body>\n<h3>Added Developer " + developerName + "</h3>"
		+ "\n</body>\n</html>";

		return resp;
    }

	// initialize the database and web output
	public Connection connectDB(String datasource) {
		Connection db = null;
		try {
			InitialContext cxt = new InitialContext();
			DataSource ds = (DataSource) cxt.lookup(datasource);
			db = ds.getConnection();
		} catch (SQLException ex) {
			System.out.println("Cannot connect to this database : " + ex);
        } catch (NamingException ex) {
			System.out.println("Cannot pick on the database name : " + ex);
        }
		return db;
	}

	// Execute any SQL
	public String executeQuery(Connection db, String mysql) {
		String rst = null;

		try {
			Statement st = db.createStatement();
			st.execute(mysql);
			st.close();
		} catch (SQLException ex) {
			rst = ex.toString();
			System.out.println("Database executeQuery error : " + ex);
		}

		return rst;
	}

	// Excecute an SQL string and  return a value
	public String executeFunction(Connection db, String mysql) {
		String ans = null;

		try {
			Statement st = db.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = st.executeQuery(mysql);

			if(rs.next()) ans = rs.getString(1);
			rs.close();
			st.close();
		} catch (SQLException ex) {
			//log.severe("Database executeFunction error : " + ex);
		}

		return ans;
	}


	// Close database connection
	public void close(Connection db) {
		try {
			if(db != null) db.close();
			db = null;
		} catch (SQLException ex) {
			System.out.println("SQL Error : " + ex);
		}
	}

}




