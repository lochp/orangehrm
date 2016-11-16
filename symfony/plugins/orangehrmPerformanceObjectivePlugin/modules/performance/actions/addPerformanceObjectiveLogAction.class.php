<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of addReviewAction
 *
 * @author indiran
 */
class addPerformanceObjectiveLogAction extends basePerformanceAction {

    public $performanceObjective;
    public $performanceObjectiveLogList;
    public $employeeName;
    private $loggedInEmpNumber;
    private $title = "";
    private $logId;
    private $isAdmin;
    private $ObjectiveOwner;
    private $isObjectiveOwner = false;

    /**
     * 
     */
    public function preExecute() {
        $this->loggedInEmpNumber = $this->getUser()->getAttribute('auth.empNumber');
        $usrObj = $this->getUser()->getAttribute('user');
        $this->isAdmin = $usrObj->isAdmin();
        $this->logId = $this->getRequest()->getParameter('logId');
        $this->objectiveId = $this->getRequest()->getParameter('objectiveId');
        $valid = false;
        if (!empty($this->logId)) {
            $performanceObjectiveLog = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLog($this->logId);
            if (($performanceObjectiveLog instanceof PerformanceObjectiveLog) && ($performanceObjectiveLog->canUpdate()) && ($this->objectiveId == $performanceObjectiveLog->getPerformanceObjectiveId())) {
                $valid = true;
            }
        } else if (!empty($this->objectiveId)) {
            $valid = $this->canLogsAccessed();
        }
        if ($valid == false) {
            $this->forward(sfConfig::get('sf_secure_module'), sfConfig::get('sf_secure_action'));
        }
    }

    public function execute($request) {
        
        $saved = false;
        if ($this->isAdmin && !$this->isObjectiveOwner) {
            $request->setParameter('initialActionName', 'viewEmployeePerformanceObjectiveList');
        } else if ($this->isObjectiveOwner) {
            $request->setParameter('initialActionName', 'viewMyPerformanceObjectiveList');
        } else {
            $request->setParameter('initialActionName', 'viewEmployeePerformanceObjectiveList');
        }

        $this->setForm(new AddPerformanceObjectiveLogForm());

        if ($request->isMethod('post')) {
            $this->form->bind($request->getParameter('addperformanceObjectiveLog'));
            $performanceObjectiveLogList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLogListByObjective($this->objectiveId);

            $this->_setListComponent($performanceObjectiveLogList);
            $params = array();
            $this->parmetersForListCompoment = $params;

            if ($this->form->isValid()) {
                //add to db                        
                $performanceObjectiveLogNew = $this->form->getPerformanceObjectiveLog();
                $id = $performanceObjectiveLogNew->getId();
                $userId = $this->getUser()->getAttribute('auth.userId');
                if (!empty($id)) {

                    $performanceObjectiveLog = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLog($id);

                    $reviewerUserId = $performanceObjectiveLog->getUserId();
                    if ($reviewerUserId == $userId || $this->isAdmin) {
                        $performanceObjectiveLog->setUserId($userId);
                        if (!$this->isAdmin) {
                            $performanceObjectiveLog->setReviewerId($this->loggedInEmpNumber);
                        }
                        $performanceObjectiveLog->setLog($performanceObjectiveLogNew->getLog());
                        $performanceObjectiveLog->setAchievement($performanceObjectiveLogNew->getAchievement());
                        $performanceObjectiveLog->setComment($performanceObjectiveLogNew->getComment());
                        $performanceObjectiveLog->setModifiedDate(date(PerformanceObjective::DATE_FORMAT));
                        $this->getPerformanceObjectiveService()->savePerformanceObjectiveLog($performanceObjectiveLog);
                        $saved = true;
                    }
                } else {
                    $performanceObjectiveLogNew->setReviewerId($this->loggedInEmpNumber);
                    $performanceObjectiveLogNew->setUserId($userId);

                    $performanceObjectiveLogNew->setAddedDate(date(PerformanceObjective::DATE_FORMAT));
                    $performanceObjectiveLogNew->setStatus(PerformanceObjectiveLog::STATUS_ACTIVE);
                    $this->getPerformanceObjectiveService()->savePerformanceObjectiveLog($performanceObjectiveLogNew);
                    $saved = true;
                }
                //redirect to list view.
                $objectiveId = $performanceObjectiveLogNew->getPerformanceObjectiveId();
                $performanceObjectiveLogList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLogListByObjective($objectiveId);
                $this->_setListComponent($performanceObjectiveLogList);
                $params = array();
                $this->parmetersForListCompoment = $params;
                if ($saved) {
                    $this->getUser()->setFlash('success', __(TopLevelMessages::SAVE_SUCCESS));
                }

                $this->redirect('performance/addPerformanceObjectiveLog?objectiveId=' . $objectiveId);
            }
        } else {

            $this->form->setDefaultValues($this->objectiveId, $this->logId);
            $performanceObjective = $this->getPerformanceObjectiveService()->getPerformanceObjective($this->objectiveId);
            if ($performanceObjective instanceof PerformanceObjective) {
                if ($performanceObjective->getEmpNumber() == $this->loggedInEmpNumber) {
                    $this->title = __('My Objective Logs') . ' - ' . $performanceObjective->getObjectiveName();
                } else {
                    $this->employeeName = $performanceObjective->getEmployee()->getFirstAndLastNames();
                    $this->title = $performanceObjective->getObjectiveName().__(' - Objective Log ') . "( ".$this->employeeName." )";
                }
            }

            $this->performanceObjectiveLogList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLogListByObjective($this->objectiveId);

            $params = array();
            $this->parmetersForListCompoment = $params;
            $this->_setListComponent($this->performanceObjectiveLogList);
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

    /**
     * 
     * @param type $performanceObjectiveLogList
     */
    private function _setListComponent($performanceObjectiveLogList) {
        PerformanceObjectiveLogListConfigurationFactory::setLoggedInEmpNumber($this->loggedInEmpNumber);
        $configurationFactory = new PerformanceObjectiveLogListConfigurationFactory($this->title);
        ohrmListComponent::setConfigurationFactory($configurationFactory);
        ohrmListComponent::setActivePlugin('orangehrmPerformanceObjectivePlugin');
        ohrmListComponent::setListData($performanceObjectiveLogList);
    }

    /**
     * This method checks whether objective logs accessible by logged in user or not.
     * @return boolean
     */
    private function canLogsAccessed() {
        $canAccess = false;
        $reviwers = $this->getPerformanceObjectiveService()->getPerformanceReviewersIdListByObjectiveId($this->objectiveId);
        $this->performanceObjective = $this->getPerformanceObjectiveService()->getPerformanceObjective($this->objectiveId);
        $this->objectiveOwner = (!empty($this->performanceObjective)) ? $this->performanceObjective->getEmpNumber() : "";
        
        if ($this->objectiveOwner == $this->loggedInEmpNumber) {
            $this->isObjectiveOwner = true;
            
        }

        if (!empty($reviwers) && count($reviwers) > 0) { 
            if (!$this->objectiveOwner || $this->isAdmin || in_array($this->loggedInEmpNumber, $reviwers)) {
                $canAccess = true; 
            } else if($this->isObjectiveOwner){
                $canAccess = true;
            }
        }
        return $canAccess;
    }

}

?>
