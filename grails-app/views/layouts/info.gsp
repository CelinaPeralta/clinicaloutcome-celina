<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
  <g:layoutHead />
  <r:require modules="application, jquery, jquery-ui"/>
  <r:layoutResources/>
</head>
<body>
  <div id="grailsLogo" role="banner">
    <!--    <span id='s2ui_login_link_container'>
            <nobr>
            <div id='loginLinkContainer'>
            <sec:ifLoggedIn>
            Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                    <a href='#' id='loginLink'>Login</a>
            </sec:ifNotLoggedIn>
            <sec:ifSwitched>
            <a href='${request.contextPath}/j_spring_security_exit_user'>
                    Resume as <sec:switchedUserOriginalUsername/>
            </a>
            </sec:ifSwitched>
            </div>
            </nobr>
          </span>-->
    <table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td align="left">
          <a href="http://www.broadinstitute.org"><img src="${resource(dir: 'images', file: 'BroadInstituteLogo_smaller.png')}" alt="Broad"/></a>
        </td>
        <td align="center" style="vertical-align: middle">
          <font size="6" face="verdana"><b>Clinical Outcome Checker </font></b><br> 
          <font size="3" face="verdana"><i>to accelerate clinical deployment of diagnostic/prognostic gene signatures</i></font>
        </td>
      </tr>
    </table>
  </div>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" controller="dataset" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      <li><g:link class="create" controller="dataset" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <table width="100%" border="0" cellspacing="1" cellpadding="1">
    <tr>
      <td>
        <font size="2" face="verdana">
        <b>This is a system that enables:</b>
        <ul id="system-list">
          <li>Quick and easy assessment of user outcome-predictive signatures against a wide variety of patient populations in our database.</li>
          <li>Comparison of predictive performance between user signatures.</li>
        </ul>
        </font>
      </td>
    </tr>
    <tr>
      <td>
        <img src="${resource(dir: 'images', file: 'COC_analysis_workflow.PNG')}" width="920" alt="workflow"/>
      </td>
    </tr>
  </table>
<g:layoutBody/>
<div class="footer" role="contentinfo"><langs:selector langs="es, en, en_US, pt_BR, pt, pt_pt, ja"/></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<sec:ifNotLoggedIn>
  <g:render template='/includes/ajaxLogin' plugin='spring-security-ui'/>
</sec:ifNotLoggedIn>
<r:layoutResources />
</body>
</html>