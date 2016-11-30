
<%@ page import="org.broadinstitute.cancer.clinout.domain.MetaDataset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'metaDataset.label', default: 'MetaDataset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-metaDataset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-metaDataset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list metaDataset">
			
				<g:if test="${metaDatasetInstance?.accessionInPublicDatabase}">
				<li class="fieldcontain">
					<span id="accessionInPublicDatabase-label" class="property-label"><g:message code="metaDataset.accessionInPublicDatabase.label" default="Accession In Public Database" /></span>
					
						<span class="property-value" aria-labelledby="accessionInPublicDatabase-label"><g:fieldValue bean="${metaDatasetInstance}" field="accessionInPublicDatabase"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.assayPlatform}">
				<li class="fieldcontain">
					<span id="assayPlatform-label" class="property-label"><g:message code="metaDataset.assayPlatform.label" default="Assay Platform" /></span>
					
						<span class="property-value" aria-labelledby="assayPlatform-label"><g:fieldValue bean="${metaDatasetInstance}" field="assayPlatform"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="metaDataset.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${metaDatasetInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.datasetId}">
				<li class="fieldcontain">
					<span id="datasetId-label" class="property-label"><g:message code="metaDataset.datasetId.label" default="Dataset Id" /></span>
					
						<span class="property-value" aria-labelledby="datasetId-label"><g:fieldValue bean="${metaDatasetInstance}" field="datasetId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.datasetName}">
				<li class="fieldcontain">
					<span id="datasetName-label" class="property-label"><g:message code="metaDataset.datasetName.label" default="Dataset Name" /></span>
					
						<span class="property-value" aria-labelledby="datasetName-label"><g:fieldValue bean="${metaDatasetInstance}" field="datasetName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.disease}">
				<li class="fieldcontain">
					<span id="disease-label" class="property-label"><g:message code="metaDataset.disease.label" default="Disease" /></span>
					
						<span class="property-value" aria-labelledby="disease-label"><g:fieldValue bean="${metaDatasetInstance}" field="disease"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.ethnicity}">
				<li class="fieldcontain">
					<span id="ethnicity-label" class="property-label"><g:message code="metaDataset.ethnicity.label" default="Ethnicity" /></span>
					
						<span class="property-value" aria-labelledby="ethnicity-label"><g:fieldValue bean="${metaDatasetInstance}" field="ethnicity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.geographicArea}">
				<li class="fieldcontain">
					<span id="geographicArea-label" class="property-label"><g:message code="metaDataset.geographicArea.label" default="Geographic Area" /></span>
					
						<span class="property-value" aria-labelledby="geographicArea-label"><g:fieldValue bean="${metaDatasetInstance}" field="geographicArea"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.medianFollowUpTime}">
				<li class="fieldcontain">
					<span id="medianFollowUpTime-label" class="property-label"><g:message code="metaDataset.medianFollowUpTime.label" default="Median Follow Up Time" /></span>
					
						<span class="property-value" aria-labelledby="medianFollowUpTime-label"><g:fieldValue bean="${metaDatasetInstance}" field="medianFollowUpTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.molecularInformation}">
				<li class="fieldcontain">
					<span id="molecularInformation-label" class="property-label"><g:message code="metaDataset.molecularInformation.label" default="Molecular Information" /></span>
					
						<span class="property-value" aria-labelledby="molecularInformation-label"><g:fieldValue bean="${metaDatasetInstance}" field="molecularInformation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.organ}">
				<li class="fieldcontain">
					<span id="organ-label" class="property-label"><g:message code="metaDataset.organ.label" default="Organ" /></span>
					
						<span class="property-value" aria-labelledby="organ-label"><g:fieldValue bean="${metaDatasetInstance}" field="organ"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.outcome}">
				<li class="fieldcontain">
					<span id="outcome-label" class="property-label"><g:message code="metaDataset.outcome.label" default="Outcome" /></span>
					
						<span class="property-value" aria-labelledby="outcome-label"><g:fieldValue bean="${metaDatasetInstance}" field="outcome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.outcomeType}">
				<li class="fieldcontain">
					<span id="outcomeType-label" class="property-label"><g:message code="metaDataset.outcomeType.label" default="Outcome Type" /></span>
					
						<span class="property-value" aria-labelledby="outcomeType-label"><g:fieldValue bean="${metaDatasetInstance}" field="outcomeType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.patientEnrollment}">
				<li class="fieldcontain">
					<span id="patientEnrollment-label" class="property-label"><g:message code="metaDataset.patientEnrollment.label" default="Patient Enrollment" /></span>
					
						<span class="property-value" aria-labelledby="patientEnrollment-label"><g:fieldValue bean="${metaDatasetInstance}" field="patientEnrollment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.publicAccessToClinicalData}">
				<li class="fieldcontain">
					<span id="publicAccessToClinicalData-label" class="property-label"><g:message code="metaDataset.publicAccessToClinicalData.label" default="Public Access To Clinical Data" /></span>
					
						<span class="property-value" aria-labelledby="publicAccessToClinicalData-label"><g:formatBoolean boolean="${metaDatasetInstance?.publicAccessToClinicalData}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.publicAccessToGenomicData}">
				<li class="fieldcontain">
					<span id="publicAccessToGenomicData-label" class="property-label"><g:message code="metaDataset.publicAccessToGenomicData.label" default="Public Access To Genomic Data" /></span>
					
						<span class="property-value" aria-labelledby="publicAccessToGenomicData-label"><g:formatBoolean boolean="${metaDatasetInstance?.publicAccessToGenomicData}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.referencePmid}">
				<li class="fieldcontain">
					<span id="referencePmid-label" class="property-label"><g:message code="metaDataset.referencePmid.label" default="Reference Pmid" /></span>
					
						<span class="property-value" aria-labelledby="referencePmid-label"><g:fieldValue bean="${metaDatasetInstance}" field="referencePmid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.samples}">
				<li class="fieldcontain">
					<span id="samples-label" class="property-label"><g:message code="metaDataset.samples.label" default="Samples" /></span>
					
						<span class="property-value" aria-labelledby="samples-label"><g:fieldValue bean="${metaDatasetInstance}" field="samples"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.studyDesign}">
				<li class="fieldcontain">
					<span id="studyDesign-label" class="property-label"><g:message code="metaDataset.studyDesign.label" default="Study Design" /></span>
					
						<span class="property-value" aria-labelledby="studyDesign-label"><g:fieldValue bean="${metaDatasetInstance}" field="studyDesign"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.studyDesignLevel}">
				<li class="fieldcontain">
					<span id="studyDesignLevel-label" class="property-label"><g:message code="metaDataset.studyDesignLevel.label" default="Study Design Level" /></span>
					
						<span class="property-value" aria-labelledby="studyDesignLevel-label"><g:fieldValue bean="${metaDatasetInstance}" field="studyDesignLevel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.timeScale}">
				<li class="fieldcontain">
					<span id="timeScale-label" class="property-label"><g:message code="metaDataset.timeScale.label" default="Time Scale" /></span>
					
						<span class="property-value" aria-labelledby="timeScale-label"><g:fieldValue bean="${metaDatasetInstance}" field="timeScale"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.tissueStorage}">
				<li class="fieldcontain">
					<span id="tissueStorage-label" class="property-label"><g:message code="metaDataset.tissueStorage.label" default="Tissue Storage" /></span>
					
						<span class="property-value" aria-labelledby="tissueStorage-label"><g:fieldValue bean="${metaDatasetInstance}" field="tissueStorage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${metaDatasetInstance?.tissueType}">
				<li class="fieldcontain">
					<span id="tissueType-label" class="property-label"><g:message code="metaDataset.tissueType.label" default="Tissue Type" /></span>
					
						<span class="property-value" aria-labelledby="tissueType-label"><g:fieldValue bean="${metaDatasetInstance}" field="tissueType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${metaDatasetInstance?.id}" />
					<g:link class="edit" action="edit" id="${metaDatasetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
