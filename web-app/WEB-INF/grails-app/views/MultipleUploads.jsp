<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="overwrite" value="false" />
  <jsp:setProperty name="upBean" property="folderstore" value="C:/uploads" />
</jsp:useBean>

<head>
<title>Upload Files</title>
<style TYPE="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="Javascript"><!--
  function doUpload()
  {
    document.upload.todo.value="upload";
	document.upload.submit();
  }
  function doClean()
  {
    document.upload.todo.value="cleanstore";
	document.upload.submit();
  }
  //--></script>
</head>
<body bgcolor="#FFFFFF" text="#000000" class="style1">
<table width="70%" border="0" cellspacing="1" cellpadding="1">
    <tr>
		<td align="left"><img src="http://www.cellprofiler.org/images/BroadInstituteLogo_smaller.png" /></td>
		<td align="center"><font size="5" face="verdana"><b>Clinical Outcome Checker </font></b><br> 
						   <font size="3" face="verdana"><i>~to accelerate clinical deployment of diagnostic/prognostic gene signatures~</i></font>
		</td>
    </tr>
</table>
<p style="font-family:verdana;font-size:120%"><b>Step 2. Submit Signature (Or Predictive Model)</b></p>
<%
	  String dataset = (String) request.getParameter("name");
	  if (dataset != null) session.setAttribute("dataset", dataset);
	  String analysis = (String) request.getParameter("module");
	  if (analysis != null) session.setAttribute("analysis", analysis);
%>

<form action="MultipleUploads.jsp" method=POST>
<select name="module">
<option value="">Choose a Module
<option value="TTE"> Time to Event
<option value="Binary">Binary
</select>
<input type=SUBMIT value="Continue"><br><br>
</form>

<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                // Uses the bean now to store specified by jsp:setProperty at the top.
                upBean.store(mrequest);
                // Displays info about uploaded files for this session.
                %>
                <b>Upload history : </b>
                <ul><font size="-2" face="Verdana, Arial, Helvetica, sans-serif">
                <%
                Vector history = upBean.getHistory();
                for (int i=0;i<history.size();i++)
                {
                    UploadParameters up = (UploadParameters) history.elementAt(i);
                    out.println("<li>Uploaded file : "+up.getFilename()+" ("+up.getFilesize()+" bytes)"+"<BR> Content Type : "+up.getContenttype());
					session.setAttribute("file" + Integer.toString(i), up.getFilename());
                }
				out.println("<br><a href=\"output.jsp\">Next Page</a>");
                %>
                </font></ul>
                <%
	     }
	     else if ( (todo != null) && (todo.equalsIgnoreCase("cleanstore")) )
	     {
            upBean.resetStore();
            out.println("<BR>Store cleaned");
         }
         else out.println("<BR> todo="+todo);
      }
%>

<%
if (analysis != null && analysis.equals("TTE"))
{
%>
<form method="post" action="MultipleUploads.jsp" name="upload" enctype="multipart/form-data">
  <table width="20%" border="0" cellspacing="1" cellpadding="1" class="style1">
    <tr>
      <td align="left"><b>Select files to upload:</b></td>
    </tr>
	<tr>
	  <td></td>
	</tr>
    <tr>
      <td align="left">ntp_for_coc1.input.features.filename:<input type="file" name="uploadfile2" size="50"></td>
    </tr>
    <tr>
      <td align="left">SurvivalCurve2.input.surv.data.file:<input type="file" name="uploadfile3" size="50"></td>
    </tr>
	<tr>
      <td align="left">SurvivalDifference3.input.surv.data.file:<input type="file" name="uploadfile4" size="50"></td>
    </tr>
	<tr>
      <td align="left">CoxRegression_for_COC4.input.surv.data.filename:<input type="file" name="uploadfile5" size="50"></td>
    </tr>
    <tr>
      <td align="left">
        <input type="hidden" name="todo">
        <input type="button" name="Submit" value="Upload" onClick="doUpload()">
        <input type="button" name="Clean" value="Reset Store" onClick="doClean()">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
</form>
<%
} else if (analysis != null && analysis.equals("Binary"))
{
%>
<form method="post" action="MultipleUploads.jsp" name="upload" enctype="multipart/form-data">
  <table width="20%" border="0" cellspacing="1" cellpadding="1" class="style1">
    <tr>
      <td align="left"><b>Select files to upload:</b></td>
    </tr>
	<tr>
	  <td></td>
	</tr>
    <tr>
      <td align="left">ntp_for_coc1.input.features.filename:<input type="file" name="uploadfile1" size="50"></td>
    </tr>
    <tr>
      <td align="left">TwoByTwo_for_COC2.input.surv.data.filename:<input type="file" name="uploadfile2" size="50"></td>
    </tr>
	<tr>
      <td align="left">LogisticRegression_for_COC3.input.clin.data.filename:<input type="file" name="uploadfile3" size="50"></td>
    </tr>
    <tr>
      <td align="left">
        <input type="hidden" name="todo">
        <input type="button" name="Submit" value="Upload" onClick="doUpload()">
        <input type="button" name="Clean" value="Reset Store" onClick="doClean()">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
</form>
<%
}
%>
</body>
</html>
