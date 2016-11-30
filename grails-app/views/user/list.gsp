
<%@ page import="org.broadinstitute.cancer.clinout.domain.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'User.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-User" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-User" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'User.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'User.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'User.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'User.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'User.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'User.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${COUserInstanceList}" status="i" var="COUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${COUserInstance.id}">${fieldValue(bean: COUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: COUserInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${COUserInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${COUserInstance.accountLocked}" /></td>
					
						<td>${fieldValue(bean: COUserInstance, field: "email")}</td>
					
						<td><g:formatBoolean boolean="${COUserInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${COUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
