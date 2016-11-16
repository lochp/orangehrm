$(document).ready(function() {
   
    if($('#addPerformanceObjective_hdnMode').val() != 'edit'){
        $('#performanceObjective').hide();
    }else{         
        $('#btnAdd').hide();
    }
             
    $('#btnAssignEmployee').click(function() {
        return !$('#addPerformanceObjective_availableEmp option:selected').remove().appendTo('#addPerformanceObjective_assignedEmp');  
    }); 
    
    $('#btnRemoveEmployee').click(function() {  
        return !$('#addPerformanceObjective_assignedEmp option:selected').remove().appendTo('#addPerformanceObjective_availableEmp');  
    }); 
    
    $('#btnAdd').click(function() {
        resetMultipleSelectBoxes();
        $('#performanceObjective').show();        
        $('#btnAdd').hide();
    });
  
   
    $('#btnSave').click(function() {
        
        var selected = $.map( $('#addPerformanceObjective_assignedEmp option'),
            function(e) {
                return $(e).val();
            } );
        $('#addPerformanceObjective_assignedEmp').val(selected);
        $('#frmaddPerformanceObjective').submit();
        
    });
  
    $('#btnCancel').click(function() {
        //reload the page.  performance/addPerformanceObjective
        window.location = addPerformanceObjectiveUrl;
    });

    /*remove the employee name from available Reviewers based on the employee name selection.*/
    /*Can add only the names in employeelist */        
    $.validator.addMethod("validName", function() {
        var newEmpName =$.trim($('#addPerformanceObjective_employeeName_empName').val()).toLowerCase();
        //alert(newEmpName);
        var valid = false;
        empCount = employeeList.length;
        for (var j=0; j < empCount; j++) {
            empName = employeeList[j].name.toLowerCase(); 
            if(empName == newEmpName){
                empId = employeeList[j].id;
                $('#addPerformanceObjective_employeeName_empId').val(empId);
                valid = true;
                break;
            }
        }       		
        return valid;
    });
   
    /*employee can not add as his own reviewer*/        
    $.validator.addMethod("validReviewer", function() {
        var newEmpId = $('#addPerformanceObjective_employeeName_empId').val();
        var validReviewer = true;
        
        assigendReviewers = $.map( $('#addPerformanceObjective_assignedEmp option'),
            function(e) {
                return $(e).val();
            } );        
        
        reviewersCount = assigendReviewers.length;
        for (var j=0; j < reviewersCount; j++) {            
            empId = assigendReviewers[j];
            if(empId == newEmpId){
                validReviewer = false;
                break;
            }
        }        		
        return validReviewer;
    });    


   
    /*Validate add performance Objective form*/    
    var validator = $("#frmaddPerformanceObjective").validate({

        rules: {
            'addPerformanceObjective[employeeName][empName]' : {
                validName : true,
                maxlength: 50
            },
            'addPerformanceObjective[assignedEmp][]' : {
                required:true,
                validReviewer:true                
            },
            'addPerformanceObjective[objective_name]':{
                required : true,
                maxlength : 200
            }
        },
        messages: {
            'addPerformanceObjective[employeeName][empName]' : {
                validName: lang_invalid_name,
                maxlength: lang_exceed50Charactors
            },
            'addPerformanceObjective[assignedEmp][]' : {
                required: lang_NameRequired,
                validReviewer: lang_invalid_assign
            },
            'addPerformanceObjective[objective_name]':{
                required: lang_NameRequired
            }
        }

    });

    /*delete button*/    
    $('#btnDelete').attr('disabled', 'disabled');
    
    /*$('#btnDelete').click(function(){
        $('#frmList_ohrmListComponent').submit();
    });*/
    
    /* Delete confirmation controls: Begin */
    $('#frmList_ohrmListComponent').attr('name','frmList_ohrmListComponent');
    $('#dialogDeleteBtn').click(function() {
        document.frmList_ohrmListComponent.submit();
    });
    /* Delete confirmation controls: End */
    
    $("#ohrmList_chkSelectAll").click(function() {
        if($(":checkbox").length == 1) {
            $('#btnDelete').attr('disabled','disabled');
        }
        else {
            if($("#ohrmList_chkSelectAll").is(':checked')) {
                $('#btnDelete').removeAttr('disabled');
            } else {
                $('#btnDelete').attr('disabled','disabled');
            }
        }
    });
        
    $(':checkbox[name*="chkSelectRow[]"]').click(function() {
        if($(':checkbox[name*="chkSelectRow[]"]').is(':checked')) {
            $('#btnDelete').removeAttr('disabled');
        } else {
            $('#btnDelete').attr('disabled','disabled');
        }
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





