<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TimesheetRowForm
 *
 * @author orangehrm
 */
class TimesheetRowForm extends sfForm {

	private $holidayDao;
	private $holidayService;
	private $employeeDao;
	private $employeeService;
	private $operationalCountryDao;
	private $operationalCountryService;

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

	public function configure() {

	$noOfDays = $this->getOption('noOfDays');
	$widgetArray = array(
	    'toDelete' => new sfWidgetFormInputCheckbox(array(), array('class' => 'toDelete')),
            'projectName' => new sfWidgetFormInputText(array(), array('align' => 'center', 'class' => 'project')),
            'projectId' => new sfWidgetFormInputHidden(),
            'projectActivityName' => new sfWidgetFormSelect(array('choices' => array('-1' => '-- ' . __('Select') . ' --')), array('class' => 'projectActivity')),
            'projectActivityId' => new sfWidgetFormInputHidden()
	);
		    for ($i = 0; $i < $noOfDays; $i++) {
			$widgetArray[$i] = new sfWidgetFormInputText(array(), array('align' => 'center', 'class' => 'items'));
			$widgetArray['TimesheetItemId'.$i] = new sfWidgetFormInputHidden();
		    }

        $this->setWidgets($widgetArray);

        $this->widgetSchema->setNameFormat('time[%s]');

        $this->widgetSchema['projectName']->setAttribute('size', 15);
        $this->setDefault('projectName', __('Type for hints').'...');
        $this->widgetSchema['projectActivityName']->setAttribute('style', 'width:100px');
	for ($i = 0; $i < $noOfDays; $i++) {
		$this->widgetSchema[$i]->setAttribute('size', 1);
	}

	$validatorsArray = array(
	    'toDelete' => new sfValidatorPass(array('required' => false)),
            'projectName' => new sfValidatorString(array('required' => true), array('required' => __('Required'))),
            'projectId' => new sfValidatorInteger(array('required' => true)),
            'projectActivityName' => new sfValidatorPass(array('required' => false)),
            'projectActivityId' => new sfValidatorInteger(array('required' => false))
	);

	for ($i = 0; $i < $noOfDays; $i++) {
			$validatorsArray[$i] = new sfValidatorNumber(array('required' => false));
			$validatorsArray['TimesheetItemId'.$i] =  new sfValidatorInteger(array('required' => false));
	}


        $this->setValidators($validatorsArray);
    }

}

