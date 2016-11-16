<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CreateFeedbackForm
 *
 * @author indiran
 */
class AddPerformanceObjectiveForm extends sfForm {

    public $employeeService;
    public $performanceObjectiveService;
    public $reviewersList = array();
    private $reviewerIdList = array();
    private $performanceObjectiveId;

    /**
     *
     * @return EmployeeService
     */
    public function getEmployeeService() {
        if (!($this->employeeService instanceof EmployeeService)) {
            $this->employeeService = new EmployeeService();
        }
        return $this->employeeService;
    }

    /**
     *
     * @param EmployeeService $service 
     */
    public function setEmployeeService(EmployeeService $service) {
        $this->employeeService = $service;
    }

    public function getPerformanceObjectiveService() {
        if (is_null($this->performanceObjectiveService)) {
            $this->performanceObjectiveService = new PerformanceObjectiveService();
        }
        return $this->performanceObjectiveService;
    }

    public function configure() {
        $objectiveId = $this->getOption('objectiveId');
        $availableReviewersList = $this->getEmployeeList($objectiveId);
        $assignedReviewersList = $this->getReviwersList($objectiveId);

        $this->setWidgets(array(
            'objective_name' => new sfWidgetFormInput(),
            'objective_description' => new sfWidgetFormTextarea(),
            'employeeName' => new ohrmWidgetEmployeeNameAutoFill(array('loadingMethod' => 'ajax')),
            'target_date' => new ohrmWidgetDatePicker(array(), array('id' => 'fromDate'), array('class' => 'formDateInput')),
            'availableEmp' => new sfWidgetFormSelectMany(array('choices' => $availableReviewersList)),
            'assignedEmp' => new sfWidgetFormSelectMany(array('choices' => $assignedReviewersList)),
            'hdnTrckId' => new sfWidgetFormInputHidden(),
            'hdnMode' => new sfWidgetFormInputHidden(),
        ));

        $this->widgetSchema->setNameFormat('addPerformanceObjective[%s]');
        $this->setValidators(array(
            'objective_name' => new sfValidatorString(array('required' => true, 'max_length' => 200)),
            'objective_description' => new sfValidatorString(array('required' => true, 'max_length'=> 3000)),
            'employeeName' => new ohrmValidatorEmployeeNameAutoFill(array('required' => true)),
            'target_date' => new sfValidatorString(array('required' => false)),
            'availableEmp' => new sfValidatorPass(),
            'assignedEmp' => new sfValidatorPass(array('required' => true)),
            'hdnTrckId' => new sfValidatorString(array('required' => false)),
            'hdnMode' => new sfValidatorString(array('required' => false))
        ));

        $this->setDefaultValues($objectiveId);
    }

    /*
     * 
     */

    private function getReviwersList($performanceObjectiveId) {
        $reviewersList = array();
        if (isset($performanceObjectiveId)) {
            $this->performanceObjectiveId = $performanceObjectiveId;
            $performanceObjective = $this->getPerformanceObjectiveService()->getPerformanceObjective($performanceObjectiveId);
            if ($performanceObjective instanceof PerformanceObjective) {
                //existing reviewers
                $reviwers = $performanceObjective->getPerformanceObjectiveReviewer();
                foreach ($reviwers as $reviewer) {
                    if ($reviewer instanceof PerformanceObjectiveReviewer) {
                        $employee = $reviewer->getEmployee();
                        $empNumber = $employee->getEmpNumber();
                        $name = trim(trim($employee->getFirstName() . ' ' . $employee->getMiddleName(), ' ') . ' ' . $employee->getLastName());
                        $reviewersList[$empNumber] = $name;
                    }
                }
            }
        }
        return $reviewersList;
    }

    /**
     * This method is used to set default
     * @param type $performanceObjectiveId
     */
    public function setDefaultValues($performanceObjectiveId) {

        $this->performanceObjectiveId = $performanceObjectiveId;
        $performanceObjective = $this->getPerformanceObjectiveService()->getPerformanceObjective($performanceObjectiveId);
        if ($performanceObjective instanceof PerformanceObjective) {
            $this->setDefault('objective_name', $performanceObjective->getObjectiveName());
            $this->setDefault('objective_description', $performanceObjective->getDescription());
            $this->setDefault('hdnTrckId', $performanceObjective->getId());
            $this->setDefault('hdnMode', 'edit');
            $this->setDefault('employeeName', array('empName' => $performanceObjective->getEmployee()->getFirstAndLastNames(), 'empId' => $performanceObjective->getEmployee()->getEmpNumber()));
            $this->setDefault('target_date', $performanceObjective->getTargetDate());
        }
    }

    public function save() {
        $employeeName = $this->getValue('employeeName');
        $empId = $employeeName['empId'];
        $messageArray = array();
        if (empty($empId)) {
            $messageArray['messageType'] = 'warning';
            $messageArray['messageBody'] = __('Invalid Employee');
        } else {
            $performanceObjective = $this->getPerformanceObjective();
            $this->getPerformanceObjectiveService()->savePerformanceObjective($performanceObjective);
            $messageArray['messageType'] = 'success';
            $messageArray['messageBody'] = __(TopLevelMessages::SAVE_SUCCESS);
        }
        return $messageArray;
    }

    //get the values from form and set it to performanceObjective 
    public function getPerformanceObjective() {
        $objectiveName = $this->getValue('objective_name');
        $objectiveId = $this->getValue('hdnTrckId');
        $currentDate = date(Performanceobjective::DATE_FORMAT);
        $employeeName = $this->getValue('employeeName');
        $empId = $employeeName['empId'];
        $assignedEmp = $this->getValue('assignedEmp');
        $description = $this->getValue('objective_description');
        $targetDate = $this->getValue('target_date');

        $performanceObjective = new PerformanceObjective();


        //modify existing performance objective
        if (!empty($objectiveId)) {
            $performanceObjective = $this->getPerformanceObjectiveService()->getPerformanceObjective($objectiveId);
            $performanceObjective->setModifiedDate($currentDate);
        }
        //add performance objective
        else {
            $performanceObjective->setEmpNumber($empId);
            $performanceObjective->setStatus(PerformanceObjective::STATUS_ACTIVE);
            $performanceObjective->setAddedDate($currentDate);
        }
        $performanceObjective->setObjectiveName($objectiveName);
        $performanceObjective->setDescription($description);
        $performanceObjective->setTargetDate($targetDate);
        //setting reviewers.
        $newReviewers = $performanceObjective->getPerformanceObjectiveReviewer();
        $newReviewers->clear();
		
		$reviewer = new PerformanceObjectiveReviewer();
		$reviewer->setAddedDate($currentDate);
		$reviewer->setReviewerId($empId);
		$newReviewers->add($reviewer);

        foreach ($assignedEmp as $reviewerId) {
            $reviewer = new PerformanceObjectiveReviewer();
            $reviewer->setAddedDate($currentDate);
            $reviewer->setReviewerId($reviewerId);
            $newReviewers->add($reviewer);
        }
        $performanceObjective->setPerformanceObjectiveReviewer($newReviewers);

        return $performanceObjective;
    }

    protected function getAddedPerformanceObjectiveReviwers() {
        $assignedEmp = $this->getValue('assignedEmp');
        echo "=>" . $assignedEmp[0] . "##";
    }

    // get the employees list as json.
    public function getEmployeeListAsJson() {
        $jsonArray = array();
        $employeeService = $this->getEmployeeService();

        $locationService = new LocationService();

        $properties = array("empNumber", "firstName", "middleName", "lastName", 'termination_id');

        $employeeList = UserRoleManagerFactory::getUserRoleManager()
                ->getAccessibleEntityProperties('Employee', $properties, null, null, array(), array(), array());

        $employeeUnique = array();
        foreach ($employeeList as $employee) {
            $terminationId = $employee['termination_id'];
            $empNumber = $employee['empNumber'];
            if (!isset($employeeUnique[$empNumber]) && empty($terminationId)) {
                $name = trim(trim($employee['firstName'] . ' ' . $employee['middleName'], ' ') . ' ' . $employee['lastName']);

                $employeeUnique[$empNumber] = $name;
                $jsonArray[] = array('name' => $name, 'id' => $empNumber);
            }
        }
        $jsonString = json_encode($jsonArray);
        return $jsonString;
    }

    public function getEmployeeList($objectiveId) {
        $empNameList = array();
        $existReviewersList = $this->getReviwerIdList($objectiveId);

        $employeeService = new EmployeeService();
        $employeeService->setEmployeeDao(new EmployeeDao());

        $properties = array("empNumber", "firstName", "middleName", "lastName");
        $employeeList = $employeeService->getEmployeePropertyList($properties, 'lastName', 'ASC', true);

        foreach ($employeeList as $employee) {
            $empNumber = $employee['empNumber'];
            if (!in_array($empNumber, $existReviewersList)) {
                $name = trim(trim($employee['firstName'] . ' ' . $employee['middleName'], ' ') . ' ' . $employee['lastName']);
                $empNameList[$empNumber] = $name;
            }
        }
        $this->employeeList = $empNameList;
        return $empNameList;
    }

    public function getReviwerIdList($objectiveId) {
        $this->reviewerIdList = $this->getPerformanceObjectiveService()->getPerformanceReviewersIdListByObjectiveId($objectiveId);
        return $this->reviewerIdList;
    }

}

?>
