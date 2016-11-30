<%@ page contentType="text/html;charset=UTF-8" %>
<%
def logRankLine1 = map.survivalDifferenceLine1.split(/\s+/)
def logRankLine2 = map.survivalDifferenceLine2.split(/\s+/)
def logRankLine3 = map.survivalDifferenceLine3

def coxRegressionLine1 = map.coxRegressionLine1.split(/\s+/)
def coxRegressionLine2 = map.coxRegressionLine2.split(/\s+/)
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Analysis Results</title>
    <r:require modules="resultsTimeToEvent"/>
  </head>
  <body>
    <h1>Analysis Results</h1>
<!--    <g:render template='/includes/selectionTable' />-->
    <div class="table-wrap">
      <table border="1" class="bottomShadow">
        <caption>Log-Rank Test</caption>
        <thead>
          <tr>
            <th></th>
            <th class="center">N</th>
            <th class="center">Observed</th>
            <th class="center">Expected</th>
            <th class="center">(O-E)^2/E</th>
            <th class="center">(O-E)^2/V</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="bold">Class 1</td>            
            	<%
					try{ %>
						<td><g:formatNumber number="${logRankLine1[1]}" maxFractionDigits="1" /></td>
					<%} catch(Exception e){%>
					<%}
				%>
				<%
					try{ %>
						<td><g:formatNumber number="${logRankLine1[2]}" maxFractionDigits="1" /></td>
					<%} catch(Exception e){%>
					<%}
				%>
				<%
					try{ %>
						<td><g:formatNumber number="${logRankLine1[3]}" maxFractionDigits="1" /></td>
					<%} catch(Exception e){%>
					<%}
				%>
				<%
					try{ %>
						<td><g:formatNumber number="${logRankLine1[4]}" maxFractionDigits="1" /></td>
					<%} catch(Exception e){%>
					<%}
				%>
				<%
					try{ %>
						<td><g:formatNumber number="${logRankLine1[5]}" maxFractionDigits="1" /></td>
					<%} catch(Exception e){%>
					<%}
				%>
          </tr>
          <tr>
            <td class="bold">Class 2</td>
			<%
				try{ %>
					<td><g:formatNumber number="${logRankLine2[1]}" maxFractionDigits="1" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
			<%
				try{ %>
					<td><g:formatNumber number="${logRankLine2[2]}" maxFractionDigits="1" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
			<%
				try{ %>
					<td><g:formatNumber number="${logRankLine2[3]}" maxFractionDigits="1" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
			<%
				try{ %>
					<td><g:formatNumber number="${logRankLine2[4]}" maxFractionDigits="1" /></td>
				<%} catch(Exception e){%>
				<%}
			%>	
			
			<%
				try{ %>
					<td><g:formatNumber number="${logRankLine2[5]}" maxFractionDigits="1" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
          </tr>
        </tbody>
      </table>
      <p><%= logRankLine3 %></p>
    </div>
    <br />
    <div class="table-wrap">
      <table border="1" class="bottomShadow">
        <caption>Cox Regression</caption>
        <thead>
          <tr>
            <th></th>
            <th class="center">Hazard Ratio</th>
            <th class="center">95% CI (lower)</th>
            <th class="center">95% CI (upper)</th>
            <th class="center">P</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="bold">Class 2 (vs. Class 1)</td>
            <%
				try{ %>
					<td><g:formatNumber number="${coxRegressionLine2[1]}" maxFractionDigits="2" minFractionDigits="2" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
			<%
				try{ %>
					<td><g:formatNumber number="${coxRegressionLine2[3]}" maxFractionDigits="2" minFractionDigits="2" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
			<%
				try{ %>
					<td><g:formatNumber number="${coxRegressionLine2[4]}" maxFractionDigits="2" minFractionDigits="2" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
			<%
				try{ %>
					<td><g:formatNumber number="${coxRegressionLine1[5] as double}" maxFractionDigits="3" minFractionDigits="3" /></td>
				<%} catch(Exception e){%>
				<%}
			%>
          </tr>
        </tbody>
      </table>
    </div>
    <br />
        <a class="lightbox" title="Heatmap" href="/web-app/results/${map.jobNumber}/NTP_heatmap.png">
        <img width="400" height="400" src="/web-app/results/${map.jobNumber}/NTP_heatmap.png" />
      </a>
      <a class="lightbox" title="Survival Curve" href="/web-app/results/${map.jobNumber}/SurvivalCurve.png">
        <img width="400" height="400" src="/web-app/results/${map.jobNumber}/SurvivalCurve.png" />
      </a>
    <p class=""><span style="color: red;">Red: Class 1</span>, <span style="color: blue">Blue: Class 2</span></p>
    <div>
      <button class="float-right" id="start-over">Start Over</button>
    </div>
    <br /><br />
  </body>
</html>
