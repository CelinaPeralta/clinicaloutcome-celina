<%@ page import="org.genepattern.matrix.Dataset" %>
<%@ page import="org.genepattern.client.GPClient" %>
<%@ page import="org.genepattern.server.webservice.server.Analysis" %>
<%@ page import="org.genepattern.webservice.*"%>
<%@ page import="org.genepattern.io.IOUtil" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<html>
    <body>
        <%
        System.out.println("\n\nRunning analysis on GenePattern now\n\n");
		
                String GPURL = "http://genepatternbeta.broadinstitute.org/gp/";
                String GPLOGIN = "coc_prototype";
                String GPPASSWORD = "password";
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

        <table>
            <tr>
                <td>
                    <%
                            String dataset = (String) session.getAttribute("dataset");
                            String outcome_type = (String) session.getAttribute("type");
                            String signature = (String) session.getAttribute("signature");

            System.out.println("ds = " + dataset);
            System.out.println("outcome_type = " + outcome_type);
            System.out.println("signature" + signature);
		


                            if (outcome_type.equals("time-to-event"))
                            {
                                    out.println(request.getContextPath());
							
                                    GPClient gpClient = new GPClient(GPURL, GPLOGIN, GPPASSWORD);
                                    AnalysisWebServiceProxy analysisProxy = new AnalysisWebServiceProxy(GPURL, GPLOGIN, "");
							
                                    JobResult ntp = gpClient.runAnalysis("OutcomeChecker_TimeToEvent", new Parameter[] { 
                                                                                                                    new Parameter("ntp_for_coc1.input.exp.filename", new File("../gct/" + dataset + ".gct")),
                                                                                                                    new Parameter("ntp_for_coc1.input.features.filename", new File("../uploads/" + signature)),
                                                                                                                    new Parameter("SurvivalCurve2.input.surv.data.file", new File("../clinical_data/" + dataset + ".txt")),
                                                                                                                    new Parameter("SurvivalDifference3.input.surv.data.file", new File("../clinical_data/" + dataset + ".txt")),
                                                                                                                    new Parameter("CoxRegression_for_COC4.input.surv.data.filename", new File("../clinical_data/" + dataset + ".txt"))
                                                                                                                    });
																	
                                    int[] childJobs = analysisProxy.getChildren(ntp.getJobNumber());
                                    JobResult survivalCurve = gpClient.createJobResult(childJobs[1]);
                                    JobResult survivalDifference = gpClient.createJobResult(childJobs[2]);
                                    JobResult coxRegression = gpClient.createJobResult(childJobs[3]);
							
                                    File[] survivalCurveOutput = survivalCurve.downloadFiles(String.valueOf(survivalCurve.getJobNumber()));
                                    out.println("<img src=" + GPURL + "jobResults/" + survivalCurve.getJobNumber() + "/" + dataset + "_SurvivalCurve_SurvivalCurve.png></img>");
                                    File[] survivalDifferenceOutput = survivalDifference.downloadFiles(String.valueOf(survivalDifference.getJobNumber()));							
                                    File[] coxRegressionOutput = coxRegression.downloadFiles(String.valueOf(coxRegression.getJobNumber()));

                                    FileInputStream fstream = new FileInputStream(survivalDifferenceOutput[0].getAbsolutePath());
                                    DataInputStream in = new DataInputStream(fstream);
                                    BufferedReader br = new BufferedReader(new InputStreamReader(in));
						  
                                    String strLine;
                                    String chisq;
                                    double[] line1 = new double[5];
                                    double[] line2 = new double[5];
							
                                    while ((strLine = br.readLine()) != null)   {
                                            String[] wordlist = strLine.split("\\s+");

                                            if (wordlist[0].equals("cls=1")) for (int i = 0; i < 5; i++) line1[i] = Double.parseDouble(wordlist[i+1]);
                                            if (wordlist[0].equals("cls=2")) for (int i = 0; i < 5; i++) line2[i] = Double.parseDouble(wordlist[i+1]);
                                            if (wordlist[0].equals("Chisq=")) chisq = strLine;
                                    }
                                    in.close();
							
                    %>
                    <table border=1>
                        <tr>
                            <td></td>
                            <td><font size="2" face="verdana">N</td>
                            <td><font size="2" face="verdana">Observed</td>
                            <td><font size="2" face="verdana">Expected</td>
                            <td><font size="2" face="verdana">(O-E)^2/E</td>
                            <td><font size="2" face="verdana">(O-E)^2/V</td>
                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">Class 1</font></td>
                            <td><font size="2" face="verdana"><%= line1[0] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[1] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[2] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[3] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[4] %></font></td>
                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">Class 2</font></td>
                            <td><font size="2" face="verdana"><%= line2[0] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[1] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[2] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[3] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[4] %></font></td>
                        </tr>
                    </table>
                    <%
                    fstream = new FileInputStream(coxRegressionOutput[0].getAbsolutePath());
                    in = new DataInputStream(fstream);
                    br = new BufferedReader(new InputStreamReader(in));
							
                    String rsq = "", likelihood = "", wald = "", score = "";
                    boolean firstLine = true;
							
                    while ((strLine = br.readLine()) != null)   {
                            String[] wordlist = strLine.split("\\s+");

                            if (wordlist[0].equals("factor(cls)2") && firstLine) {
                                    for (int i = 0; i < 5; i++) line1[i] = Double.parseDouble(wordlist[i+1]);
                                    firstLine = false;
                            }
                            else if (wordlist[0].equals("factor(cls)2") && !firstLine) for (int i = 0; i < 4; i++) line2[i] = Double.parseDouble(wordlist[i+1]);
                            else if (wordlist[0].equals("Rsquare=")) rsq = strLine;
                            else if (wordlist[0].equals("Likelihood")) likelihood = strLine;
                            else if (wordlist[0].equals("Wald")) wald = strLine;
                            else if (wordlist[0].equals("Score")) score = strLine;
                    }
                    in.close();
                    %>
                    <table border=1>
                        <font size="2" face="verdana">
                        <tr>
                            <td></td>
                            <td><font size="2" face="verdana">coef</td>
                            <td><font size="2" face="verdana">exp(coef)</td>
                            <td><font size="2" face="verdana">se(coef)</td>
                            <td><font size="2" face="verdana">z</td>
                            <td><font size="2" face="verdana">p</td>
                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">factor(cls)2</font></td>
                            <td><font size="2" face="verdana"><%= line1[0] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[1] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[2] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[3] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[4] %></font></td>
                        </tr>
                        </font>
                    </table>
                    <table border=1>
                        <font size="2" face="verdana">
                        <tr>
                            <td></td>
                            <td>exp(coef)</td>
                            <td>exp(-coef)</td>
                            <td>lower .95</td>
                            <td>upper .95</td>
                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">factor(cls)2</font></td>
                            <td><font size="2" face="verdana"><%= line2[0] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[1] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[2] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[3] %></font></td>
                        </tr>
                        </font>
                    </table>
                    <font size="2" face="verdana">
                    <%
                    out.println(rsq);
                    out.println(likelihood);
                    out.println(wald);
                    out.println(score);
                    %>
                    </font>
                    <%
                    } else if (outcome_type.equals("binary")) 
                    {
                            GPClient gpClient = new GPClient(GPURL, GPLOGIN);
                            AnalysisWebServiceProxy analysisProxy = new AnalysisWebServiceProxy(GPURL, GPLOGIN, "");
							
                            JobResult ntp = gpClient.runAnalysis("OutcomeChecker_Binary", new Parameter[] { 
                                                                                                            new Parameter("ntp_for_coc1.input.exp.filename", "../gct/" + dataset + ".gct"),
                                                                                                            new Parameter("ntp_for_coc1.input.features.filename", "../uploads/" + signature),
                                                                                                            new Parameter("TwoByTwo_for_COC2.input.surv.data.filename", "../clinical_data/" + dataset + ".txt"),
                                                                                                            new Parameter("LogisticRegression_for_COC3.input.clin.data.filename", "../clinical_data/" + dataset + ".txt")
                                                                                                            });

                            int[] childJobs = analysisProxy.getChildren(ntp.getJobNumber());
                            JobResult twoByTwo = gpClient.createJobResult(childJobs[1]);
                            JobResult logisticReg = gpClient.createJobResult(childJobs[2]);
							
                            File[] twoByTwoOutput = twoByTwo.downloadFiles(String.valueOf(twoByTwo.getJobNumber()));
                            File[] logisticRegOutput = logisticReg.downloadFiles(String.valueOf(logisticReg.getJobNumber()));							

                            FileInputStream fstream = new FileInputStream(twoByTwoOutput[1].getAbsolutePath());
                            DataInputStream in = new DataInputStream(fstream);
                            BufferedReader br = new BufferedReader(new InputStreamReader(in));
						  
                            String strLine;
                            double[] line1 = new double[2];
                            double[] line2 = new double[2];
							
                            while ((strLine = br.readLine()) != null)   {
                                    String[] wordlist = strLine.split("\\s+");

                                    if (wordlist[0].equals("1")) for (int i = 0; i < 2; i++) line1[i] = Double.parseDouble(wordlist[i+1]);
                                    if (wordlist[0].equals("2")) for (int i = 0; i < 2; i++) line2[i] = Double.parseDouble(wordlist[i+1]);
                            }
                            in.close();
                    %>
                    <table border=1>
                        <tr>
                            <td></td>
                            <td><font size="2" face="verdana">True Outcomes</td>
                            <td><font size="2" face="verdana">1</td>
                            <td><font size="2" face="verdana">2</td>
                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">Prediction</font></td>
                            <td></td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">1</font></td>
                            <td></td>
                            <td><font size="2" face="verdana"><%= line1[0] %></font></td>
                            <td><font size="2" face="verdana"><%= line1[1] %></font></td>
                        </tr>
                        <tr>
                            <td><font size="2" face="verdana">2</font></td>
                            <td></td>
                            <td><font size="2" face="verdana"><%= line2[0] %></font></td>
                            <td><font size="2" face="verdana"><%= line2[1] %></font></td>
                        </tr>
                    </table>
                    <%
                    }
                    %>
                </td>
            </tr>
        </table>
        <form method="link" action="clearsession.jsp">
            <input type="submit" value="Run Another Analysis">
        </form>
    </body>
</html>