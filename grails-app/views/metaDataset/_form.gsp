<%@ page import="org.broadinstitute.cancer.clinout.domain.MetaDataset" %>



<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'accessionInPublicDatabase', 'error')} ">
	<label for="accessionInPublicDatabase">
		<g:message code="metaDataset.accessionInPublicDatabase.label" default="Accession In Public Database" />
		
	</label>
	<g:textField name="accessionInPublicDatabase" value="${metaDatasetInstance?.accessionInPublicDatabase}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'assayPlatform', 'error')} ">
	<label for="assayPlatform">
		<g:message code="metaDataset.assayPlatform.label" default="Assay Platform" />
		
	</label>
	<g:textField name="assayPlatform" value="${metaDatasetInstance?.assayPlatform}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="metaDataset.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${metaDatasetInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'datasetId', 'error')} ">
	<label for="datasetId">
		<g:message code="metaDataset.datasetId.label" default="Dataset Id" />
		
	</label>
	<g:textField name="datasetId" value="${metaDatasetInstance?.datasetId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'datasetName', 'error')} ">
	<label for="datasetName">
		<g:message code="metaDataset.datasetName.label" default="Dataset Name" />
		
	</label>
	<g:textField name="datasetName" value="${metaDatasetInstance?.datasetName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'disease', 'error')} ">
	<label for="disease">
		<g:message code="metaDataset.disease.label" default="Disease" />
		
	</label>
	<g:textField name="disease" value="${metaDatasetInstance?.disease}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'ethnicity', 'error')} ">
	<label for="ethnicity">
		<g:message code="metaDataset.ethnicity.label" default="Ethnicity" />
		
	</label>
	<g:textField name="ethnicity" value="${metaDatasetInstance?.ethnicity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'geographicArea', 'error')} ">
	<label for="geographicArea">
		<g:message code="metaDataset.geographicArea.label" default="Geographic Area" />
		
	</label>
	<g:textField name="geographicArea" value="${metaDatasetInstance?.geographicArea}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'medianFollowUpTime', 'error')} ">
	<label for="medianFollowUpTime">
		<g:message code="metaDataset.medianFollowUpTime.label" default="Median Follow Up Time" />
		
	</label>
	<g:textField name="medianFollowUpTime" value="${metaDatasetInstance?.medianFollowUpTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'molecularInformation', 'error')} ">
	<label for="molecularInformation">
		<g:message code="metaDataset.molecularInformation.label" default="Molecular Information" />
		
	</label>
	<g:textField name="molecularInformation" value="${metaDatasetInstance?.molecularInformation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'organ', 'error')} ">
	<label for="organ">
		<g:message code="metaDataset.organ.label" default="Organ" />
		
	</label>
	<g:textField name="organ" value="${metaDatasetInstance?.organ}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'outcome', 'error')} ">
	<label for="outcome">
		<g:message code="metaDataset.outcome.label" default="Outcome" />
		
	</label>
	<g:textField name="outcome" value="${metaDatasetInstance?.outcome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'outcomeType', 'error')} ">
	<label for="outcomeType">
		<g:message code="metaDataset.outcomeType.label" default="Outcome Type" />
		
	</label>
	<g:textField name="outcomeType" value="${metaDatasetInstance?.outcomeType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'patientEnrollment', 'error')} ">
	<label for="patientEnrollment">
		<g:message code="metaDataset.patientEnrollment.label" default="Patient Enrollment" />
		
	</label>
	<g:textField name="patientEnrollment" value="${metaDatasetInstance?.patientEnrollment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'publicAccessToClinicalData', 'error')} ">
	<label for="publicAccessToClinicalData">
		<g:message code="metaDataset.publicAccessToClinicalData.label" default="Public Access To Clinical Data" />
		
	</label>
	<g:checkBox name="publicAccessToClinicalData" value="${metaDatasetInstance?.publicAccessToClinicalData}" />
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'publicAccessToGenomicData', 'error')} ">
	<label for="publicAccessToGenomicData">
		<g:message code="metaDataset.publicAccessToGenomicData.label" default="Public Access To Genomic Data" />
		
	</label>
	<g:checkBox name="publicAccessToGenomicData" value="${metaDatasetInstance?.publicAccessToGenomicData}" />
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'referencePmid', 'error')} ">
	<label for="referencePmid">
		<g:message code="metaDataset.referencePmid.label" default="Reference Pmid" />
		
	</label>
	<g:textField name="referencePmid" value="${metaDatasetInstance?.referencePmid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'samples', 'error')} required">
	<label for="samples">
		<g:message code="metaDataset.samples.label" default="Samples" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="samples" required="" value="${fieldValue(bean: metaDatasetInstance, field: 'samples')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'studyDesign', 'error')} ">
	<label for="studyDesign">
		<g:message code="metaDataset.studyDesign.label" default="Study Design" />
		
	</label>
	<g:textField name="studyDesign" value="${metaDatasetInstance?.studyDesign}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'studyDesignLevel', 'error')} ">
	<label for="studyDesignLevel">
		<g:message code="metaDataset.studyDesignLevel.label" default="Study Design Level" />
		
	</label>
	<g:textField name="studyDesignLevel" value="${metaDatasetInstance?.studyDesignLevel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'timeScale', 'error')} ">
	<label for="timeScale">
		<g:message code="metaDataset.timeScale.label" default="Time Scale" />
		
	</label>
	<g:textField name="timeScale" value="${metaDatasetInstance?.timeScale}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'tissueStorage', 'error')} ">
	<label for="tissueStorage">
		<g:message code="metaDataset.tissueStorage.label" default="Tissue Storage" />
		
	</label>
	<g:textField name="tissueStorage" value="${metaDatasetInstance?.tissueStorage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: metaDatasetInstance, field: 'tissueType', 'error')} ">
	<label for="tissueType">
		<g:message code="metaDataset.tissueType.label" default="Tissue Type" />
		
	</label>
	<g:textField name="tissueType" value="${metaDatasetInstance?.tissueType}"/>
</div>

