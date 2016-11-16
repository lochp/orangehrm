<?php

/**
 * Created by PhpStorm.
 * User: Marc Ghilardi
 * Date: 7/15/2016
 * Time: 2:17 PM
 */

class missingTimesheetRequestsAction extends BaseDashboardAction {

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

        // Get the list of timesheets (admin or supervisor)
        $isAdmin = $this->getUser()->getAttribute('user')->isAdmin();
        if ($isAdmin) {
            $this->timesheetList = array();
            $employeeList = $this->getEmployeeService()->getEmployeeList();
        } else {
            $this->timesheetList = array();
            $employeeList = $this->getEmployeeService()->getSubordinateList($_SESSION['user']);
        }
        $count = 0;
        

        foreach ($employeeList as $employee) {

            //Get all the basics informations
            $employeeId = $employee->getEmpNumber();
            $firstName = $employee->getFirstName();
            $lastName = $employee->getLastName();
            $timesheets = $this->getTimesheetByEmployeeId($employeeId);
            $systemUser = $this->getSystemUserService()->getSystemUser($employee->getEmployeeId());
            $this->dateEntered = strtotime($systemUser['date_entered']);
            $startDates = $this->getStartDates($timesheets);
            $dates = array();

            //Look if the employee has to submit timesheets
            $mailRequired = $employee->getCustom1();
            if ($mailRequired && $mailRequired == "Yes") {

			       //Get all the timesheet already entered
                foreach ($startDates as $startDate) {
                    $dates[] = date('Y-m', strtotime($startDate));
                    
                }
                
                $this->dates = $dates;

                $this->endDate = strtotime(date('Y-m'));
                var_dump($lastName);
                var_dump($employeeId);
                //var_dump($systemUser);
                var_dump($this->dateEntered );
                if ($this->dateEntered) {

                    $startDateEntered = max($this->dateEntered,mktime(0, 0, 0, 8, 1, 2016));
					          $startDateEntered = max($startDateEntered, strtotime('-3 months')) ;

					          //For all previous months
					          for ($i = $startDateEntered; $i < $this->endDate; $i += strtotime('+1 month', 0)) {

                        if (!(in_array(date('Y-m', $i), $dates))) {

                            $timesheetData = array();
                            $timesheetData['date'] = date('Y F', $i);
                            $timesheetData['empId'] = $employeeId;
                            $timesheetData['lastName'] = $lastName;
                            $timesheetData['firstName'] = $firstName;
                            $timesheetStartDate[$count] = $timesheetData['date'];
                            $this->timesheetList[$count] = $timesheetData;
                            $count++;
                        }
                     }
					
					// For this month
					
					if (intval(date('d')) > 20) {
						if (!(in_array(date('Y-m'), $dates))) {
							$timesheetData = array();
							$timesheetData['date'] = date('Y F', strtotime(date('Y-m')));
							$timesheetData['empId'] = $employeeId;
							$timesheetData['lastName'] = $lastName;
							$timesheetData['firstName'] = $firstName;
							$timesheetStartDate[$count] = $timesheetData['date'];
							$this->timesheetList[$count] = $timesheetData;
							$count++;
						}
					}
                }
            }
        }

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
