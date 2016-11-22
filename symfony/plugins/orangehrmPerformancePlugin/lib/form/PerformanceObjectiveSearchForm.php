<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 *
 * Description of PerformanceReviewSearchForm
 *
 * @author nadeera
 */

class PerformanceObjectiveSearchForm extends BasePefromanceSearchForm {

    /**
     * 
     */
    public function configure() {

        $this->setWidgets($this->getFormWidgets());
        $this->setValidators($this->getFormValidators());

        $this->getWidgetSchema()->setNameFormat('performanceObjectiveSearchForm[%s]');
        $this->getWidgetSchema()->setLabels($this->getFormLabels());
    }

    /**
     *
     * @return array
     */
    protected function getFormWidgets() {
        $widgets = array(
            
            'employeeName' => new ohrmWidgetEmployeeNameAutoFill(array('loadingMethod' => 'ajax')),
            'fromDte' => new ohrmWidgetDatePicker(array(), array('id' => 'fromDte')),
            'toDate' => new ohrmWidgetDatePicker(array(), array('id' => 'toDate')),
            
        );
        return $widgets;
    }

    /**
     *
     * @return array
     */
    protected function getFormValidators() {

        $validators = array(
            'employeeName' => new ohrmValidatorEmployeeNameAutoFill(array('required' => true)),
            'fromDte' => new sfValidatorString(array('required' => false)),
            'toDate' => new sfValidatorString(array('required' => false)),
        );
        return $validators;
    }

    /**
     *
     * @return array
     */
    protected function getFormLabels() {
        $labels = array(
            'employeeName' => __('Employee Name'),           
            'fromDte' =>  __('From Date'),
            'toDate' =>  __('To Date'),
        );
        return $labels;
    }

    /**
     * Returns the set of action buttons associated with each mode of the leave list
     *
     * @return array Array of action buttons as instances of ohrmWidegetButton class
     */
    public function getSearchActionButtons() {
        return array(
            'btnSearch' => new ohrmWidgetButton('btnSearch', 'Search', array()),
            'btnReset' => new ohrmWidgetButton('btnReset', 'Reset', array('class' => 'reset')),
        );
    }
    
    public function getStylesheets() {
        $stylesheets = parent::getStylesheets();
        $stylesheets[plugin_web_path('orangehrmPerformancePlugin','css/searchReviewSuccess.css')] = 'all';
        return $stylesheets;
        
    }

}