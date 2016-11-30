<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Select Dataset</title>
    <r:require modules="selectDataset"/>
  </head>
  <body>
    <g:render template='/includes/systemList' />
    <g:render template='/includes/analysisWorkflow' />
    <g:render template='/includes/selectionTable' />
    <div id="criteria-tree-wrapper">
      <ul id="criteriaTree"></ul>
    </div>
    <br />
    <div>
      <div id="details" style="display: none"></div>
      <br />
      <form id="dataset-form" name="dataset-form" action="/dataset/submit">
        <input type="hidden" id="organ" name="organ" />
        <input type="hidden" id="disease" name="disease" />
        <input type="hidden" id="outcome" name="outcome" />
        <input type="hidden" id="dataset" name="dataset" />
        <button type="submit" class="float-right" id="select">Select and Next</button>&nbsp;&nbsp;<button type="reset"class="float-right" id="reset">Reset</button>
      </form>
      <br />
    </div>
  </body>
</html>
