<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main" />
    <title>Submit Signature (Or Predictive Model)</title>
  <r:require modules="uploadSignature"/>
</head>
<body>
  <br />
  <g:render template='/includes/analysisWorkflow' />
<!--  <g:render template='/includes/selectionTable' />-->
  <h1>Submit Signature (Or Predictive Model)</h1>
  <div>
    <h3>Option 1: Upload User Signature</h3>
      <g:uploadForm name="sigFile" action="sigFile">
        <table>
          <tr>
            <td><input type="file" name="file" id="file" /></td>
            <td><a target="_blank" href="/examples/signature.txt">Example Signature File (txt)</a></td>
          </tr>
        </table>
      </g:uploadForm>
    <br>
    <h3>Option 2: Copy and Paste User's Signature Genes</h3>
    <g:form name="sigText" action="sigText">
      <table>
        <tr>
          <td>Overexpressed Genes in Class 1</td>
          <td>Overexpressed Genes in Class 2</td>
          <td>Example:</td>
        </tr>
        <tr>
          <td align="left">
        <g:textArea name="class1" value="" rows="10" cols="23"/><br>
        </td>
        <td align="left">
        <g:textArea name="class2" value="" rows="10" cols="23"/>
        </td>
        <td valign="top" align="left">
          <table cellspacing="5" cellpadding="10" style="border:none">
            <tr><td>AKT1<br/>CDC2<br/>CDK4<br/>PTPN11<br/>RB1</td>
              <td>FGFR3<br/>FGFR2<br/>WHSC1<br/>EGFR<br/>PTEN</td></tr>
          </table>
        </td>
        </tr>
      </table>
    </g:form>
    <br>
    <div>
      <button class="float-right" id="next-btn">Run Analysis</button>&nbsp;&nbsp;<button class="float-right" id="back-btn">Back</button>
    </div>
    <br />
  </div>
</body>
</html>
