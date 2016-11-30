<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
	<body>
		<%!
			Statement stmt;
			Connection con;
		%>
		<%
//			String url = (String) session.getAttribute("mysqldb");
//			String username = (String) request.getParameter("username");
//			String password = (String) request.getParameter("password");
//			String query = "SELECT COUNT(*) AS count FROM accounts WHERE username = ? AND password = ?";

//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection(url, "root", "password");
//			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString(1, username);
//			ps.setString(2, password);
//			ResultSet counts = ps.executeQuery();

	//		while (counts.next())
	//		{
	//			String getCount = counts.getString("count");
	//			if (getCount.equals("1"))
	//			{
					session.setAttribute("access", "true");
					response.sendRedirect("home.jsp");
	//			} else {
	//				session.setAttribute("access", "false");
	//				response.sendRedirect("login.jsp");
	//			}
	//			break;
	//		}

	//		con.close();
		%>
	</body>
</html>