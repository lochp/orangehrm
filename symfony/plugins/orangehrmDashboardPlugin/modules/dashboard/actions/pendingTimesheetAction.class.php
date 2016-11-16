<?php

/**
 * Created by PhpStorm.
 * User: Marc Ghilardi
 * Date: 7/15/2016
 * Time: 2:17 PM
 */
class pendingTimesheetAction extends BaseDashboardAction {

    public function preExecute() {
        $this->setLayout(false);
        parent::preExecute();
    }

    public function execute($request) {

        //Get the basic informations
        $employeeId = $_SESSION['user'];
        $this->timesheetList = array();
        $stateList = array("1" => "SUBMITTED");

        //Get the list of timesheets
        $pendingApprovalTimesheets = $this->getTimesheetByEmployeeIdAndState($employeeId, $stateList);
        $count = 0;

        foreach ($pendingApprovalTimesheets as $pendingApprovalTimesheet) {

            $timesheetData = array();
            $timesheetData['date'] = $pendingApprovalTimesheet->getStartDate();
            $timesheetStartDate[$count] = $timesheetData['date'];
            $this->timesheetList[$count] = $timesheetData;
            $count ++;
        }
        // Get the number of timesheets
        $this->recordCount = count($this->timesheetList);
        // (array_multisort($timesheetStartDate, SORT_ASC, $employeeLastName, SORT_ASC, $this->timesheetList));
    }

    public function getEmployeeFilter($mode, $empNumber) {
        $userDetails = $this->getLoggedInUserDetails();
        $loggedInEmpNumber = $userDetails['loggedUserEmpId'];
        $employeeFilter = null;

        if ($mode == timesheetListForm::MODE_MY_LEAVE_LIST) {
            $employeeFilter = $loggedInEmpNumber;
        } else {
            $requiredPermissions = array(
                BasicUserRoleManager::PERMISSION_TYPE_DATA_GROUP => array(
                    'timesheet_list' => new ResourcePermission(true, false, false, false)
                )
            );
            $manager = $this->getContext()->getUserRoleManager();
            $accessibleEmpIds = $manager->getAccessibleEntityIds('Employee', null, null, array(), array(), $requiredPermissions);

            if (empty($empNumber)) {
                $employeeFilter = $accessibleEmpIds;
            } else {
                if (in_array($empNumber, $accessibleEmpIds)) {
                    $employeeFilter = $empNumber;
                } else {
                    // Requested employee is not accessible.
                    $employeeFilter = array();
                }
            }
        }
        return $employeeFilter;
    }

    public function getDateRange() {
        return new DateRange(date("Y-m-01", strtotime("- 1 month")), date("Y-m-t", strtotime("+ 1 month")));
    }

    //Marc 7/15/2016 Modif

    public function getTimesheetByEmployeeIdAndState($employeeId, $stateList) {
        return $this->getTimesheetService()->getTimesheetByEmployeeIdAndState($employeeId, $stateList);
    }

    public function getStartDates($employeeId){
        $timesheetService = $this->getTimesheetService();

        $timesheets = $timesheetService->getTimesheetByEmployeeId($employeeId);
        $dateOptions = array();
        $dateOptionsToDrpDwn = array();

        $i = 0;
        if($timesheets != null){

            foreach ($timesheets as $timesheet) {

                $dateOptions[$i] = $timesheet->getStartDate();
                $dateOptionsToDrpDwn[$i] = set_datepicker_date_format($timesheet->getStartDate() ). " ".__("to")." "  . set_datepicker_date_format($timesheet->getEndDate());
                $i++;
            }
        }
        $this->dateOptions = array_reverse($dateOptions);

        return array_reverse($dateOptions);
    }
}
