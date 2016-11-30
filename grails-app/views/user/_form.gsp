<%@ page import="org.broadinstitute.cancer.clinout.domain.User" %>



<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="User.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${COUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="User.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${COUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="User.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${COUserInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="User.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${COUserInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="User.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${COUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="User.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${COUserInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: COUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="User.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${COUserInstance?.passwordExpired}" />
</div>

