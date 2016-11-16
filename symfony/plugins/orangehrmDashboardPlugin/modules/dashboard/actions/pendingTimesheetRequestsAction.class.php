<?php

/**
 * Created by PhpStorm.
 * User: Marc Ghilardi
 * Date: 7/15/2016
 * Time: 2:17 PM
 */

class pendingTimesheetRequestsAction extends BaseDashboardAction {

    private $employeeService;

    public function getEmployeeService() {
        if(is_null($this->employeeService)){
            $this->employeeService = new EmployeeService();
        }
        return $this->employeeService;
    }
    
    public function preExecute() {
        $this->setLayout(false);
        parent::preExecute();
    }

    public function execute($request) {


        $this->timesheetList = array();$isAdmin = $this->getUser()->getAttribute('user')->isAdmin();

        //Get the list of employees (if admin or not)
        if ($isAdmin) {
            $this->timesheetList = array();
            $employeeList = $this->getEmployeeService()->getEmployeeList();
            $count = 0;
        } else {
            $this->timesheetList = array();
			$employeeList = $this->getUser()->getAttribute('user')->getEmployeeList();
            $count = 0;
        }
        $stateList = array("1" => "SUBMITTED");
        $count = 0;

        foreach($employeeList as $employee) {

            //Get the list of timesheets submitted but still not approved
            $pendingApprovalTimesheets = $this->getTimesheetByEmployeeIdAndState($employee->getEmpNumber(), $stateList);
            $firstName = $employee->getFirstName();
            $lastName = $employee->getLastName();
		
            foreach ($pendingApprovalTimesheets as $timesheet) {
				
                $data = $timesheet->getStartDate();
                if (strtotime($data) <= strtotime(date('Y-m')) && date(mktime(0, 0, 0, 8, 1, 2016)) <= strtotime($data)) {
					$timesheetData = array();
                    $timesheetData['lastName'] = $lastName;
                    $timesheetData['firstName'] = $firstName;
                    $timesheetData['timesheetId'] = $timesheet->getTimesheetId();
                    $timesheetData['empId'] = $timesheet->getEmployeeId();
                    $timesheetData['date'] = date("Y",strtotime($data)) . " " . date("F",strtotime($data));
                    $timesheetStartDate[$count] = $timesheetData['date'];
                    $this->timesheetList[$count] = $timesheetData;
                    $count++;
                }
            }
        }
        //Get the number of timesheets
        $this->recordCount = count($this->timesheetList);
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
