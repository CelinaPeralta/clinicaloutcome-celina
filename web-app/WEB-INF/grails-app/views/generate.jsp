<%@ page import="java.io.*" %>

<html>
	<head>
		<meta http-equiv="refresh" content="0;URL=signatureupload.jsp">
	</head>

	<body>
		<%
			String genes1 = request.getParameter("genes1");
			String genes2 = request.getParameter("genes2");
			String[] list1 = genes1.split("\\r?\\n");
			String[] list2 = genes2.split("\\r?\\n");

			Writer output = null;
			File file = new File("../uploads/signature.txt");
			output = new BufferedWriter(new FileWriter(file));
			output.write("Genes\tGenes\tClass\n");
			for (int i = 0; i < list1.length; i++)
			{
				output.write(list1[i] + "\t" + list1[i] + "\t1\n");
			}
			for (int i = 0; i < list2.length; i++)
			{
				output.write(list2[i] + "\t" + list2[i] + "\t2\n");
			}
			output.close();

			session.setAttribute("signature", "signature.txt");
		%>
	</body>
</html>