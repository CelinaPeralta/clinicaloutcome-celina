<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<html>
	<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
		<jsp:setProperty name="upBean" property="overwrite" value="true" />
		<jsp:setProperty name="upBean" property="folderstore" value="../uploads" />
	</jsp:useBean>

	<head>
		<title>Upload Files</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<script language="Javascript"><!--
		  function doUpload()
		  {
			document.upload.todo.value="upload";
			document.upload.submit();
		  }
		  //--></script>
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

		<font size="4" face="verdana">
			<b>Step 2. Submit Signature (Or Predictive Model)</b>
		</font>

		<%
			if (MultipartFormDataRequest.isMultipartFormData(request))
			{
				 MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
				 String todo = null;
				 if (mrequest != null) todo = mrequest.getParameter("todo");
				 if ((todo != null) && (todo.equalsIgnoreCase("upload")))
				 {
					upBean.store(mrequest);
					%><font size="-2" face="verdana"><%
						Vector history = upBean.getHistory();
						for (int i=0;i<history.size();i++)
						{
							UploadParameters up = (UploadParameters) history.elementAt(i);
							out.println("<br><br>Uploaded file : "+up.getFilename()+" ("+up.getFilesize()+" bytes)"+"<BR> Content Type : "+up.getContenttype());
							session.setAttribute("signature", up.getFilename());
						}
					%></font><%
				 }
				 else if ( (todo != null) && (todo.equalsIgnoreCase("cleanstore")) )
				 {
					upBean.resetStore();
					out.println("<br>Store cleaned");
				 }
				 else out.println("<br>todo="+todo);
			}
		%><br><br>

	<font face="verdana" size="3">
		<b>Option 1: Upload User Signature</b>
	</font><br><br>
	
	<form method="post" action="signatureupload.jsp" name="upload" enctype="multipart/form-data">
		<table width="30%" border="0" cellspacing="1" cellpadding="1" class="style1">
			<tr>
				<td align="left"><input type="file" name="signature" size="65"></td>
			</tr>
			<tr>
				<td align="left">
					<input type="hidden" name="todo">
					<input type="button" name="Submit" value="Upload" onClick="doUpload()">
				</td>
			</tr>
		</table>
	</form><br>

	<font face="verdana" size="3">
		<b>Option 2: Copy and Paste User's Signature Genes</b>
	</font><br><br>

	<form name="input" action="generate.jsp" method="get">
		<table width="40%" class="style1">
			<tr>
				<td>
					<font face="verdana" size="2">Overexpressed Genes in Class </font>
				</td>
				<td>
					<font face="verdana" size="2">Overexpressed Genes in Class </font>
				</td>
				<td>
					<font face="verdana" size="2">Example: </font>
				</td>
			</tr>
			<tr>
				<td align="left">
					<textarea name="genes1" cols="23" rows="10"></textarea><br>
				</td>
				<td align="left">
					<textarea name="genes2" cols="23" rows="10"></textarea><br>
				</td>
				<td valign="top" align="left">
				<font face="courier" size="2">
				     <table cellspacing="5" cellpadding="10" style="border:none">
					    <tr><td>AKT1<br/>CDC2<br/>CDK4<br/>PTPN11<br/>RB1</td>
					    <td>FGFR3<br/>FGFR2<br/>WHSC1<br/>EGFR<br/>PTEN</td></tr>
					    
					    
				     </table>
					</font>
				</td>
			</tr>
		</table>
		<input type="submit" value="Upload" />
	</form><br>

	<font size="3" face="verdana" color="red">
		The current system only supports bi-directional signature (i.e. combination of up-regulated and down-regulated genes in a subclass).
	</font><br><br>

	<%
	if (session.getAttribute("signature") != null)
	{
	%>
	<font face="verdana" size="3">
		<b>Select Prediction Method:</b>
	</font>

	<select>
		<option value="ntp">Nearest Template Prediction</option>
		<option value="linreg">Linear Regression</option>
		<option value="median">Median</option>
	</select><br><br>
	
	<table width=85%>
		<tr>
			<td>
				<ul>
					<font size="3" face="verdana" color="red">
						<li>The current system only supports Nearest Template Prediction.</li>
						<li>We will support user's custom prediction algorithm (we will accept submission of user's analysis code to be implemented in the analysis method repository in the system)</li>
						<li>Multivariate Cox regression (for time-to-event outcome) and logistic regression (for binary outcome) with clinical variables will be supported soon.</li>
						<li>We will support comparison of multiple signature's performance soon.</li>
					</font>
				</ul>
			</td>
		</tr>
	</table>

	<form method="link" action="output.jsp">
	<input type="submit" value="Run Analysis">
	</form>
	<%
	}
	%>

	</body>
</html>
