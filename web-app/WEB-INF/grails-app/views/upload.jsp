<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="C:/uploads" />
</jsp:useBean>

<head>
<title>Signature Upload</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" class="style1">
<p style="font-family:verdana;font-size:120%"><b>Step 2. Submit Signature (Or Predictive Model)</b></p>

<form method="post" action="upload.jsp" name="upform" enctype="multipart/form-data">
<b><font face="verdana" size="2">Upload a List of Signature Genes: </font></b>
<input type="file" name="uploadfile" size="50">
<input type="hidden" name="todo" value="upload"><br>
<input type="submit" name="Submit" value="Upload">
<input type="reset" name="Reset" value="Cancel">
</form>
<p style="font-family:verdana;font-size:80%">
<%
	String dataset = (String) request.getParameter("name");
	if (dataset != null) session.setAttribute("dataset", dataset);
	
	if (MultipartFormDataRequest.isMultipartFormData(request))
    {
		 // Uses MultipartFormDataRequest to parse the HTTP request.
		 MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
		 String todo = null;
		 if (mrequest != null) todo = mrequest.getParameter("todo");
		 if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
		 {
				Hashtable files = mrequest.getFiles();
				if ( (files != null) && (!files.isEmpty()) )
				{
					UploadFile file = (UploadFile) files.get("uploadfile");
					if (file != null) 
					{
						out.println("<b>Uploaded file : </b>"+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> <b>Content Type : </b>"+file.getContentType());
						session.setAttribute("signature", file.getFileName());
						out.println("<br><a href=\"output.jsp\">Next Page</a>");
					}
					// Uses the bean now to store specified by jsp:setProperty at the top.
					upBean.store(mrequest, "uploadfile");
				}
				else
				{
				  out.println("<li>No uploaded files");
				}
		 }
		 else out.println("<BR> todo="+todo);
    }
%>

</p>
</body>
</html>
