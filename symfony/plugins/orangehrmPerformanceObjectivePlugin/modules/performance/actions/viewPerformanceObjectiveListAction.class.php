<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of viewPerformanceObjectiveListAction
 *
 * @author indiran
 */
class viewPerformanceObjectiveListAction extends basePerformanceAction {

    public $performanceObjectiveService;
    public $performanceObjective;
    protected $initialActionName;
    protected $title = "";
    protected $performanceObjectiveList;
    protected $objectiveListCount;
    protected $pageNumber;

    public function getPageNumber() {
        return $this->pageNumber;
    }

    public function setPageNumber($pageNumber) {
        $this->pageNumber = $pageNumber;
    }

    /**
     * 
     * @param type $request
     */
    public function execute($request) {
        $request->setParameter('initialActionName', $this->getInitalAction());

        $this->_setListComponent($this->getPerformanceObjectiveList(), $this->getObjectiveListCount());

        $params = array();
        $this->parmetersForListCompoment = $params;
    }

    /**
     * 
     * @param type $performanceObjectiveList
     */
    private function _setListComponent($performanceObjectiveList, $performanceObjectiveListCount) {
        $pageNumber = $this->getPageNumber();
        $configurationFactory = new PerformanceObjectiveListConfigurationFactory();
        $configurationFactory->setRuntimeDefinitions(array('title' => $this->title));
        ohrmListComponent::setConfigurationFactory($configurationFactory);
        ohrmListComponent::setActivePlugin('orangehrmPerformanceObjectivePlugin');
        ohrmListComponent::setListData($performanceObjectiveList);
        ohrmListComponent::setPageNumber($pageNumber);
        $numRecords = $performanceObjectiveListCount;
        ohrmListComponent::setItemsPerPage(sfConfig::get('app_items_per_page'));
        ohrmListComponent::setNumberOfRecords($numRecords);
    }

    /**
     * 
     * @param type $initalAction
     */
    protected function setInitalAction($initalAction) {
        $this->initialActionName = $initalAction;
    }

    /**
     * 
     * @return type
     */
    protected function getInitalAction() {
        if ($this->initialActionName == null || $this->initialActionName == "") {
            $this->initialActionName = "viewPerformanceObjectiveList";
        }
        return $this->initialActionName;
    }

    /**
     * 
     * @param type $listTitle
     */
    protected function setTitle($listTitle) {
        $this->title = $listTitle;
    }

    /**
     * 
     * @return type
     */
    protected function getTitle() {
        return $this->title;
    }

    public function getPerformanceObjectiveList() {
        return $this->performanceObjectiveList;
    }

    public function getObjectiveListCount() {
        return $this->objectiveListCount;
    }

}

?>
