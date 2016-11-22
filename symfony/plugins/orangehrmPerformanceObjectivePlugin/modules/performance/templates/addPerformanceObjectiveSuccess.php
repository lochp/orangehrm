<?php use_javascript('../orangehrmPerformanceObjectivePlugin/js/addPerformanceObjectiveSuccess'); 
use_javascripts_for_form($form);
use_stylesheets_for_form($form);
?>
    <!-- Loc modified -->
<div class="box " id="performance-list-search">
    <div class="head">
        <h1><?php echo __('Search Performance Objectives') ?></h1>
    </div>
    <div class="inner">
        <form id="performanceObjectiveSearchForm" name="performanceObjectiveSearchForm" method="post" action="">
            <fieldset>                
                <ol>
                    <?php echo $searchForm->render(); ?>
                    <input type="hidden" name="pageNo" id="pageNo" value="" />
                    <input type="hidden" name="hdnAction" id="hdnAction" value="search" />     
                </ol>                            
                <p>
                    <input type="button" class="applybutton" id="searchBtn" value="<?php echo __('Search'); ?>" title="<?php echo __('Search'); ?>"/> 
                    <input type="button" class="reset" name="_reset" value="<?php echo __('Reset'); ?>" title="<?php echo __('Reset'); ?>" id="btnReset" >
                </p>                
            </fieldset>

        </form>

    </div> 
    <a href="#" class="toggle tiptip" title="<?php echo __(CommonMessages::TOGGABLE_DEFAULT_MESSAGE); ?>">&gt;</a>
</div>
<!-- End -->

<div id="performanceObjective" class="box">
    
        
    <div class="head">
        <h1 id="performanceObjectiveHeading"><?php echo __("Add Performance Objective"); ?></h1>
    </div>
    
    <div class="inner">
        <form name="frmaddPerformanceObjective" id="frmaddPerformanceObjective" method="post" action="<?php echo url_for('performance/addPerformanceObjective'); ?>" >

            <?php echo $form['_csrf_token']; ?>
            <?php echo $form->renderHiddenFields(); ?>
            
            <fieldset>
                
                <ol>       
                	<li width="50%">
                        <?php echo $form['objective_group']->renderLabel(__('Objective Group'). ' <em>*</em>'); ?>
                        <?php echo $form['objective_group']->render(array("class" => "formInput", "maxlength" => 200, "style" => "width: 41%")); ?>
                    </li>   
                    <li width="50%">
                        <?php echo $form['objective_name']->renderLabel(__('Objective Name'). ' <em>*</em>'); ?>
                        <?php echo $form['objective_name']->render(array("class" => "formInput", "maxlength" => 200, "style" => "width: 40%")); ?>
                    </li>
                    <li>
                        <?php echo $form['objective_description']->renderLabel(__('Description of Objective')); ?>
                        <?php echo $form['objective_description']->render(array("style" => "width: 40%")); ?>
                    </li>
                    <li>
                        <?php echo $form['employeeName']->renderLabel(__('Employee Name'). ' <em>*</em>'); ?>
                        <?php echo $form['employeeName']->render(array("class" => "formInput", "maxlength" => 52, "style" => "width: 40%")); ?>
                    </li>
                    <li>
                        <?php echo $form['target_date']->renderLabel(__('Target Date'). ' <em>*</em>'); ?>
                        <?php echo $form['target_date']->render(); ?>
                    </li>
                    <p id="selectManyTable">
                        <table border="0" width="45%" class="">
                            <tbody>
                                <tr>
                                    <td width="35%" style="font-weight:bold; height: 20px">
                                        <?php echo __("available Reviewers"); ?>
                                    </td>
                                    <td width="30%"></td>
                                    <td width="35%" ><span style="font-weight: bold"><?php echo __("added Reviewers"); ?></span><em style="color: #AA4935"> *</em></td>
                                </tr>
                                    <td>
                                        <?php echo $form['availableEmp']->render(array("class" => "selectMany", "size" => 10, "style" => "width: 100%")); ?>	
                                    </td>
                                    <td align="center" style="vertical-align: middle">
                                        
                                        <input type="button" style="width: 70%;" value="<?php echo __("Add"). " >"; ?>" class="" id="btnAssignEmployee" name="btnAssignEmployee">
                                        <br><br>
										<input type="button" style="width: 70%;" value="<?php echo "< ".__("Remove"); ?>" class="delete" id="btnRemoveEmployee" name="btnRemoveEmployee">
                                     
                                    </td>
                                    <td>
                                        <?php echo $form['assignedEmp']->render(array("class" => "selectMany", "size" => 10, "style" => "width: 100%")); ?>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </p>
                    <li class="required">
                        <em>*</em> <?php echo __(CommonMessages::REQUIRED_FIELD); ?>
                    </li>                    
                </ol>
                
                <p>
                    <input type="button" class="" name="btnSave" id="btnSave" value="<?php echo __("Save"); ?>"/>
                    <input type="button" class="reset" name="btnCancel" id="btnCancel" value="<?php echo __("Cancel"); ?>"/>
                </p>
                
            </fieldset>
            
        </form>
        
        
    </div>
    
</div>

    <?php include_component('core', 'ohrmList'); ?>

<!-- Confirmation box HTML: Begins -->
<div class="modal hide" id="deleteConfModal">
  <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3><?php echo __('OrangeHRM - Confirmation Required'); ?></h3>
  </div>
  <div class="modal-body">
    <p><?php echo __(CommonMessages::DELETE_CONFIRMATION); ?></p>
  </div>
  <div class="modal-footer">
    <input type="button" class="btn" data-dismiss="modal" id="dialogDeleteBtn" value="<?php echo __('Ok'); ?>" />
    <input type="button" class="btn reset" data-dismiss="modal" value="<?php echo __('Cancel'); ?>" />
  </div>
</div>
<!-- Confirmation box HTML: Ends -->



<script type="text/javascript">
    var addPerformanceObjectiveUrl = "<?php echo url_for("performance/addPerformanceObjective"); ?>";
	var employees = <?php echo str_replace('&#039;', "'", $form->getEmployeeListAsJson());?>;
	var employeeList = eval(employees);
	var lang_NameRequired = '<?php echo __(ValidationMessages::REQUIRED); ?>';
	var lang_exceed50Charactors = '<?php echo __(ValidationMessages::TEXT_LENGTH_EXCEEDS, array('%amount%' => 50)); ?>';
	var lang_hoursRequired = '<?php echo __(ValidationMessages::REQUIRED); ?>';
	var lang_notNumeric = '<?php echo __("Should be a positive number"); ?>';
	var lang_possitiveNumber = "<?php echo __("Should be a positive number"); ?>";
	var lang_lessThan24 = '<?php echo __("Should be less than %amount%", array("%amount%" => '24')); ?>';
	var lang_nameAlreadyExist = '<?php echo __(ValidationMessages::ALREADY_EXISTS); ?>';
	var workShiftInfoUrl = "<?php echo url_for("admin/getWorkShiftInfoJson?id="); ?>";
	var workShiftEmpInfoUrl = "<?php echo url_for("admin/getWorkShiftEmpInfoJson?id="); ?>";
    var lang_invalid_name = "<?php echo __("invalid name")?>";
    var lang_invalid_assign = "<?php echo __("Employee cannot be assigned as his own reviewer")?>";
        
</script>

<script>
    $(document).ready(function () {
    	$('#searchBtn').click(function () {
            $('#performanceObjectiveSearchForm').submit();
        });
    	$('#btnReset').click(function () {
            $("#performanceObjectiveSearchForm_employeeName_empName").val('');
            $("#performanceObjectiveSearchForm_employeeName_empId").val('');
            $("#fromDate").val('yyyy-mm-dd');
            $("#toDate").val('yyyy-mm-dd');
            $('#performanceObjectiveSearchForm').submit();
        });
    });
</script>    