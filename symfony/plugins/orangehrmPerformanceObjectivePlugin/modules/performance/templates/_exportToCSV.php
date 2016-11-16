<input type="button" id="btnExportCsv" value="<?php echo __('Export to CSV');?>">

<script type="text/javascript">
	var exportUrl = '<?php echo url_for("performance/exportToCSV");?>';
	$(document).ready(function(){
		$("#btnExportCsv").click(function(){
			location.href = exportUrl + '?objectiveId=' + objectiveId;
		});

		$('#resetBtn').click(function() {
	        $('#btnExportCsv').show();
	    });

		$('#btnAdd').click(function() {
	        $('#btnExportCsv').hide();
	    });

		if($('#addperformanceObjectiveLog_hdnMode').val() == 'edit'){
	        $('#btnExportCsv').hide();
	    }
	});
</script>