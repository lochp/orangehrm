<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of basePerformanceAction
 *
 * @author indiran
 */
abstract class basePerformanceAction  extends sfAction{
    
    public $employeeService;
    public $performanceObjectiveService;
    
    public function preExecute() {
        return;
    }
       
    
    /**
     * Get EmployeeService
     * @returns EmployeeService
     */
    public function getEmployeeService() {
        if(is_null($this->employeeService)) {
            $this->employeeService = new EmployeeService();
        }
        return $this->employeeService;
    }

    /**
     * Set EmployeeService
     * @param EmployeeService $employeeService
     */
    public function setEmployeeService(EmployeeService $employeeService) {
        $this->employeeService = $employeeService;        
    }
    
    /**
     * Get PerformanceObjective Service
     * @returns PerformanceObjectiveService
     */
    public function getPerformanceObjectiveService() {
        if(is_null($this->performanceObjectiveService)) {
            $this->performanceObjectiveService = new PerformanceObjectiveService();
        }
        return $this->performanceObjectiveService;
    }

    /**
     * Set EmployeeService
     * @param EmployeeService $employeeService
     */
    public function setPerformanceObjectiveService(PerformanceObjectiveService $performanceObjectiveService) {
        $this->performanceObjectiveService = $performanceObjectiveService;        
    }

}

?>
