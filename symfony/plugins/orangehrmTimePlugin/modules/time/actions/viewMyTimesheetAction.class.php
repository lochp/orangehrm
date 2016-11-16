<?php

/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com
 *
 * OrangeHRM is free software; you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301, USA
 */
class viewMyTimesheetAction extends baseTimeAction {

    private $timesheetService;
    private $timesheetActionLog;
    public $timesheetStartingDate;
    private $timesheetPeriodService;
    private $employeeService;

    //Marc Modif 7/13/2016
    //Set the Service for Holidays, Countries and Employees
    private $holidayService;
    private $operationalCountryService;

    /**
     * Returns OperationalCountry Service
     * @returns OperationalCountryService
     */
    public function getOperationalCountryService() {
        if (!($this->operationalCountryService instanceof OperationalCountryService)) {
            $this->operationalCountryService = new OperationalCountryService();
        }
        return $this->operationalCountryService;
    }

    /**
     * Set method for OperationalCountry Service
     * @param OperationalCountryService $operationalCountryService
     */
    public function setOperationalCountryService(OperationalCountryService $operationalCountryService) {
        $this->operationalCountryService = $operationalCountryService;
    }

    /**
     * Set method for Holiday Service
     * @param HolidayService $holidayService
     */
    public function setHolidayService(HolidayService $holidayService) {
        $this->holidayService = $holidayService;
    }

    /**
     * Get method for Holiday Service
     * @return HolidayService
     */
    public function getHolidayService() {
        if (!($this->holidayService instanceof HolidayService)) {
            $this->holidayService = new HolidayService();
        }
        return $this->holidayService;
    }

    public function getEmployeeService() {

        if (is_null($this->employeeService)) {
            $this->employeeService = new EmployeeService();
        }

        return $this->employeeService;
    }

    public function setEmployeeService($employeeService) {

        if ($employeeService instanceof EmployeeService) {
            $this->employeeService = $employeeService;
        }
    }

    //End modif
    
    public function execute($request) {

        //timesheetStartDateFromDropDown is from the drop down
        //timesheetStartDate is from the edit timesheet
        //$startDateSelectedFromDropDown set when the user is accessing the view from the search drop down
        //$startDateOfTheTimesheetForUpdates is set when the user performs an action on the timesheet,and it is used to update the timesheet
        $this->isduplicate = $request->getParameter('isduplicate');
        $this->createTimesheetForm = new CreateTimesheetForm();
        $this->currentDate = date('Y-m-d');
        $this->headingText = $this->getTimesheetPeriodService()->getTimesheetHeading();

        $this->successMessage = array($request->getParameter('message[0]'), $request->getParameter('message[1]'));
        $startDateSelectedFromDropDown = $request->getParameter('timesheetStartDateFromDropDown');

        $userRoleManager = $this->getContext()->getUserRoleManager();
        $user = $userRoleManager->getUser();
        $userId = $user->getId();
        $employeeId = $this->getUser()->getEmployeeNumber();

        $this->timesheetPermissions = $this->getDataGroupPermissions('time_employee_timesheets', $employeeId);

        $this->format = $this->getTimesheetService()->getTimesheetTimeFormat();
        $this->timeService = $this->getTimesheetService();
        if ($request->isMethod('post')) {
            $this->updateTimesheetState($request);
        }

        $this->currentDate = date('Y-m-d');
        $this->actionName = $this->getActionName();

        $startDateOfTheTimesheetForUpdates = $request->getParameter('timesheetStartDate');
        $this->dateForm = new startDaysListForm(array(), array('employeeId' => $employeeId));
        $dateOptions = $this->dateForm->getDateOptions();

        if (isset($startDateSelectedFromDropDown)) {                                   // timesheet is access via the search drop down
            $this->toggleDate = $startDateSelectedFromDropDown;
            $timesheetStartingDate = $startDateSelectedFromDropDown;
        } elseif (isset($startDateOfTheTimesheetForUpdates)) {                            // if the the user is redirecting in the same timesheet(edit,submit)
            $startDatesOfTimeSheetsAccessible = $this->getAcessibleTimesheetStartDates($dateOptions);

            if ($startDatesOfTimeSheetsAccessible == null) {

                $this->messageData = array('NOTICE', __("No Accessible Timesheets"));
                $this->redirect('time/viewMyTimesheet');
            } elseif (in_array($startDateOfTheTimesheetForUpdates, $startDatesOfTimeSheetsAccessible)) {

                $this->toggleDate = $startDateOfTheTimesheetForUpdates;
                $timesheetStartingDate = $startDateOfTheTimesheetForUpdates;
            } else {
                $timesheetStartingDate = $startDatesOfTimeSheetsAccessible[0];
            }
        } else {                                                                                                 // if the timesheet is access from the menu "My Timesheets"
            if ($dateOptions == null) {

                $statusArray = $this->getTimesheetService()->createTimesheet($employeeId, $this->currentDate);

                switch ($statusArray['state']) {
                    case $statusArray['state'] == 1:
                        $this->redirect('time/overLappingTimesheetError');
                        break;
                    case $statusArray['state'] == 2:
                        $timesheetStartingDate = $statusArray['message'];
                        break;
                    case $statusArray['state'] == 3:
                        $timesheetStartingDate = $statusArray['message'];
                        break;
                    case $statusArray['state'] == 4:
                        $timesheetStartingDate = $statusArray['message'];
                        $this->messageData = array('NOTICE', __("No Accessible Timesheets"));
                        break;
                }
            } else {

                $statusArray = $this->getTimesheetService()->createTimesheet($employeeId, $this->currentDate);

                switch ($statusArray['state']) {
                    case $statusArray['state'] == 1:
                        $this->redirect('time/overLappingTimesheetError');
                        break;
                    case $statusArray['state'] == 2:
                        $timesheetStartingDate = $statusArray['message'];
                        break;
                    case $statusArray['state'] == 3:
                        $timesheetStartingDate = $statusArray['message'];
                        $this->getTimesheetService()->createPreviousTimesheets($timesheetStartingDate, $employeeId);                                    //this creates the timesheets automatically for the past weeks, if the user have not created them
                        break;
                    case $statusArray['state'] == 4:
                        $latestDate = $this->getlatestStartDate($dateOptions);
                        $timesheetStartingDate = $latestDate;
                        break;
                }
            }
        }

        //Marc 7/13/2016 Modif

        $employee = $this->getEmployeeService()->getEmployee($employeeId);
        $cou_code = $employee->getCountry();
        $operationalCountryAux = $this->getOperationalCountryService()->getOperationalCountryForCountryCode($cou_code);
        $this->operationalCountry = $operationalCountryAux[0];

        //End Modif

        $this->timesheet = $this->getTimesheetService()->getTimesheetByStartDateAndEmployeeId($timesheetStartingDate, $employeeId);
        $this->currentState = $this->timesheet->getState();
        $this->dateForm = new startDaysListForm(array(), array('employeeId' => $employeeId));
        $dateOptions = $this->dateForm->getDateOptions();

        if ($request->getParameter('selectedIndex') != null) {

            $selectedIndex = $request->getParameter('selectedIndex');
        } else {
            $selectedIndex = $this->dateForm->returnSelectedIndex($timesheetStartingDate, $employeeId);
        }

        if (isset($selectedIndex)) {
            $this->dateForm->setDefault('startDates', $selectedIndex);
        }

        $noOfDays = $this->timesheetService->dateDiff($this->timesheet->getStartDate(), $this->timesheet->getEndDate());

        $values = array('date' => $timesheetStartingDate, 'employeeId' => $employeeId, 'timesheetId' => $this->timesheet->getTimesheetId(), 'noOfDays' => $noOfDays);
        $form = new TimesheetForm(array(), $values);

        //Marc 7/13/2016 Modif
        $this->formulaire = $form;
        //End Modif

        $this->timesheetRows = $form->getTimesheet($timesheetStartingDate, $employeeId, $this->timesheet->getTimesheetId());
        $this->currentState = $this->timesheet->getState();

        $user = new User();
        $decoratedUser = new EssUserRoleDecorator($user);

        $excludeRoles = array();
        $includeRoles = array('ESS');
        $entities = array('Employee' => $employeeId);

        $initialStateActions = $userRoleManager->getAllowedActions(PluginWorkflowStateMachine::FLOW_TIME_TIMESHEET, PluginTimesheet::STATE_INITIAL, $excludeRoles, $includeRoles, $entities);

        $this->allowedActions = $userRoleManager->getAllowedActions(PluginWorkflowStateMachine::FLOW_TIME_TIMESHEET, $this->currentState, $excludeRoles, $includeRoles, $entities);
        $this->allowedToCreateTimesheets = isset($initialStateActions[WorkflowStateMachine::TIMESHEET_ACTION_CREATE]);

        $this->rowDates = $form->getDatesOfTheTimesheetPeriod($this->timesheet->getStartDate(), $this->timesheet->getEndDate());
        $this->actionLogRecords = $this->getTimesheetService()->getTimesheetActionLogByTimesheetId($this->timesheet->getTimesheetId());

        //Check if this is an add timesheet or not
        if ($this->isduplicate){
            // Go to editTimesheet view
            $timesheetId = $this->timesheet->getTimesheetId();
            $this->redirect(url_for('time/editTimesheet') . "?employeeId=" . $employeeId . "&timesheetId=" . $timesheetId . "&actionName=" . $this->actionName . "&isduplicate=" . $this->isduplicate);

            //If it's not an add timesheet
        } else {
            // Stay in viewTimesheet view
            $this->setTemplate("viewTimesheet");
        }
    }

    protected function setTimesheetActionLog($action, $comment, $timesheetId, $employeeId) {

        $timesheetActionLog = $this->getTimesheetActionLog();
        $timesheetActionLog->setAction($action);
        $timesheetActionLog->setComment($comment);
        $timesheetActionLog->setTimesheetId($timesheetId);
        $timesheetActionLog->setDateTime(date("Y-m-d"));
        $timesheetActionLog->setPerformedBy($employeeId);

        $this->getTimesheetService()->saveTimesheetActionLog($timesheetActionLog);
    }

    protected function getTimesheetService() {

        if (is_null($this->timesheetService)) {

            $this->timesheetService = new TimesheetService();
        }

        return $this->timesheetService;
    }

    protected function getTimesheetActionLog() {

        if (is_null($this->timesheetActionLog)) {

            $this->timesheetActionLog = new TimesheetActionLog();
        }

        return $this->timesheetActionLog;
    }

    protected function getlatestStartDate($dateOptions) {
        if ($dateOptions != null) {
            $temp = $dateOptions[0];
            $tempArray = explode(" ", $temp);
            return $tempArray[0];
        } else {
            return null;
        }
    }

    protected function getAcessibleTimesheetStartDates($dateOptions) {
        if ($dateOptions != null) {
            for ($i = 0; $i < sizeof($dateOptions); $i++) {
                $options = explode(" ", $dateOptions[$i]);
                $datesArray[$i] = $options[0];
            }
            return $datesArray;
        } else {
            return null;
        }
    }

    protected function updateTimesheetState($request) {
        
        $timesheetStartDate = $request->getParameter('timesheetStartDate');
        if (empty($timesheetStartDate)) {
            $timesheetStartDate = $request->getParameter('timesheetStartDateFromDropDown');            
        }
        
        $employeeId = $request->getParameter('employeeId');
        $timesheet = $this->getTimesheetService()->getTimesheetByStartDateAndEmployeeId($timesheetStartDate, $employeeId);
        
        $action = $request->getParameter('act');

        // check if action allowed and get next state
        $excludeRoles = array();
        $includeRoles = array('ESS');
        $entities = array('Employee' => $employeeId);

        $userRoleManager = $this->getContext()->getUserRoleManager();
        $allowedActions = $userRoleManager->getAllowedActions(PluginWorkflowStateMachine::FLOW_TIME_TIMESHEET, 
                $timesheet->getState(), $excludeRoles, $includeRoles, $entities);

        if (isset($allowedActions[$action])) {

            $state = $allowedActions[$action]->getResultingState();
            $this->successMessage = array('success', __("Timesheet " . ucwords(strtolower($state))));

            $timesheet->setState($state);
            $timesheet = $this->getTimesheetService()->saveTimesheet($timesheet);

            if ($request->getParameter('updateActionLog')) {

                $comment = $request->getParameter('Comment');
                $userId = $userRoleManager->getUser()->getId();
                
                if ($action == WorkflowStateMachine::TIMESHEET_ACTION_RESET) {
                    $this->setTimesheetActionLog(Timesheet::RESET_ACTION, $comment, $timesheet->getTimesheetId(), $userId);
                } else {
                    $this->setTimesheetActionLog($state, $comment, $timesheet->getTimesheetId(), $userId);
                }

                if ($action == WorkflowStateMachine::TIMESHEET_ACTION_SUBMIT) {
                    $this->successMessage = array('success', __("Timesheet Submitted"));
                }
            }
        } 

        return $timesheet;
    }

    protected function getTimesheetPeriodService() {

        if (is_null($this->timesheetPeriodService)) {

            $this->timesheetPeriodService = new TimesheetPeriodService();
        }

        return $this->timesheetPeriodService;
    }

}
