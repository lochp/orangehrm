<?php

/**
 * Created by PhpStorm.
 * User: Marc Ghilardi
 * Date: 7/15/2016
 * Time: 2:17 PM
 */

class draftTimesheetRequestsAction extends BaseDashboardAction {

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

        $this->timesheetList = array();

        //Get the list of employees subordinated or of all employees
        $isAdmin = $this->getUser()->getAttribute('user')->isAdmin();
        if ($isAdmin) {
            $employeeList = $this->getEmployeeService()->getEmployeeList();
        } else {
            $employeeList = $this->getUser()->getAttribute('user')->getEmployeeList();
            //$employeeList = $this->getEmployeeService()->getSubordinateList($_SESSION['user']);
        }

        $stateList = array("1" => "NOT SUBMITTED");
        $count = 0;

        foreach($employeeList as $employee) {

            // Get the list of timesheets
            $pendingApprovalTimesheets = $this->getTimesheetByEmployeeIdAndState($employee->getEmpNumber(), $stateList);
            $firstName = $employee->getFirstName();
            $lastName = $employee->getLastName();

            //Look if the employee has to submit timesheets
            $mailRequired = $employee->getCustom1();
            if ($mailRequired && $mailRequired == "Yes") {

                foreach ($pendingApprovalTimesheets as $timesheet) {
                    $data = $timesheet->getStartDate();
                    //timesheet is not due until the month has lapsed (ie. after the first of next month)
                    if (strtotime($data) < strtotime(date('Y-m')) && strtotime($data) >= date(mktime(0, 0, 0, 8, 1, 2016))) {
                        $timesheetData = array();
                        $timesheetData['lastName'] = $lastName;
                        $timesheetData['firstName'] = $firstName;
                        $timesheetData['timesheetId'] = $timesheet->getTimesheetId();
                        $timesheetData['empId'] = $timesheet->getEmployeeId();
                        $timesheetData['date'] = date("Y", strtotime($data)) . " " . date("F", strtotime($data));
                        $timesheetStartDate[$count] = $timesheetData['date'];
                        $this->timesheetList[$count] = $timesheetData;
                        $count++;
                    }
                }
            }
        }
        //get the number of timesheets
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
