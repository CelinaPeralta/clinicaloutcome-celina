<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>Choose Disease</title>
    </head>

    <body>
        <table width="85%" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td align="left">
                    <img src="http://www.cellprofiler.org/images/BroadInstituteLogo_smaller.png" />
                </td>
                <td align="center">
                    <font size="6" face="verdana"><b>Clinical Outcome Checker </font></b><br> 
                    <font size="4" face="verdana"><i>~to accelerate clinical deployment of diagnostic/prognostic gene signatures~</i></font>
                </td>
            </tr>
        </table><br><br>

        <table width="85%" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td>
                    <font size="4" face="verdana">
                    This is a system that enables:
                    <ul>
                        <li>Quick and easy assessment of user outcome-predictive signatures against a wide variety of patient populations in our database.</li>
                        <li>Comparison of predictive performance between user signatures.</li>
                    </ul>
                    </font>
                </td>
            </tr>
        </table>

        <font size="4" face="verdana">
        <b>Step 1. Select Dataset (Patient Cohort)</b>
        </font><br><br>

        <font size="3" face="verdana" color="red">
        Choose a Disease:
        </font><br><br>

        <font size="4" face="verdana">
        <%!
                Statement stmt;
                Connection con;
        %>
        <%
                String organ = request.getParameter("organ");
                session.setAttribute("organ", request.getParameter("organ"));
				
                String url = (String) session.getAttribute("mysqldb");
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, "coc_prototype", "broad"); 
                stmt = con.createStatement();

                ResultSet organs = stmt.executeQuery("SELECT DISTINCT(organ) FROM coc_prototype");
                while (organs.next())
                {
                        String currentOrgan = organs.getString("organ");
                        if (!currentOrgan.equals(organ))
                        {
                                out.println("<b>-" + currentOrgan + "</b><br>");
                        }
                        else
                        {
                                out.println("<b>+" + currentOrgan + "</b><br>");
						
                                String select = "SELECT DISTINCT(disease) FROM coc_prototype WHERE organ = ?";
                                PreparedStatement ps = con.prepareStatement(select);
                                ps.setString(1, currentOrgan);
                                ResultSet diseases = ps.executeQuery();
						
                                while (diseases.next())
                                {
                                        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                                        out.println("<a href=\"outcome.jsp?disease=" + diseases.getString("disease") + "\"><b>" + diseases.getString("disease") + "</b></a><br>");
                                }
                        }
                }
                con.close();
        %>
        </font>
    </body>
</html>