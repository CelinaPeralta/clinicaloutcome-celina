<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def line1 = map.twoByTwoLines[0].split(/\s+/)
    def line2 = map.twoByTwoLines[1].split(/\s+/)
    def logisticRegressionLine1 = map.logisticRegressionLines[0].split(/\s+/)
    def logisticRegressionLine2 = map.logisticRegressionLines[1].split(/\s+/)
    def logisticRegressionLine4 = map.logisticRegressionLines[3].split(/\s+/)
    def logisticRegressionLine5 = map.logisticRegressionLines[4].split(/\s+/)
    def performance = map.performanceLines.collect { it.split('\t') }
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Analysis Results</title>
    <r:require modules="resultsBinary"/>
  </head>
  <body>
    <h1>Analysis Results</h1>
    <div class="table-wrap">
      <table border="1" class="bottomShadow">
        <thead>
          <tr>
            <th class="center" style="vertical-align: bottom" rowspan="2">Prediction</th>
            <th class="center" colspan="2">True Outcomes</th>
          </tr>
          <tr>
            <th class="center">Class 1</th>
            <th class="center">Class 2</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="bold">Class 1</td>
            <td><%= line1[1] %></td>
            <td><%= line1[2] %></td>
          </tr>
          <tr>
            <td class="bold">Class 2</td>
            <td><%= line2[1] %></td>
            <td><%= line2[2] %></td>
          </tr>
        </tbody>
    </table>
    </div>
    <br /><br />
    <div class="table-wrap">
      <table border="1" class="bottomShadow">
        <caption>Logistic Regression</caption>
        <thead>
          <tr>
            <th></th>
            <th class="center">Odds Ratio</th>
            <th class="center">95% CI (lower)</th>
            <th class="center">95% CI (upper)</th>
            <th class="center">P</th>
          </tr>
        </thead>
        <tbody>
<!--          <tr>
            <td class="bold">Class 1</td>
            <td><g:formatNumber number="${logisticRegressionLine1[4]}" maxFractionDigits="2" /></td>
            <td><g:formatNumber number="${logisticRegressionLine1[5]}" maxFractionDigits="2" /></td>
            <td><g:formatNumber number="${logisticRegressionLine4[1]}" maxFractionDigits="2" /></td>
            <td><g:formatNumber number="${logisticRegressionLine4[2]}" maxFractionDigits="3" /></td>
          </tr>-->
          <tr>
            <td class="bold">Class 2 (vs. Class 1)</td>
            <td><g:formatNumber number="${logisticRegressionLine2[4]}" maxFractionDigits="2" /></td>
            <td><g:formatNumber number="${logisticRegressionLine2[5]}" maxFractionDigits="2" /></td>
            <td><g:formatNumber number="${logisticRegressionLine5[1]}" maxFractionDigits="2" /></td>
            <td><g:formatNumber number="${logisticRegressionLine5[2] as double}" maxFractionDigits="3" minFractionDigits="3" /></td>
          </tr>
        </tbody>
      </table>
    </div>
    <br /><br />
    <div class="table-wrap">
      <table border="1" class="bottomShadow">
        <caption>2 x 2 Table Statistics</caption>
        <thead>
          <tr>
            <th class="center">Measure</th>
            <th class="center">Performance</th>
          </tr>
        </thead>
        <tbody>
          <g:each var="line" in="${performance}">
            <tr>
              <td>${line.first()}</td>
              <td><g:formatNumber number="${line.last()}" maxFractionDigits="2" /></td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
    <h3>Heatmap</h3>
      <a class="lightbox" href="/results/${map.jobNumber}/NTP_heatmp.png">
        <img src="/results/${map.jobNumber}/NTP_heatmp.png" alt="Heat Map (png)" />
      </a>
    <p class=""><span style="color: red;">Red: Class 1</span>, <span style="color: blue">Blue: Class 2</span></p>
    <br /><br />
    <div>
      <button class="float-right" id="start-over">Start Over</button>
    </div>
    <br /><br />
  </body>
</html>
