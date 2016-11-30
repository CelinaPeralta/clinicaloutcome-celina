<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Home"/> | Clinical Outcome Checker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
  <g:layoutHead />
  <r:require modules="application, jquery, jquery-ui"/>
  <langs:resources ></langs:resources>
  <r:layoutResources/>
  <ga:trackPageview />
</head>
<body>
    <table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td align="left">
          <a href="http://www.hoshida-lab.org/"><img src="${resource(dir: 'images', file: 'MSMC_RGB_Vrtl.png')}" height=124 width=100  /></a>
        </td>
        <td align="center" style="vertical-align: middle">
          <font size="6" face="verdana"><b>Clinical Outcome Checker</font></b><br>
          <font size="3" face="verdana"><i>to accelerate clinical deployment of prognostic/predictive gene signatures</i></font>
        </td>
      </tr>
    </table>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"> Home </a></li>
      <sec:ifAllGranted roles="ROLE_ADMIN">
        <li><g:link controller="user"><g:message default="Users" code="default.users.label"/></g:link></li>
        <li><g:link controller="user"><g:message default="Patient Cohorts" code="default.data.label"/></g:link></li>
        <li><g:link controller="requestmap" action="requestmapSearch"><g:message default="Security" code="default.security.label"/></g:link></li>
        <li><g:link controller="admin" action="manage"><g:message default="Settings" code="default.settings.label"/></g:link></li>
      </sec:ifAllGranted>
      <sec:ifNotLoggedIn>
		<li><g:link controller="login" action="auth">Login</g:link></li>
       <li><g:link controller="register" action="index" >Register</g:link> </li>
      </sec:ifNotLoggedIn>
      
          <sec:ifLoggedIn>
              <li><g:link controller='logout'>Logged in as <sec:loggedInUserInfo field="username"/>( Logout )</g:link> </li>
            </sec:ifLoggedIn>
            <sec:ifSwitched>
            <a href='${request.contextPath}/j_spring_security_exit_user'>
                    Resume as <sec:switchedUserOriginalUsername/>
            </a>
            </sec:ifSwitched>
            </nobr>
          </span></li>
    </ul>
    
<body>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
  </div>
  <div id="layout-body"><g:layoutBody/></div>
<r:layoutResources />
</body>
<footer>
	<div class="footer" >
	<table align="right">
		<thead>
		  
		</thead>
		<tbody>
			<tr>
				<td>Supported by:</td>
				<td>
					<a><img src="${resource(dir: 'images', file: 'National_Institute_of_Diabetes_and_Digestiv.max-1000x800.jpg')}" height=60 width=119 /></a>
				</td>
				<td>
					<a><img src="${resource(dir: 'images', file: 'TrustLogo.png')}" height=60 width=215 /></a>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</footer>

</html>