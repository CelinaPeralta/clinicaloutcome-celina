<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Clinical Outcome Checker</title>
  </head>
  <body>
    <h1>Clinical Outcome Checker</h1>
    <g:render template='/includes/systemList' />
    <g:render template='/includes/analysisWorkflow' />
      <br />
      <sec:ifLoggedIn>
      <g:link controller="dataset" elementId="start-here" class="float-right" >Start Here</g:link>
      <jq:jquery>jQuery("#start-here").button();</jq:jquery>
      </sec:ifLoggedIn>
      <br /><br />
  </body>
</html>
