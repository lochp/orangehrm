$(document).ready(function() {
    
    
    $('#resultTable tbody td:first-child').each(function(){
      //  $(this).html($(this).text());
    }
    );
        
    //$('#btnAdd').hide();
    
    $('#commentSave').hide();
    $('.dialogInvoker').click(function(){
        var id = $(this).parent().siblings('input[id^="hdnObjectiveLog_"]').val();
        var comment = $('#hdnObjectiveLogComment-' + id).val();
        $('#objectiveLogComment').val(comment);
        $("#objectiveLogComment").attr("disabled","disabled");
        $('#commentDialog').modal();
        
    });
});


function resetMultipleSelectBoxes(){ 
    
    $('#addPerformanceObjective_assignedEmp')[0].options.length = 0;
    $('#addPerformanceObjective_availableEmp')[0].options.length = 0;

    for(var i=0; i<employeeList.length; i++){
        $('#addPerformanceObjective_availableEmp').
        append($("<option></option>").
            attr("value",employeeList[i].id).
            text(employeeList[i].name)); 
    }
}





