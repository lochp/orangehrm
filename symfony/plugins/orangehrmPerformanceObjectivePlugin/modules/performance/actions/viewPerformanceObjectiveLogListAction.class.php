<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of viewFeedbackListAction
 *
 * @author indiran
 */
class viewPerformanceObjectiveLogListAction extends basePerformanceAction{
    //TO DO move to a baseAction
    
    public $performanceObjective; 
    public $performanceObjectiveLogList;
    

    public function execute($request) {
        
        $loggedInEmpNumber = $this->getUser()->getAttribute('auth.empNumber');        
        $usrObj = $this->getUser()->getAttribute('user');
        $isAdmin = $usrObj->isAdmin();
        
        $objectiveId = $request->getParameter('objectiveId');   
        $mode = $request->getParameter('mode');
        
        //Reviwer/admin clicks on the link viewPerformanceObjectiveLogList?objectiveId= in viewPerformanceObjectiveList
        if (!empty($objectiveId)) {
            //query for $objectiveId and $reviwerId
            //TO DO check whether have permission to view
            $performanceObjectiveLogList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLogListByObjective($objectiveId);
        }
        elseif ($mode == PluginPerformanceObjectiveLog::MODE_MY){                     
             //if mode is my
             // then get user
             // then get employee and empNumber
             //pass that value to the service function and get the  
             $performanceObjectiveLogList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLogByEmployeeNumber($loggedInEmpNumber);
             
        }     
        //if user is admin get the list for $objectiveId
        //get all the log lists
        elseif($isAdmin){
            $performanceObjectiveLogList = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLogList();
        }else{
			$this->forward(sfConfig::get('sf_secure_module'), sfConfig::get('sf_secure_action'));
		}
        $this->_setListComponent($performanceObjectiveLogList);
        $params = array();
        $this->parmetersForListCompoment = $params; 
    }

    private function _setListComponent($performanceObjectiveLogList) {
        $configurationFactory = new PerformanceObjectiveLogListConfigurationFactory();
        ohrmListComponent::setConfigurationFactory($configurationFactory);
        ohrmListComponent::setActivePlugin('orangehrmPerformanceObjectivePlugin');
        ohrmListComponent::setListData($performanceObjectiveLogList);
    }
    
    protected function getListConfigurationFactory() {
        return new PerformanceObjectiveLogListConfigurationFactory();
    }
}

?>
