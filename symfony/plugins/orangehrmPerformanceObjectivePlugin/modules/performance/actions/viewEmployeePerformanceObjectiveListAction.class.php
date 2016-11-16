<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of viewEmployeePerformanceObjectiveListAction
 *
 * @author chameera
 */
class viewEmployeePerformanceObjectiveListAction extends viewPerformanceObjectiveListAction {

    public function execute($request) {
        $page = $request->getParameter('hdnAction') == 'search' ? 1 : $request->getParameter('pageNo', 1);
        $this->setPageNumber($page);
        $listTitle = __('Performance Objectives');
        $this->setTitle($listTitle);
        $this->setPerformanceObjectiveList();
        $this->setObjectiveListCount();
        $initalAction = 'viewEmployeePerformanceObjectiveList';
        $this->setInitalAction($initalAction);
        parent::execute($request);
        $this->setTemplate('viewPerformanceObjectiveList');
    }

    public function setPerformanceObjectiveList() {
        $auth = Auth::instance();
        $loggedInEmpNumber = $auth->getEmployeeNumber();
        $isAdmin = $auth->hasRole(Auth::ADMIN_ROLE);

        $searchParameter = array('page' => $this->getPageNumber(), 'limit' => sfConfig::get('app_items_per_page'), 'reviewerId' => $loggedInEmpNumber);

        if ($isAdmin) {
            $this->performanceObjectiveList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveList($searchParameter);
        } else {
            $this->performanceObjectiveList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveListByReviewer($searchParameter);
        }
    }

    public function setObjectiveListCount() {
        $auth = Auth::instance();
        $loggedInEmpNumber = $auth->getEmployeeNumber();
        $isAdmin = $auth->hasRole(Auth::ADMIN_ROLE);
        $searchParameter = array('reviewerId' => $loggedInEmpNumber);
        if ($isAdmin) {
            $this->objectiveListCount = $this->getPerformanceObjectiveService()->getPerformanceObjectiveListCount();
        } else {
            $this->objectiveListCount = $this->getPerformanceObjectiveService()->getPerformanceObjectiveListCountByReviewer($searchParameter);
        }
    }

}

?>
