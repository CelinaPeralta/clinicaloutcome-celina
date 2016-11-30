<html>
	<body>
		<%
			session.setAttribute("mysqldb", "jdbc:mysql://calcium:3306/coc_prototype");
			if (request.getParameter("more") != null) session.setAttribute("more", "true");
		%>
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
		</table>

		<table width="85%" border="0" cellspacing="1" cellpadding="1">
			<tr>
				<td>
					<font size="4" face="verdana">
						This is a system that enables:
						<ul>
							<li>Quick and easy assessment of user outcome-predictive signatures against a wide variety of patient populations in our database.</li>
							<li>Comparison of predictive performance between user signatures.</li>
						</ul>
						<% 
							if (session.getAttribute("more") != null) { 
						%>
						The system also supports:<br>
						<ul>
							<li>Subgroup analysis for specific patient population (sex, disease stage, etc.)</li>
							<li>Meta-analysis of multiple patient populations</li>
							<li>Assessment of informativeness for each signature gene and</li>
							<li>Various choice of prediction methods from preset collection</li>
						</ul>
						<%
							} else out.println("<a href=login.jsp?more=true>More</a>");
						%>
					</font>
				</td>
			</tr>
		</table>
		<br>

		<form action="validate.jsp">
			<table width=30%>
				<tr>
					<td>
						<font size="3" face="verdana">Enter Username:</font>
					</td>
					<td>
						<input type="text" name="username" />
					</td>
				</tr>
				<tr>
					<td>
						<font size="3" face="verdana">Enter Password:</font>
					</td>
					<td>
						<input type="password" name="password" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Log In" />
					</td>
					<td>
					</td>
				</tr>
			</table>
		</form> 
	</body>
</html>
