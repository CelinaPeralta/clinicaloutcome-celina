
<%@ page import="org.broadinstitute.cancer.clinout.domain.MetaDataset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'metaDataset.label', default: 'MetaDataset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-metaDataset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-metaDataset" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="accessionInPublicDatabase" title="${message(code: 'metaDataset.accessionInPublicDatabase.label', default: 'Accession In Public Database')}" />
					
						<g:sortableColumn property="assayPlatform" title="${message(code: 'metaDataset.assayPlatform.label', default: 'Assay Platform')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'metaDataset.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="datasetId" title="${message(code: 'metaDataset.datasetId.label', default: 'Dataset Id')}" />
					
						<g:sortableColumn property="datasetName" title="${message(code: 'metaDataset.datasetName.label', default: 'Dataset Name')}" />
					
						<g:sortableColumn property="disease" title="${message(code: 'metaDataset.disease.label', default: 'Disease')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${metaDatasetInstanceList}" status="i" var="metaDatasetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${metaDatasetInstance.id}">${fieldValue(bean: metaDatasetInstance, field: "accessionInPublicDatabase")}</g:link></td>
					
						<td>${fieldValue(bean: metaDatasetInstance, field: "assayPlatform")}</td>
					
						<td>${fieldValue(bean: metaDatasetInstance, field: "country")}</td>
					
						<td>${fieldValue(bean: metaDatasetInstance, field: "datasetId")}</td>
					
						<td>${fieldValue(bean: metaDatasetInstance, field: "datasetName")}</td>
					
						<td>${fieldValue(bean: metaDatasetInstance, field: "disease")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${metaDatasetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
