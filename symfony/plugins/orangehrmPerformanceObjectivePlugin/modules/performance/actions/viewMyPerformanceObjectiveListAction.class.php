<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of viewMyPerformanceObjectiveListAction
 *
 * @author chameera
 */
class viewMyPerformanceObjectiveListAction extends viewPerformanceObjectiveListAction{
        
    public function execute($request) {
         $page = $request->getParameter('hdnAction') == 'search' ? 1 : $request->getParameter('pageNo', 1);
        $this->setPageNumber($page);
        $listTitle = __('My Performance Objectives List');
        $this->setTitle($listTitle);
        $this->setPerformanceObjectiveList();
        $this->setObjectiveListCount();
        $initalAction = 'viewMyPerformanceObjectiveList';
        $this->setInitalAction($initalAction);
        parent::execute($request);
        $this->setTemplate('viewPerformanceObjectiveList');
    }

    public function setPerformanceObjectiveList() {
        $auth = Auth::instance(); 
        $loggedInEmpNumber = $auth->getEmployeeNumber();
        $searchParameter = array('page' => $this->getPageNumber(), 'limit' => sfConfig::get('app_items_per_page'), 'employeeId' => $loggedInEmpNumber);
        $this->performanceObjectiveList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveByEmployee($searchParameter);
    }

    public function setObjectiveListCount() {
        $auth = Auth::instance(); 
        $loggedInEmpNumber = $auth->getEmployeeNumber();
        $searchParameter = array('limit' =>null, 'employeeId' => $loggedInEmpNumber);
        $this->objectiveListCount = $this->getPerformanceObjectiveService()->getPerformanceObjectiveListCountByEmployee($searchParameter);
    }

}

?>
