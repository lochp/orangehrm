<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of performAction
 * This is used to initiate a feedback for an employee.
 * @author indiran
 */
class addPerformanceObjectiveAction extends basePerformanceAction {

    public $performanceObjective;
    private $pageNumber;

    public function getPageNumber() {
        return $this->pageNumber;
    }

    public function setPageNumber($pageNumber) {
        $this->pageNumber = $pageNumber;
    }

    public function preExecute() {
        
        $usrObj = $this->getUser()->getAttribute('user');
        if (!$usrObj->isAdmin()) {
            $this->forward(sfConfig::get('sf_secure_module'), sfConfig::get('sf_secure_action'));
        }
    }

    /**
     * @param sfForm $form
     * @return
     */
    public function setForm(sfForm $form) {
        if (is_null($this->form)) {
            $this->form = $form;
        }
    }

    public function execute($request) {

	    $request->setParameter('initialActionName', 'addPerformanceObjective');
        //set performance objective list
        $page = $request->getParameter('hdnAction') == 'search' ? 1 : $request->getParameter('pageNo', 1);
        $this->setPageNumber($page);
        $searchParameter = array('page'=>$page, 'limit'=>sfConfig::get('app_items_per_page'));
        $performanceObjectiveList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveList($searchParameter);
        $performanceObjectiveListCount = $this->getPerformanceObjectiveService()->getPerformanceObjectiveListCount();
        $this->_setListComponent($performanceObjectiveList, $performanceObjectiveListCount);
        $params = array();
        $this->parmetersForListCompoment = $params;

        $objectiveId = $request->getParameter('id');
        $this->setForm(new AddPerformanceObjectiveForm( array(), array('objectiveId' => $objectiveId), null));        
        
        $this->searchForm = new PerformanceObjectiveSearchForm();    
            
        if ($request->isMethod('post')) {
            $this->form->bind($request->getParameter('addPerformanceObjective'));
            if ($this->form->isValid()) {
                
                $messageArray = $this->form->save();
                $this->getUser()->setFlash($messageArray['messageType'], $messageArray['messageBody']);
                $this->redirect('performance/addPerformanceObjective');
            }
        } 

    }

    private function _setListComponent($performanceObjectiveList, $performanceObjectiveListCount) {
        $pageNumber = $this->getPageNumber();
        $configurationFactory = new PerformanceObjectiveListAdminConfigurationFactory();
        ohrmListComponent::setConfigurationFactory($configurationFactory);
        ohrmListComponent::setActivePlugin('orangehrmPerformanceObjectivePlugin');
        ohrmListComponent::setListData($performanceObjectiveList);
        ohrmListComponent::setPageNumber($pageNumber);
        $numRecords = $performanceObjectiveListCount;
        ohrmListComponent::setItemsPerPage(sfConfig::get('app_items_per_page'));
        ohrmListComponent::setNumberOfRecords($numRecords);
    }


}

?>
