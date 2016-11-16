<?php

/**
 * Created by PhpStorm.
 * User: Marc Ghilardi
 * Date: 7/15/2016
 * Time: 2:17 PM
 */

class missingTimesheetAction extends BaseDashboardAction {

    public function preExecute() {
        $this->setLayout(false);
        parent::preExecute();
    }

    // todo : timesheets RESET !
    // todo : link to the timesheet

    public function execute($request) {

        // Get the basic informations
		
        $employeeId = $this->getUser()->getEmployeeNumber();
        $this->timesheetList = array();
        $this->empId = $employeeId;
        $timesheets = $this->getTimesheetByEmployeeId($employeeId);
        $startDates = $this->getStartDates($timesheets);
        $count = 0;

        $dates = array();

        foreach($startDates as $startDate){
            $dates[] = date('Y-m',strtotime($startDate));
        }
        $this->dates = $dates;
        //get the employee start date in date format
        $systemUser = $this->getSystemUserService()->getSystemUser($employeeId);
        $this->dateEntered = strtotime($systemUser['date_entered']);

        $this->endDate = strtotime(date('Y-m'));
		
        //$startDateEntered = max($this->dateEntered,date(mktime(0, 0, 0, 8, 1, 2016)));
		
		//Take 3 months before the current date
		$startDateEntered = max($this->dateEntered,date(mktime(0,0,0,date('m')-3,1,date('Y'))));
		$startDateEntered = max($startDateEntered,date(mktime(0, 0, 0, 8, 1, 2016)));
		
        for($i = $startDateEntered; $i < $this->endDate; $i += strtotime('+1 month', 0)) {
			
            if (!(in_array(date('Y-m',$i),$dates))) {
                $timesheetData = array();
                $timesheetData['date'] = date('Y F',$i);
                $timesheetStartDate[$count] = $timesheetData['date'];
                $this->timesheetList[$count] = $timesheetData;
                $count++;
            }
        }
		
		if (intval(date('d')) > 20) {
			if (!(in_array(date('Y-m'),$dates))) {
                $timesheetData = array();
                $timesheetData['date'] = date('Y F',strtotime(date('Y-m')));
                $timesheetStartDate[$count] = $timesheetData['date'];
                $this->timesheetList[$count] = $timesheetData;
                $count++;
            }
		}
		

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

    public function getTimesheetByEmployeeIdAndState($employeeId, $state) {
        $result = $this->getTimesheetService()->getTimesheetByEmployeeIdAndState($employeeId, $state);
        return $result;
    }

    public function getTimesheetByEmployeeId($employeeId){
        $timesheetService = $this->getTimesheetService();

        return $timesheetService->getTimesheetByEmployeeId($employeeId);
    }

    public function getStartDates($timesheets){
        $dateOptions = array();

        $i = 0;
        if($timesheets != null){

            foreach ($timesheets as $timesheet) {

                $dateOptions[$i] = $timesheet->getStartDate();
                $i++;
            }
        }
        $this->dateOptions = array_reverse($dateOptions);

        return array_reverse($dateOptions);
    }

}
