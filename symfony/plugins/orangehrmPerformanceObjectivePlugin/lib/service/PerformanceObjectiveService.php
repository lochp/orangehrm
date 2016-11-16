<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PerformanceObjectiveService
 *
 * @author indiran
 */
class PerformanceObjectiveService extends BaseService {

    /**
     * @ignore
     */
    private $employeeDao;
    private $performanceObjectiveDao;

    /**
     * Construct
     * @ignore
     */
    public function __construct() {
        //$this->employeeDao = new EmployeeDao();
        $this->setPerformanceObjectiveDao(new PerformanceObjectiveDao());
    }

    /**
     * Get Employee Dao
     * @return EmployeeDao
     * @ignore
     */
    public function getEmployeeDao() {
        return $this->employeeDao;
    }

    /**
     * Set Employee Dao
     * @param EmployeeDao $employeeDao
     * @return void
     * @ignore
     */
    public function setEmployeeDao(EmployeeDao $employeeDao) {
        $this->employeeDao = $employeeDao;
    }

    /**
     * Get PerformanceObjective Dao
     * @return PerformanceObjectiveDao
     * @ignore
     */
    public function getPerformanceObjectiveDao() {
        return $this->performanceObjectiveDao;
    }

    /**
     * Set PerformanceObjective Dao
     * @param PerformanceObjectiveDao $performanceObjectiveDao
     * @return void
     * @ignore
     */
    public function setPerformanceObjectiveDao(PerformanceObjectiveDao $PerformanceObjectiveDao) {
        $this->performanceObjectiveDao = $PerformanceObjectiveDao;
    }

    public function savePerformanceObjective(PerformanceObjective $performanceObjective) {
        return $this->getPerformanceObjectiveDao()->savePerformanceObjective($performanceObjective);
    }

    public function savePerformanceObjectiveLog(PerformanceObjectiveLog $performanceObjectiveLog) {
        //save performanceObjective
        return $this->getPerformanceObjectiveDao()->savePerformanceObjectiveLog($performanceObjectiveLog);
    }

    public function DeletePerformanceObjective($performanceObjectiveId) {
        //set performance objectif state to deleted 
        $performanceObjective = $this->getPerformanceObjective($performanceObjectiveId);
        if ($performanceObjective instanceof PerformanceObjective) {

            $performanceObjective->setStatus(PerformanceObjective::STATUS_DELETED);
            //set performance objective logs state to deleted
            $loglist = $performanceObjective->getPerformanceObjectiveLog();

            foreach ($loglist as $log) {
                if ($log instanceof PerformanceObjectiveLog) {
                    $log->setStatus(PerformanceObjectiveLog::STATUS_DELETED);
                    $loglist->add($log);
                }
            }
            $performanceObjective->setPerformanceObjectiveLog($loglist);

            //set performance objective reviewers state to deleted 
            $reviewers = $performanceObjective->getPerformanceObjectiveReviewer();
            foreach ($reviewers as $reviewer) {
                if ($reviewer instanceof PerformanceObjectiveReviewer) {
                    $reviewer->setStatus(PerformanceObjectiveReviewer::STATUS_DELETED);
                    $reviewers->add($reviewer);
                }
            }
            $performanceObjective->setPerformanceObjectiveReviewer($reviewers); 
            $this->savePerformanceObjective($performanceObjective);
        }
        return; // $this->savePerformanceObjective($performanceObjective);
    }

    /**
     * Retrieve PerformanceObjective by performanceObjectiveId
     * @param int $performanceObjectiveId
     * @returns boolean
     * @throws DaoException
     */
    public function getPerformanceObjective($performanceObjectiveId) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjective($performanceObjectiveId);
    }

    /**
     * Retrieve PerformanceObjectiveLog by performanceObjectiveLogId
     * @param int $performanceObjectiveLogId
     * @returns boolean
     * @throws DaoException
     */
    public function getPerformanceObjectiveLog($performanceObjectiveLogId) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveLog($performanceObjectiveLogId);
    }

    public function getPerformanceReviewersIdListByObjectiveId($reviewId) {
        return $this->getPerformanceObjectiveDao()->getPerformanceReviewersIdListByObjectiveId($reviewId);
    }

    public function getPerformanceObjectiveListByReviewer($searchParameter) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveListByReviewer($searchParameter);
    }

    public function getPerformanceObjectiveLogListByReviewer($reviewerId) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveLogListByReviewer($reviewerId);
    }

    public function getPerformanceObjectiveLogListByObjective($objectiveId) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveLogListByObjective($objectiveId);
    }

    public function getPerformanceObjectiveList($searchParameter) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveList($searchParameter);
    }

    public function getPerformanceObjectiveLogList() {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveLogList();
    }

    public function deleteReviweres($objectiveId, $reviwerArray) {
        return $this->getPerformanceObjectiveDao()->deleteReviweres($objectiveId, $reviwerArray);
    }

    public function getObjectiveReviewersIdListByReview($reviewId) {
        return $this->getPerformanceObjectiveDao()->getObjectiveReviewersIdListByReview($reviewId);
    }

    public function getPerformanceObjectiveByEmployee($parameters) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveByEmployee($parameters);
    }

    public function getPerformanceObjectiveLogByEmployeeNumber($empNumber) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveLogByEmployeeNumber($empNumber);
    }

    public function isObjectiveExistForEmployee($empNumber) {
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveLogByEmployeeNumber($empNumber);
    }
    
    /**
     * This method is used to check whether a particular performance objective is accessible by logged in employee.
     * @param type $performanceObjectiveId
     * @param type $loggedInEmpNumber
     * @return boolean
     */
    public function isObjectiveAccessibleForEmployee($performanceObjectiveId,$loggedInEmpNumber){
        $isAccessible = false;        
        $reviwers = $this->getPerformanceReviewersIdListByObjectiveId($performanceObjectiveId);        
        if(in_array($loggedInEmpNumber, $reviwers)){
            $isAccessible = true;
        }
        return $isAccessible;
    }
    
	/**
     *
     * @param array $searchResult
     * @return string 
     */
    public function getCsvContentDetail($searchResult) {
        $headers = array("Reviewer", "Log", "Comment", "Performance", "Added Date", "Modified Date");
        foreach($headers as &$header){
        	$header = __($header);
        }
        
        $csvResultSet = array ();        
        foreach ($searchResult as $log) {
            $csvRow = array();
            $csvRow [] = $log->getReviewerName();
            $csvRow [] = $log->getLog();
            $csvRow [] = $log->getComment();
            $csvRow [] = $log->getAchievementText();
            $csvRow [] = set_datepicker_date_format($log->getAddedDate());
            $csvRow [] = set_datepicker_date_format($log->getModifiedDate());
            $csvResultSet[] = $csvRow;
        }
        
        $csvBuilder = new CSVBuilder();
        return $csvBuilder->createCSVString($headers, $csvResultSet);
    }
    
    public function getPerformanceObjectiveListCount() {
        $searchParameter = array('limit' => null);
        $objectiveList = $this->getPerformanceObjectiveDao()->getPerformanceObjectiveList($searchParameter);
        return count($objectiveList);
    }
    
    public function getPerformanceObjectiveListCountByReviewer($searchParameter){
        $searchParameter['limit'] =  null;
        $objectiveList = $this->getPerformanceObjectiveDao()->getPerformanceObjectiveListByReviewer($searchParameter);
        return count($objectiveList);
    }
    
    public function getPerformanceObjectiveListCountByEmployee($searchParameter){
        $searchParameter['limit'] =  null;
        $objectiveList = $this->getPerformanceObjectiveDao()->getPerformanceObjectiveByEmployee($searchParameter);
        return count($objectiveList);
    }

    //Marc Modif
    public function searchRatingByParameters($objectiveId,$reviewerId){
        return $this->getPerformanceObjectiveDao()->searchRatingByParameters($objectiveId,$reviewerId);
    }
    
    public function isValidObjective($objectiveId){
        return $this->getPerformanceObjectiveDao()->isValidObjective($objectiveId);
    }

    public function getPerformanceObjectiveReviewer($objectiveId,$reviewerId){
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveReviewer($objectiveId,$reviewerId);
    }
	
	public function getPerformanceObjectiveReviewers($objectiveId){
        return $this->getPerformanceObjectiveDao()->getPerformanceObjectiveReviewers($objectiveId);
    }

    public function savePerformanceObjectiveReviewer($objectiveReviewer){
        return $this->getPerformanceObjectiveDao()->savePerformanceObjectiveReviewer($objectiveReviewer);
    }

}