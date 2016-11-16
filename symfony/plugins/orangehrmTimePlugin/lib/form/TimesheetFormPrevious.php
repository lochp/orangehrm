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

    public function configure() {

        $startDate = $this->getOption('date');
        $noOfDays = $this->getOption('noOfDays');
        $employeeId = $this->getOption('employeeId');
        $isduplicate = $this->getOption('isduplicate');
        $values = array('noOfDays' => $noOfDays);
        $tempRows = $this->getTimesheet($startDate, $employeeId, $this->getOption('timesheetId'));
        $numberOfRows = $tempRows;

        $holidayService = $this->getHolidayService();
        $employeeService = $this->getEmployeeService();
        $operationalCountryService = $this->getOperationalCountryService();
        $employee = $employeeService->getEmployee($employeeId);
        $cou_code = $employee->getCountry();
        $operationalCountryAux = $operationalCountryService->getOperationalCountryForCountryCode($cou_code);
        $operationalCountry = $operationalCountryAux[0];

        $timesheet = $this->getTimesheetDao()->getTimesheetByStartDateAndEmployeeId($startDate, $employeeId);
        $endDate = $timesheet->getEndDate();
        $date = $this->getDatesOfTheTimesheetPeriod($startDate,$endDate);

        $timesheetRows = new sfForm();

        if ($isduplicate == "true") :

            // Duplicate previous timesheet
            //todo : if someone use the duplicate button and there is no previous timesheet
            //$tempRows = $this->getLastTimesheet($employeeId,$startDate);
            //$previousTimesheet = $tempRows;
            //$this->timesheetItemValuesArray = array();
            //$timesheetItemsArray = array();

            $projectId = 2;
            $projectName = $this->getTimesheetService()->getProjectNameByProjectId($projectId);
            $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($projectId, true);
            $activityArray = null;

            foreach ($activities as $activity) :
                $activityArray[$activity['activityId']] = $activity['name'];
            endforeach;

            foreach ($activities as $activity) :
                $i = 0;
                $rowForm = new TimesheetRowForm(array(), $values);
                $activityId = $activity['activityId'];
                $activityName = $activity['name'];

                $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                $rowForm->setDefault('projectName',$projectName );
                $rowForm->setDefault('projectActivityId', $activityId);
                $rowForm->setDefault('projectId', $projectId);
                $rowForm->setDefault('projectActivityName', $activityId);

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
                            if ($test == 1 || $test == 2 || $test == 3) :
                                if ($activityName == "Leave") :
                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                    $rowForm->setDefault($j, 8);
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
        for ($j = 0; $j < $noOfDays; $j++) {
            $emptyRowForm->setDefault('TimesheetItemId' . $j, "");
            $emptyRowForm->setDefault($j, "");
        }
        $timesheetRows->embedForm($i, $emptyRowForm);
        var_dump($rowForm['projectActivityName']);


            /*
                         if ($previousTimesheet) :
                            $i = 0;
                            $count = 0;
                            foreach ($previousTimesheet as $rowArray) {

                                if ($rowArray['projectId']) {
                                    $rowForm = new TimesheetRowForm(array(), $values);

                                    $projectId = $rowArray['projectId'];
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

                                    $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                                    $rowForm->setDefault('projectName', $rowArray['projectName']);
                                    $rowForm->setDefault('projectActivityId', $rowArray['activityId']);
                                    $rowForm->setDefault('projectId', $rowArray['projectId']);
                                    $rowForm->setDefault('projectActivityName', $rowArray['activityId']);

                                    $rowArrayP['projectId'] = $rowArray['projectId'];
                                    $rowArrayP['projectName'] = $rowArray['projectName'];
                                    $rowArrayP['isProjectDeleted'] = $rowArray['isProjectDeleted'] ;
                                    $rowArrayP['activityId'] =$rowArray['activityId'];
                                    $rowArrayP['activityName'] = $rowArray['activityName'];
                                    $rowArrayP['isActivityDeleted'] = $rowArray['isActivityDeleted'];

                                    //Marc 7/13/2016 Modif
                                    // 1 == Leave
                                    if ($rowArray['activityId'] == 1 && $rowArray['projectId'] == 1) :
                                        for ($j = 0; $j < $noOfDays; $j++) {
                                            $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                                            if ($results[0]) :
                                                $test = $results->getLast()->getStatus();
                                                if ($test == 1 || $test == 2 || $test == 3) :
                                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                                    $rowForm->setDefault($j, 8);
                                                    $newTimesheetItem = new TimesheetItem();
                                                    $newTimesheetItem->setDate($date[$j]);
                                                    $timesheetItemsArray[$date] = $newTimesheetItem;
                                                else :
                                                    $rowForm->setDefault('TimesheetItemId' . $j, "");
                                                    $rowForm->setDefault($j, "");
                                                    $newTimesheetItem = new TimesheetItem();
                                                    $newTimesheetItem->setDate($date[$j]);
                                                    $timesheetItemsArray[$date] = $newTimesheetItem;
                                                endif;
                                            else :
                                                $rowForm->setDefault('TimesheetItemId' . $j, "");
                                                $rowForm->setDefault($j, "");
                                                $newTimesheetItem = new TimesheetItem();
                                                $newTimesheetItem->setDate($date[$j]);
                                                $timesheetItemsArray[$date] = $newTimesheetItem;
                                            endif;
                                        }
                                    else :
                                        for ($j = 0; $j < $noOfDays; $j++) {
                                            $rowForm->setDefault('TimesheetItemId' . $j, "");
                                            $rowForm->setDefault($j, "");
                                            $newTimesheetItem = new TimesheetItem();
                                            $newTimesheetItem->setDate($date[$j]);
                                            $timesheetItemsArray[$date] = $newTimesheetItem;
                                        }
                                    endif;
                                    $rowArrayP['timesheetItems'] = $timesheetItemsArray;
                                    $this->timesheetItemValuesArray[] = $rowArray;
                                    $timesheetRows->embedForm($count, $rowForm);
                                    $count++;
                                    $i++;
                                }
                            }
            endif;
            */

        //If not duplicate
        else :

            //If new Timesheet or if no project for now
            if ($numberOfRows == null) :

                //Marc Modif 7/12/2016
                $i = 0;

                //We take the Upskills-Project and all the activities of this project
                $projectName = $this->getTimesheetService()->getProjectNameByProjectId(1);
                $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId(1, true);
                $activityArray = null;

                foreach ($activities as $activity) :
                    $activityArray[$activity['activityId']] = $activity['name'];
                endforeach;

                foreach ($activities as $activity) :
                    $rowForm = new TimesheetRowForm(array(), $values);
                    $activityId = $activity['activityId'];
                    $activityName = $activity['name'];


                    $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                    $rowForm->setDefault('projectName', "Upskills" . " - ##" . $projectName);
                    $rowForm->setDefault('projectActivityId', $activityId);
                    $rowForm->setDefault('projectId', 1);
                    $rowForm->setDefault('projectActivityName', $activityId);

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
                                if ($test == 1 || $test == 2 || $test == 3) :
                                    if ($activityName == "Leave") :
                                        $rowForm->setDefault('TimesheetItemId' . $j, "");
                                        $rowForm->setDefault($j, 8);
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
                for ($j = 0; $j < $noOfDays; $j++) {
                    $emptyRowForm->setDefault('TimesheetItemId' . $j, "");
                    $emptyRowForm->setDefault($j, "");
                }
                $timesheetRows->embedForm($i, $emptyRowForm);

            else :

                $totalRows = sizeOf($numberOfRows);

                $keysArray = array_keys($numberOfRows[0]['timesheetItems']);
                $count = 0;

                for ($i = 0; $i < $totalRows; $i++) {
                    $rowForm = new TimesheetRowForm(array(), $values);

                    for ($j = 0; $j < $noOfDays; $j++) {
                        if ($numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getTimesheetId() > 0) {
                            $project = $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getProject();
                            continue;
                        }
                    }

                    $activities = $this->getTimesheetService()->getProjectActivityListByPorjectId($project->getProjectId(), true);
                    $activityArray = null;

                    foreach ($activities as $activity) {
                        $activityId = $activity['activityId'];
                        $activityName = $activity['name'];
                        $activityIsDeleted = $activity['is_deleted'];
                        if ($activityIsDeleted != 1) {
                            $activityArray[$activityId] = $activityName;
                        }
                        if ($activityId == $numberOfRows[$i]['activityId'] && $activityIsDeleted == 1) {
                            $activityArray[$activityId] = $activityName;
                        }
                    }
                    $rowForm->setWidget('projectActivityName', new sfWidgetFormSelect(array('choices' => $activityArray), array('style' => 'width:100px', 'class' => 'projectActivity')));
                    $rowForm->setDefault('projectName', $numberOfRows[$i]['projectName']);
                    $rowForm->setDefault('projectActivityId', $numberOfRows[$i]['activityId']);
                    $rowForm->setDefault('projectId', $numberOfRows[$i]['projectId']);
                    $rowForm->setDefault('projectActivityName', $numberOfRows[$i]['activityId']);

                    //Marc 7/13/2016 Modif
                    // 1 == Leave
                    if ($numberOfRows[$i]['activityId'] == 1) :
                        for ($j = 0; $j < $noOfDays; $j++) {
                            $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                            if ($results[0]) :
                                $test = $results->getLast()->getStatus();
                                if ($test == 1 || $test == 2 || $test == 3) :
                                    $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                    $rowForm->setDefault($j, 8);
                                else :
                                    $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                    $rowForm->setDefault($j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                $rowForm->setDefault($j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                            endif;
                        }
                    else :
                        for ($j = 0; $j < $noOfDays; $j++) {
                            $results = $this->isAcceptedLeaveForEmpId($employeeId, date('Y-m-d', strtotime($date[$j])));
                            if ($results[0]) :
                                $test = $results->getLast()->getStatus();
                                if ($test == 1 || $test == 2 || $test == 3) :
                                    $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                    $rowForm->setDefault($j, "");
                                else :
                                    $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                    $rowForm->setDefault($j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                                endif;
                            else :
                                $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                $rowForm->setDefault($j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                            endif;
                        }
                    endif;

                    // End Modif

                    /*
                                    for ($j = 0; $j < $noOfDays; $j++) {
                                        $rowForm->setDefault('TimesheetItemId' . $j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]['timesheetItemId']);
                                        $rowForm->setDefault($j, $numberOfRows[$i]['timesheetItems'][$keysArray[$j]]->getFirstNumber());
                                    }
                    */
                    $timesheetRows->embedForm($count, $rowForm);
                    $count++;
                }

            endif;
        endif;
        $this->embedForm('initialRows', $timesheetRows);
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

  /*  public function getProjectAndActivities($timesheetId, $employeeId) {
        $timesheetItems = $this->getTimesheetService()->getTimesheetItem($timesheetId);
        $projects= array();
        foreach($timesheetItems as $timesheetItem){
            
        }
    }
*/
    //End Modif

}

?>
