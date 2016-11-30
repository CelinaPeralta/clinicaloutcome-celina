<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Running Analysis</title>
  <r:require modules="loadingResults"/>
  <r:require module="grailsEvents"/>
</head>
<body>
<g:render template='/includes/systemList' />
<h3 style="color: red">Running Analysis</h3>
<div>
  <ul id="news-list">
    <li>The current system only supports Nearest Template Prediction.</li>
    <li>We will support user's custom prediction algorithm (we will accept submission of user's analysis code to be implemented in the analysis method repository in the system)</li>
    <li>Multivariate Cox regression (for time-to-event outcome) and logistic regression (for binary outcome) with clinical variables will be supported soon.</li>
    <li>We will support comparison of multiple signature's performance soon.</li>
  </ul>
</div>
<r:script>
  var grailsEvents = new grails.Events("http://clinicaloutcome.elasticbeanstalk.com/app/");
  grailsEvents.send('saveTodo', data); //will send data to server topic 'saveTodo'
  grailsEvents.on('savedTodo', function(data){...}); //will listen for server events on 'savedTodo' topic
</r:script>
</body>
</html>
