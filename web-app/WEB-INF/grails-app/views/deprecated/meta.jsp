<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<title>Choose Dataset</title>
	</head>

	<body>
		<%
			String access = (String) session.getAttribute("access");
			if (!access.equals("true")) response.sendRedirect("login.jsp");
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
		</table><br><br>
		
		<%!
			Statement stmt;
			Connection con;
		%>
		<%
			String organ = (String) session.getAttribute("organ");
			String disease = (String) session.getAttribute("disease");
			String outcome = (String) session.getAttribute("outcome");
			String dataset = request.getParameter("dataset");
			session.setAttribute("dataset", dataset);
		%>
		
		<font size="5" face="verdana">
			<b>Dataset Annotation</b> <small>(<%= dataset %>)</small>
		</font><br><br>
		
		<font size="3" face="verdana">
			<%
				String url = (String) session.getAttribute("mysqldb");
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, "coc_prototype", "broad");
				stmt = con.createStatement();

				String select = "SELECT * FROM coc_prototype WHERE organ = ? AND disease = ? AND Clinical_outcome = ? AND Dataset_name = ?";
				PreparedStatement ps = con.prepareStatement(select);
				ps.setString(1, organ);
				ps.setString(2, disease);
				ps.setString(3, outcome);
				ps.setString(4, dataset);

				ResultSet result = ps.executeQuery();
				while(result.next())
				{
					out.println("<b>Dataset ID: </b>" + result.getString("Dataset_id") + "<br>");
					out.println("<b>Number of Samples: </b>" + result.getString("No_samples") + "<br>");
					out.println("<b>Level of Study Design: </b>" + result.getString("Level_of_study_design") + "<br>");
					out.println("<b>Study Design: </b>" + result.getString("Study_design") + "<br>");
					out.println("<b>Mode of Patient Enrollement: </b>" + result.getString("Mode_of_patient_enrollment") + "<br>");
					out.println("<b>Organ: </b>" + result.getString("organ") + "<br>");
					out.println("<b>Disease: </b>" + result.getString("disease") + "<br>");
					out.println("<b>Tissue Type: </b>" + result.getString("tissue_type") + "<br>");
					out.println("<b>Clinical Outcome: </b>" + result.getString("Clinical_outcome") + "<br>");
					out.println("<b>Type of Clinical Outcome: </b>" + result.getString("type_of_clinical_outcome") + "<br>");
					session.setAttribute("type", result.getString("type_of_clinical_outcome"));
					out.println("<b>Geographic Area: </b>" + result.getString("Geographic_area") + "<br>");
					out.println("<b>Country: </b>" + result.getString("country") + "<br>");
					out.println("<b>Ethnicity: </b>" + result.getString("ethnicity") + "<br>");
					out.println("<b>Time Scale: </b>" + result.getString("Time_scale") + "<br>");
					out.println("<b>Median Follow-Up Time: </b>" + result.getString("Median_follow_up_time") + "<br>");
					String clinical_info = result.getString("Clinical_and_other_molecular_information");
					out.println("<b>Clinical and Other Molecular Information: </b>" + clinical_info.replace("/", ",") + "<br>");
					out.println("<b>Reference (PMID): </b> <a href=http://www.ncbi.nlm.nih.gov/pubmed/" + result.getString("Reference_PMID") + ">" + result.getString("Reference_PMID") + "</a><br>");
					out.println("<b>Assay Platform: </b> <a href=http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=" + result.getString("Assay_platform") + ">" + result.getString("Assay_platform") + "</a><br>");
					out.println("<b>Tissue Storage: </b>" + result.getString("Tissue_storage") + "<br>");
					out.println("<b>Accession Number in Public Database: </b> <a href=http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=" + result.getString("Accession_in_public_database") + ">" + result.getString("Accession_in_public_database") + "</a><br>");
					break;
				}
				out.println("<br><br>");
				out.println("<a href=\"signatureupload.jsp\"><b>Select and Go Next</b></a><br>");
				con.close();
			%>
		</font>
	</body>
</html>