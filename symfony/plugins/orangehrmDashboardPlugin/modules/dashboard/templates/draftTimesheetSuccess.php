<div id="task-list-group-panel-container" class="" style="height:100%; ">
    <div id="task-list-group-panel-menu_holder" class="task-list-group-panel-menu_holder" style="height:85%; overflow-x: hidden; overflow-y: auto;">
        <table class="table hover">
            <tbody>
            <?php
            if   ($recordCount > 0):
                $count = 0;
                foreach ($timesheetList as $key => $timesheetData):
                    ?>
                    <tr class="<?php echo ($count & 1) ? 'even' : 'odd' ?> center">
                        <td>
                            <a href="<?php echo url_for('time/viewMyTimesheet') . "?timesheetStartDateFromDropDown=" . date('Y-m-d',strtotime($timesheetData['date'])) . "&employeeId=" . $empNum ?>">
                                <?php
                                $count++;
                                echo date('Y',strtotime($timesheetData['date']));
                                echo " ";
                                echo date('F',strtotime($timesheetData['date']));
                                ?>
                            </a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr class="odd"><td><?php echo __("No Draft Format Timesheet"); ?></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
        <div id="total" >
        <table class="table">
            <tr class="total">
                <td style="text-align:left;padding-left:20px; cursor: pointer">
                    <?php
                    $date = draftTimesheetAction::getDateRange();
                    $dateRange = $date->getFromDate() .' '. __('to') . ' ' .$date->getToDate();
                    echo ' <span title = "' . $dateRange . '">' . __('%months% timesheet(s)', array('%months%' => $recordCount)) . '</span>';
                    ?>
                </td>
            </tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        // hover color change effect
        $("#task-list-group-panel-slider li").hover(function() {
            $(this).animate({opacity: 0.90}, 100, function(){
                $(this).animate({opacity: 1}, 0);
            } );
        });
    });

</script>