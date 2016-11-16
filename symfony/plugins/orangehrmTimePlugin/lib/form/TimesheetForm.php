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
class TimesheetForm extends sfForm {

    // Timesheet Data Access Object
    private $timesheetDao;
    private $timesheetService;
    private $timesheetPeriodService;
    private $holidayDao;
    private $holidayService;
    private $employeeDao;
    private $employeeService;
    private $operationalCountryDao;
    private $operationalCountryService;
    private $leaveRequestService;
    private $leaveRequestDao;
    public $timesheetItemValuesArray;
    public $valuesJSON;

    public function configure() {

        //Get the basic informations
        $startDate = $this->getOption('date');
        $noOfDays = $this->getOption('noOfDays');
        $employeeId = $this->getOption('employeeId');
        $isduplicate = $this->getOption('isduplicate');
        $timesheetId = $this->getOption('timesheetId');
        $values = array('noOfDays' => $noOfDays);

        //Get the services, the country and the employee
        $upskillsConfigurationService = new UpskillsConfigurationService();
        $holidayService = $this->getHolidayService();
        $employeeService = $this->getEmployeeService();
        $operationalCountryService = $this->getOperationalCountryService();
        $employee = $employeeService->getEmployee($employeeId);
        $cou_code = $employee->getCountry();
        $operationalCountryAux = $operationalCountryService->getOperationalCountryForCountryCode($cou_code);
        $operationalCountry = $operationalCountryAux[0];

        //Get the timesheet and the Id of the different projects and activities
        $tempRows = $this->getTimesheet($startDate, $employeeId, $timesheetId);
        $leavesActivityIdDoctrineObject = $upskillsConfigurationService->getValue("leavesActivityId");
        $upskillsProjectIdDoctrineObject = $upskillsConfigurationService->getValue("upskillsProjectId");
        $leavesActivityId = $leavesActivityIdDoctrineObject[0]['value'];
        $upskillsProjectId = $upskillsProjectIdDoctrineObject[0]['value'];
        $timesheet = $this->getTimesheetDao()->getTimesheetByStartDateAndEmployeeId($startDate, $employeeId);
        $endDate = $timesheet->getEndDate();
        $date = $this->getDatesOfTheTimesheetPeriod($startDate,$endDate);
        $upskillsActivitiesAlreadyDone = array();
        $timesheetRows = new sfForm();
        $valuesArray = array();

        //if the timesheet must be duplicate from the previous one
        if ($tempRows == null && $isduplicate == "true"){

            //First, the rows from the Upskills Project
            $count = 0;

            //We take the Upskills-Project and all the activities of this project
            $customerName = "Upskills"; //To get from the database
            $projectName = $this->getTimesheetService()->getProjectNameByProjectId($upskillsProjectId);
            $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($upskillsProjectId, true);
            $activityArray = null;

            foreach ($activities as $activity) :
                $activityArray[$activity['activityId']] = $activity['name'];
            endforeach;

            foreach ($activities as $activity) :
                $rowForm = new TimesheetRowForm(array(), $values);
                $activityId = $activity['activityId'];
                $activityName = $activity['name'];

                //Set the Widget
                $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                $rowForm->setDefault('projectName', $customerName . " - ##" . $projectName);
                $rowForm->setDefault('projectActivityId', $activityId);
                $rowForm->setDefault('projectId', $upskillsProjectId);
                $rowForm->setDefault('projectActivityName', $activityId);

                //Set the timesheetForm, with holidays and leaves cases
                for ($j = 0; $j < $noOfDays; $j++) {
                    if ($holidayService->isHoliday($date[$j], $operationalCountry)) :
                        if ($activityName == "Public Holiday") :
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, 8);
                        else :
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, "");
                        endif;
                    else :
                        $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                        if ($results[0]) :
                            $test = $results->getLast()->getStatus();
                            $valu = $results->getLast()->getLengthDays();
                            if ($test == 1 || $test == 2 || $test == 3) :
                                if ($activityName == "Leave") :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    if ($valu == 0.5) :
                                        $rowForm->setDefault($j, 4);
                                    else :
                                        $rowForm->setDefault($j, 8);
                                    endif;
                                else :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    $rowForm->setDefault($j, "");
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, "");
                                $rowForm->setDefault($j, "");
                            endif;
                        else :
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, "");
                        endif;
                    endif;
                }
                $timesheetRows->embedForm($count, $rowForm);

                $count++;
            endforeach;

            //Then, find the previous timesheet
            $previousTimesheet = $this->getLastTimesheet($employeeId,$startDate);

            if ($previousTimesheet) {

                foreach ($previousTimesheet as $rowArray) {

                    $projectId = $rowArray['projectId'];

                    if ($projectId && $projectId != $upskillsProjectId) {

                        $rowForm = new TimesheetRowForm(array(), $values);
                        $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($projectId, true);
                        $activityArray = null;

                        foreach ($activities as $activity) {

                            $activityId = $activity['activityId'];
                            $activityName = $activity['name'];
                            $activityIsDeleted = $activity['is_deleted'];
                            if ($activityIsDeleted != 1) {
                                $activityArray[$activityId] = $activityName;
                            }
                            if ($activityId == $rowArray['activityId'] && $activityIsDeleted == 1) {
                                $activityArray[$activityId] = $activityName;
                            }
                        }

                        //Set the Widget
                        $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                        $rowForm->setDefault('projectName', $rowArray['projectName']);
                        $rowForm->setDefault('projectActivityId', $rowArray['activityId']);
                        $rowForm->setDefault('projectId', $rowArray['projectId']);
                        $rowForm->setDefault('projectActivityName', $rowArray['activityId']);

                        $valuesArray[$count]['projectActivityName'] = new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity'));
                        $valuesArray[$count]['projectName'] = $rowArray['projectId'];
                        $valuesArray[$count]['projectActivityId'] = $rowArray['activityId'];
                        $valuesArray[$count]['projectId'] = $rowArray['projectId'];
                        $valuesArray[$count]['projectActivityName'] = $rowArray['activityId'];

                        //Set the timesheet
                        for ($j = 0; $j < $noOfDays; $j++) {
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, "");
                            $valuesArray[$count][$j] = "";
                        }
                        $timesheetRows->embedForm($count, $rowForm);
                        $count++;
                    }
                }
            }
        }
        //if the timesheet is new but not duplicate from the previous one
        elseif ($tempRows == null && $isduplicate == "false"){

            $i = 0;

            //We take the Upskills-Project and all the activities of this project
            $projectName = $this->getTimesheetService()->getProjectNameByProjectId($upskillsProjectId);
            $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($upskillsProjectId, true);
            $activityArray = null;

            foreach ($activities as $activity) :
                $activityArray[$activity['activityId']] = $activity['name'];
            endforeach;

            foreach ($activities as $activity) :
                $rowForm = new TimesheetRowForm(array(), $values);
                $activityId = $activity['activityId'];
                $activityName = $activity['name'];

                //Set the Widget
                $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                $rowForm->setDefault('projectName', "Upskills" . " - ##" . $projectName);
                $rowForm->setDefault('projectActivityId', $activityId);
                $rowForm->setDefault('projectId', $upskillsProjectId);
                $rowForm->setDefault('projectActivityName', $activityId);

                //Set the timesheet with holidays and leaves
                for ($j = 0; $j < $noOfDays; $j++) {
                    if ($holidayService->isHoliday($date[$j], $operationalCountry)) :
                        if ($activityName == "Public Holiday") :
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, 8);
                        else :
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, "");
                        endif;
                    else :
                        $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                        if ($results[0]) :
                            $test = $results[0]->getStatus();
                            $valu = $results[0]->getLengthDays();
                            if ($test == 1 || $test == 2 || $test == 3) :
                                if ($activityName == "Leave") :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    if ($valu == 0.5) :
                                        $rowForm->setDefault($j, 4);
                                    else:
                                        $rowForm->setDefault($j, 8);
                                    endif;
                                else :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    $rowForm->setDefault($j, "");
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, "");
                                $rowForm->setDefault($j, "");
                            endif;
                        else :
                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                            $rowForm->setDefault($j, "");
                        endif;
                    endif;
                }
                $timesheetRows->embedForm($i, $rowForm);

                $i++;
            endforeach;

            $emptyRowForm = new TimesheetRowForm(array(), $values);

            $emptyRowForm->setDefault('projectName', __('Type for hints') . '...');
            $emptyRowForm->setDefault('projectActivity', '-- ' . __('Select') . ' --');
            $valuesArray[0]['projectName'] = __('Type for hints') . '...';
            $valuesArray[0]['projectActivity'] = '-- ' . __('Select') . ' --';

            for ($j = 0; $j < $noOfDays; $j++) {
                $emptyRowForm->setDefault('TimesheetItemId' . $j, "");
                $emptyRowForm->setDefault($j, "");
                $valuesArray[0][$j] = "";
            }
            $timesheetRows->embedForm($i, $emptyRowForm);

        }
        //if we just have to edit the timesheet
        else{

            //calculate the number of rows
            $totalRows = sizeOf($tempRows);

            //take the values from the timesheet
            $keysArray = array_keys($tempRows[0]['timesheetItems']);

            //Define a count for the number of rows
            $count = 0;

            //for each row
            for ($i = 0; $i < $totalRows; $i++) {
                $rowForm = new TimesheetRowForm(array(), $values);

                //Find the project
                for ($j = 0; $j < $noOfDays; $j++) {
                    if ($tempRows[$i]['timesheetItems'][$keysArray[$j]]->getTimesheetId() > 0) {
                        $project = $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getProject();
                        continue;
                    }
                }

                //Get the activities
                $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($project->getProjectId(), true);
                $activityArray = null;

                //Get the activityArray for the widget
                foreach ($activities as $activity) {
                    $activityId = $activity['activityId'];
                    $activityName = $activity['name'];
                    $activityIsDeleted = $activity['is_deleted'];
                    if ($activityIsDeleted != 1) {
                        $activityArray[$activityId] = $activityName;
                    }
                    if ($activityId == $tempRows[$i]['activityId'] && $activityIsDeleted == 1) {
                        $activityArray[$activityId] = $activityName;
                    }
                }

                //Set the widget beginning (project and activities)
                $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                $rowForm->setDefault('projectName', $tempRows[$i]['projectName']);
                $rowForm->setDefault('projectActivityId', $tempRows[$i]['activityId']);
                $rowForm->setDefault('projectId', $tempRows[$i]['projectId']);
                $rowForm->setDefault('projectActivityName', $tempRows[$i]['activityId']);
                $valuesArray[$i]['projectActivityName'] = new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity'));
                $valuesArray[$i]['projectName'] = $tempRows[$i]['projectName'];
                $valuesArray[$i]['projectActivityId'] = $tempRows[$i]['activityId'];
                $valuesArray[$i]['projectId'] = $tempRows[$i]['projectId'];
                $valuesArray[$i]['projectActivityName'] = $tempRows[$i]['activityId'];

                //If the project is Upskills, keep the Id of the activity to not forget to take the missing
                if ($tempRows[$i]['projectId'] == $upskillsProjectId){
                    $upskillsActivitiesAlreadyDone[] = $tempRows[$i]['activityId'];
                }

                // Test if the row is the leaves row or not
                // Set the timesheetItems
                if ($tempRows[$i]['activityId'] == $leavesActivityId && $tempRows[$i]['projectId'] == $upskillsProjectId) :
                    for ($j = 0; $j < $noOfDays; $j++) {
                        $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                        if ($results[0]) :
                            $status = $results->getLast()->getStatus();
                            $valu = $results->getLast()->getLengthDays();
                            if ($status == 1 || $status == 2 || $status == 3) :
                                $rowForm->setDefault('TimesheetItemId' . $j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                if ($valu == 0.5):
                                    $rowForm->setDefault($j, 4);
                                    $valuesArray[$i][$j] = 4;
                                else:
                                    $rowForm->setDefault($j, 8);
                                    $valuesArray[$i][$j] = 8;
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                $rowForm->setDefault($j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                                $valuesArray[$i][$j] = $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber();
                            endif;
                        else :
                            $rowForm->setDefault('TimesheetItemId' . $j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                            $rowForm->setDefault($j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                            $valuesArray[$i][$j] = $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber();
                        endif;
                    }
                else :
                    for ($j = 0; $j < $noOfDays; $j++) {
                        $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                        if ($results[0]) :
                            $status = $results->getLast()->getStatus();
                            if ($status == 1 || $status == 2 || $status == 3) :
                                $rowForm->setDefault('TimesheetItemId' . $j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                $rowForm->setDefault($j, "");
                                $valuesArray[$i][$j] = "";
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                $rowForm->setDefault($j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                                $valuesArray[$i][$j] = $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber();
                            endif;
                        else :
                            if ($holidayService->isHoliday($date[$j], $operationalCountry)) :
                                if ($activityName == "Public Holiday") :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    $rowForm->setDefault($j, 8);
                                    $valuesArray[$i][$j] = 8;
                                else :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    $rowForm->setDefault($j, "");
                                    $valuesArray[$i][$j] = "";
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                $rowForm->setDefault($j, $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                                $valuesArray[$i][$j] = $tempRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber();
                            endif;
                        endif;
                    }
                endif;
                //Add the row to the timesheetRows
                $timesheetRows->embedForm($count, $rowForm);
                $count++;
            }

            //Add the Upskills missing rows
            $projectName = $this->getTimesheetService()->getProjectNameByProjectId($upskillsProjectId);
            $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($upskillsProjectId, true);
            $activityArray = null;

            foreach ($activities as $activity) :
                $activityArray[$activity['activityId']] = $activity['name'];
            endforeach;

            foreach ($activities as $activity) :

                $activityId = $activity['activityId'];

                if (!in_array($activityId,$upskillsActivitiesAlreadyDone)) {

                    $rowForm = new TimesheetRowForm(array(), $values);

                    $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                    $rowForm->setDefault('projectName', "Upskills" . " - ##" . $projectName);
                    $rowForm->setDefault('projectActivityId', $activityId);
                    $rowForm->setDefault('projectId', $upskillsProjectId);
                    $rowForm->setDefault('projectActivityName', $activityId);
                    $activityName = $activity['name'];

                    for ($j = 0; $j < $noOfDays; $j++) {
                        if ($holidayService->isHoliday($date[$j], $operationalCountry)) :
                            if ($activityName == "Public Holiday") :
                                $rowForm->setDefault('TimesheetItemId' . $j, "");
                                $rowForm->setDefault($j, 8);
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, "");
                                $rowForm->setDefault($j, "");
                            endif;
                        else :
                            $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                            if ($results[0]) :
                                $test = $results->getLast()->getStatus();
                                $valu = $results->getLast()->getLengthDays();
                                if ($test == 1 || $test == 2 || $test == 3) :
                                    if ($activityName == "Leave") :
                                        $rowForm->setDefault('TimesheetItemId' . $j, "");
                                        if ($valu == 0.5):
                                            $rowForm->setDefault($j,4);
                                        else:
                                            $rowForm->setDefault($j,8);
                                        endif;
                                    else :
                                        $rowForm->setDefault('TimesheetItemId' . $j, "");
                                        $rowForm->setDefault($j, "");
                                    endif;
                                else :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    $rowForm->setDefault($j, "");
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, "");
                                $rowForm->setDefault($j, "");
                            endif;
                        endif;
                    }
                    $timesheetRows->embedForm($count, $rowForm);
                    $count++;
                }
            endforeach;

        }

        //Add the rows to the initialRows
        $this->embedForm('initialRows', $timesheetRows);
        $this->valuesJSON = json_encode($valuesArray);
       
    }

    /**
     * Set method for LeaveRequest Dao
     * @param LeaveRequest $leaveRequestDao
     */
    public function setLeaveRequestDao(LeaveRequestDao $leaveRequestDao) {
        $this->leaveRequestDao = $leaveRequestDao;
    }

    /**
     * Get method for LeaveRequest Dao
     * @return LeaveRequestDao
     */
    public function getLeaveRequestDao() {
        if (is_null($this->leaveRequestDao)) {
            $this->leaveRequestDao = new LeaveRequestDao();
        }
        return $this->leaveRequestDao;
    }

    /**
     * Returns LeaveRequest Service
     * @returns LeaveRequestService
     */
    public function getLeaveRequestService() {
        if (!($this->leaveRequestService instanceof LeaveRequestService)) {
            $this->leaveRequestService = new LeaveRequestService();
        }
        return $this->leaveRequestService;
    }

    /**
     * Set method for LeaveRequest Service
     * @param LeaveRequestService $leaveRequestService
     */
    public function setLeaveRequestService(LeaveRequestService $leaveRequestService) {
        $this->leaveRequestService = $leaveRequestService;
    }

    /**
     * Set method for OperationalCountry Dao
     * @param OperationalCountry $operationalCountryDao
     */
    public function setOperationalCountryDao(OperationalCountryDao $operationalCountryDao) {
        $this->operationalCountryDao = $operationalCountryDao;
    }

    /**
     * Get method for OperationalCountry Dao
     * @return OperationalCountryDao
     */
    public function getOperationalCountryDao() {
        if (is_null($this->operationalCountryDao)) {
            $this->operationalCountryDao = new OperationalCountryDao();
        }
        return $this->operationalCountryDao;
    }

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
     * Set method for Employee Dao
     * @param EmployeeService $employeeDao
     */
    public function setEmployeeDao(EmployeeDao $employeeDao) {
        $this->employeeDao = $employeeDao;
    }

    /**
     * Get method for Employee Dao
     * @return EmployeeDao
     */
    public function getEmployeeDao() {
        if (is_null($this->employeeDao)) {
            $this->employeeDao = new EmployeeDao();
        }
        return $this->employeeDao;
    }

    /**
     * Returns Employee Service
     * @returns EmployeeService
     */
    public function getEmployeeService() {
        if (!($this->employeeService instanceof EmployeeService)) {
            $this->employeeService = new EmployeeService();
        }
        return $this->employeeService;
    }

    /**
     * Set method for Employee Service
     * @param EmployeeService $employeeService
     */
    public function setEmployeeService(EmployeeService $employeeService) {
        $this->employeeService = $employeeService;
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

    /**
     * Set method for Holiday Dao
     * @param HolidayService $holidayDao
     */
    public function setHolidayDao(HolidayDao $holidayDao) {
        $this->holidayDao = $holidayDao;
    }

    /**
     * Get method for Holiday Dao
     * @return HolidayDao
     */
    public function getHolidayDao() {
        if (is_null($this->holidayDao)) {
            $this->holidayDao = new HolidayDao();
        }
        return $this->holidayDao;
    }

    /**
     * Get the Timesheet Data Access Object
     * @return TimesheetDao
     */
    public function getTimesheetDao() {

        if (is_null($this->timesheetDao)) {
            $this->timesheetDao = new TimesheetDao();
        }
        return $this->timesheetDao;
    }

    /**
     * Set TimesheetData Access Object
     * @param TimesheetDao $TimesheetDao
     * @return void
     */
    public function setTimesheetDao(TimesheetDao $timesheetDao) {

        $this->timesheetDao = $timesheetDao;
    }

    /**
     * Get the Timesheet Data Access Object
     * @return TimesheetService
     */
    public function getTimesheetService() {

        if (is_null($this->timesheetService)) {
            $this->timesheetService = new TimesheetService();
        }



        return $this->timesheetService;
    }

    public function getHolidayPerCountry(OperationalCountry $operationalCountry){
        $this->getholidayService()->getHolidayList($operationalCountry);
    }

    /**
     *
     * @return TimesheetPeriodService
     */
    public function getTimesheetPeriodService() {

        if (is_null($this->timesheetPeriodService)) {

            $this->timesheetPeriodService = new TimesheetPeriodService();
        }

        return $this->timesheetPeriodService;
    }

    /**
     * Set TimesheetData Access Object
     * @param TimesheetService $TimesheetService
     * @return void
     */
    public function setTimesheetService(TimesheetService $timesheetService) {


        $this->timesheetService = $timesheetService;
    }

    public function getTimesheet($date, $employeeId, $timesheetId) {

        $timesheetItems = $this->getTimesheetDao()->getTimesheetItem($timesheetId, $employeeId);

        $startDate = $date;

        $timesheet = $this->getTimesheetDao()->getTimesheetByStartDateAndEmployeeId($startDate, $employeeId);
        $endDate = $timesheet->getEndDate();
        $dates = $this->getDatesOfTheTimesheetPeriod($startDate, $endDate);

        if (!empty($timesheetItems)) {

            $temp = current($timesheetItems);
            $projectId = $temp["projectId"];
            $activityId = $temp["activityId"];

            $i = 0;

            foreach ($timesheetItems as $timesheetItem) {

                if (($timesheetItem["projectId"] == $projectId) && ($timesheetItem["activityId"] == $activityId)) {

                    $rows[$i][] = $timesheetItem;

                } else {

                    $projectId = $timesheetItem["projectId"];
                    $activityId = $timesheetItem["activityId"];
                    $i++;
                    $rows[$i][] = $timesheetItem;
                }
            }

            foreach ($rows as $row) {

                $rowArray['projectId'] = $row[0]["projectId"];
                $rowArray['projectName'] = $row[0]->getProject()->getCustomer()->getName() . " - ##" . $row[0]->getProject()->getName();
                $rowArray['isProjectDeleted'] = $row[0]->getProject()->getIsDeleted();
                $rowArray['activityId'] = $row[0]["activityId"];
                $rowArray['activityName'] = $row[0]->getProjectActivity()->getName();
                $rowArray['isActivityDeleted'] = $row[0]->getProjectActivity()->getIsDeleted();

                foreach ($dates as $date) {

                    $current = current($row);

                    if ($date == $current["date"]) {

                        $timesheetItemsArray[$date] = array_shift($row);
                        continue;
                    }

                    $newTimesheetItem = new TimesheetItem();
                    $newTimesheetItem->setDate($date);
                    $timesheetItemsArray[$date] = $newTimesheetItem;
                }
                $rowArray['timesheetItems'] = $timesheetItemsArray;
                $printableArray[] = $rowArray;
            }

            return $printableArray;
        } else {
            return null;
        }
    }

    public function getDatesOfTheTimesheetPeriod($startDate, $endDate) {

        $clientTimeZoneOffset = sfContext::getInstance()->getUser()->getUserTimeZoneOffset();
        date_default_timezone_set($this->getLocalTimezone($clientTimeZoneOffset));

        if ($startDate < $endDate) {
            $dates_range[] = $startDate;

            $startDate = strtotime($startDate);
            $endDate = strtotime($endDate);


            while (date('Y-m-d', $startDate) != date('Y-m-d', $endDate)) {
                $startDate = mktime(0, 0, 0, date("m", $startDate), date("d", $startDate) + 1, date("Y", $startDate));
                $dates_range[] = date('Y-m-d', $startDate);
            }
        }
        return $dates_range;
    }

    public function addInitialRows($numberOfRows) {

        $timesheetRows = new sfForm();
        $count = 0;

        for ($i = 0; $i <= $numberOfRows; $i++) {
            $rowForm = new TimesheetForm();
            $timesheetRows->embedForm($count, $rowForm);
            $count++;
        }

        $this->embedForm('initialRows', $timesheetRows);
    }

    public function addRow($num, $values) {
        $rowForm = new TimesheetRowForm(array(), $values);
        $this->embeddedForms['initialRows']->embedForm($num, $rowForm);
        $this->embedForm('initialRows', $this->embeddedForms['initialRows']);
    }

    public function getProjectListAsJson() {

        $jsonArray = array();
        $projectList = $this->getTimesheetService()->getProjectNameList();

        foreach ($projectList as $project) {
            $jsonArray[] = array('name' => $project['customerName'] . " - ##" . $project['projectName'], 'id' => $project['projectId']);
        }

        $jsonString = json_encode($jsonArray);

        return $jsonString;
    }

    public function getProjectListAsJsonForValidation() {

        $jsonArray = array();
        $projectList = $this->getTimesheetService()->getProjectNameList(false);

        foreach ($projectList as $project) {
            $jsonArray[] = array('name' => $project['customerName'] . " - ##"  . $project['projectName'], 'id' => $project['projectId']);
        }

        $jsonString = json_encode($jsonArray);

        return $jsonString;
    }

    public function getLocalTimezone($clientTimeZoneOffset) {


        $offset = $clientTimeZoneOffset;
        $zonelist =
            array
            (
                'Kwajalein' => -12.00,
                'Pacific/Midway' => -11.00,
                'Pacific/Honolulu' => -10.00,
                'America/Anchorage' => -9.00,
                'America/Los_Angeles' => -8.00,
                'America/Denver' => -7.00,
                'America/Tegucigalpa' => -6.00,
                'America/New_York' => -5.00,
                'America/Caracas' => -4.50,
                'America/Halifax' => -4.00,
                'America/St_Johns' => -3.50,
                'America/Argentina/Buenos_Aires' => -3.00,
                'America/Sao_Paulo' => -3.00,
                'Atlantic/South_Georgia' => -2.00,
                'Atlantic/Azores' => -1.00,
                'Europe/Dublin' => 0,
                'Europe/Belgrade' => 1.00,
                'Europe/Minsk' => 2.00,
                'Asia/Kuwait' => 3.00,
                'Asia/Tehran' => 3.50,
                'Asia/Muscat' => 4.00,
                'Asia/Yekaterinburg' => 5.00,
                'Asia/Kolkata' => 5.50,
                'Asia/Katmandu' => 5.45,
                'Asia/Dhaka' => 6.00,
                'Asia/Rangoon' => 6.50,
                'Asia/Krasnoyarsk' => 7.00,
                'Asia/Brunei' => 8.00,
                'Asia/Seoul' => 9.00,
                'Australia/Darwin' => 9.50,
                'Australia/Canberra' => 10.00,
                'Asia/Magadan' => 11.00,
                'Pacific/Fiji' => 12.00,
                'Pacific/Tongatapu' => 13.00
            );
        $index = array_keys($zonelist, $offset);
        if (sizeof($index) != 1)
            return false;
        return $index[0];
    }

    //Marc Modif 7/13/2016

    public function isAcceptedLeaveForEmpId($empNumber, $day) {
        return $this->getLeaveRequestService()->isAcceptedLeaveForEmpId($empNumber, $day);
    }

    public function getTimesheetId($startDate,$employeeId){
        return $this->getTimesheetService()->getTimesheetId($startDate,$employeeId);
    }

    public function getLastTimesheet($employeeId, $startDate){

        $timesheets = $this->getTimesheetService()->getTimesheetByEmployeeId($employeeId);
        if ($timesheets) {

            $tempDate = mktime(0,0,0,1,1,1970);
            if ($tempDate) {
                foreach ($timesheets as $timesheet) {
                    if ($timesheet->getStartDate() < $startDate && $timesheet->getStartDate() > $tempDate) {
                        $tempDate = $timesheet->getStartDate();
                    }
                }

                $timesheet = $this->getTimesheetService()->getTimesheetByStartDateAndEmployeeId($tempDate, $employeeId);
                $timesheetId = $timesheet->getTimesheetId();

                return $this->getTimesheet($tempDate, $employeeId, $timesheetId);
            }
        }
    }

}

?>
