$(document).ready(function() { 
    
    /*Validate add performance Objective Log form*/    
    var validator = $("#frmAddperformanceObjectiveLog").validate({
        rules: {
            'addperformanceObjectiveLog[log]' : {
                required:true,
                maxlength: 150
            },
            'addperformanceObjectiveLog[comment]' : {
                required:true,
                maxlength: 3000
            }
        },
        messages: {
            'addperformanceObjectiveLog[log]' : {
                required: lang_NameRequired,
                maxlength: lang_exceed150Charactors
            },
            'addperformanceObjectiveLog[comment]' : {
                required: lang_NameRequired,
                maxlength: lang_exceed3000Charactors
            }
            
        }

    });

    
    //open when the pencil mark got clicked
    $('.dialogInvoker').click(function(){
        $('#ajaxCommentSaveMsg').html('').removeAttr('class');      
        
        //removing errors message in the comment box
        $("#commentError").html("");
        
        /* Extracting the request id */
        var id = $(this).parent().siblings('input[id^="hdnObjectiveLog_"]').val();
        /*if (!id) {
            id = $(this).parent().siblings('input[id^="hdnLeave_"]').val();
        }*/
        var comment = $('#hdnObjectiveLogComment-' + id).val();
        $('#commentSave').show();
        //disable edit comment for ess for pending approval leave
        if(false) {
            $('#commentSave').hide();
        }
        $('#objectiveLogId').val(id);
        $('#objectiveLogComment').val(comment);
        
        // If leave comment is empty , enable the edit mode
        if( $('#objectiveLogComment').val().trim() =="") {
            $("#objectiveLogComment").removeAttr("disabled");
            $("#commentSave").attr("value", lang_save);
        } else {
            $("#objectiveLogComment").attr("disabled","disabled");
            $("#commentSave").attr("value", lang_edit);
        }
        $('#commentDialog').modal();
        
    }); 
    
    //on clicking on save button
    $("#commentSave").click(function() {
        if($("#commentSave").attr("value") == lang_edit) {
            $("#objectiveLogComment").removeAttr("disabled");
            $("#commentSave").attr("value", lang_save);
            return;
        }

        if($('#commentSave').attr('value') == lang_save) {
            $('#commentError').html('');
            var comment = $('#objectiveLogComment').val().trim();
            if(comment.length > 250) {
                $('#commentError').html(lang_length_exceeded_error);
                return;
            }

            /* Setting the comment in the label */
            var commentLabel = trimComment(comment);

            /* If there is no-change between original and updated comments then don't show success message */
            if($('#hdnObjectiveLogComment-' + $("#objectiveLogId").val()).val().trim() == comment) {
                $('#commentDialog').modal('hide');
                return;
            }

            /* We set updated comment for the hidden comment field */
            $('#hdnObjectiveLogComment-' + $('#objectiveLogId').val()).val(comment);

            /* Posting the comment */
            var url = commentUpdateUrl;
            var data = 'objectiveLogId=' + $('#objectiveLogId').val() + '&objectiveLogComment=' + encodeURIComponent(comment);
   
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(flag) {
                    $('#ajaxCommentSaveMsg').removeAttr('class').html('');
                    $('.messageBalloon_success').remove(); 
                    if(flag == 1) {
                        var id = $('#objectiveLogId').val();
                         
                        $('#commentContainer-' + id).html(commentLabel);
                        $('#hdnObjectiveLogComment-' + id).val(comment);
                        $('#noActionsSelectedWarning').remove();
                        
                        //$('#helpText').before(content);
                        
                        //$('#ajaxCommentSaveMsg')
                        $('#helpText').before('<div class="message success fadable">' + lang_comment_successfully_saved + '<a href="#" class="messageCloseButton">' + lang_Close + '</a></div>');
                        setTimeout(function(){
                            $("div.fadable").fadeOut("slow", function () {
                                $("div.fadable").remove();
                            });
                        }, 2000);
                    } 
                }
            });

            $("#commentDialog").modal('hide');
            return;
        }
    });
    
    /*handling model box end*/
    
    if($('#addperformanceObjectiveLog_hdnMode').val() != 'edit'){
        $('#performanceObjectiveLog').hide();
    }else{         
        $('#btnAdd').hide();
    }
    /*             
    $('#btnAssignEmployee').click(function() {
        return !$('#addPerformanceObjective_availableEmp option:selected').remove().appendTo('#addPerformanceObjective_assignedEmp');  
    }); 
    
    $('#btnRemoveEmployee').click(function() {  
        return !$('#addPerformanceObjective_assignedEmp option:selected').remove().appendTo('#addPerformanceObjective_availableEmp');  
    }); 
    */
    $('#btnAdd').click(function() { 
        
        $('#performanceObjectiveLog').show();        
        $('#btnAdd').hide();
    });
  
    $('#saveBtn').click(function() {

        $('#frmAddperformanceObjectiveLog').submit();
        
    });
    
    $('#resetBtn').click(function() { 
        $('#btnAdd').show();
        
        //resetting all the form fields except addperformanceObjectiveLog_hdnTrckId field.
        $("#addperformanceObjectiveLog_hdnLogId").val("");
        $("#addperformanceObjectiveLog_hdnMode").val("");
        $("#addperformanceObjectiveLog_log").val("");
        $("#addperformanceObjectiveLog_comment").val("");
        $("#addperformanceObjectiveLog_achievement").find('option:first').attr('selected','selected');

        $('#performanceObjectiveLog').hide();
        $('.top').show();
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


function trimComment(comment) {
    if (comment.length > 35) {
        comment = comment.substr(0, 35) + '...';
    }
    return comment;
}




