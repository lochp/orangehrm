<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PerformanceObjectiveDao
 *
 * @author indiran
 */
class PerformanceObjectiveDao extends BaseDao {

    /**
     * Save PerformanceObjective
     * @param PerformanceObjective $performanceObjective
     * @returns boolean
     * @throws DaoException
     */
    public function savePerformanceObjective(PerformanceObjective $performanceObjective) {
        try {
            return $performanceObjective->save();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd        
    }

    /**
     * Save PerformanceObjectiveLog
     * @param PerformanceObjectiveLog $performanceObjectiveLog
     * @returns boolean
     * @throws DaoException
     */
    public function savePerformanceObjectiveLog(PerformanceObjectiveLog $performanceObjectiveLog) {
        try {
            return $performanceObjectiveLog->save();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd        
    }

    /**
     * Retrieve PerformanceObjective by performanceObjectiveId, must make this retrieve domain object
     * @param int $performanceObjectiveId
     * @returns boolean
     * @throws DaoException
     */
    public function getPerformanceObjective($performanceObjectiveId) {
        try {
            return Doctrine :: getTable('PerformanceObjective')->find($performanceObjectiveId);
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    /**
     * Retrieve PerformanceObjectiveLog by performanceObjectiveLogId, must make this retrieve domain object
     * @param int $performanceObjectiveLogId
     * @returns boolean
     * @throws DaoException
     */
    public function getPerformanceObjectiveLog($performanceObjectiveLogId) {
        try {
            return Doctrine :: getTable('PerformanceObjectiveLog')->find($performanceObjectiveLogId);
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    /**
     * 
     * @param type $objectiveId
     * @return array
     * @throws DaoException
     */
    public function getPerformanceReviewersIdListByObjectiveId($objectiveId) {
        try {
            $reviewerIds = array();
            if ($objectiveId != null) {
                $q = Doctrine_Query :: create()
                        ->select('ptr.reviewer_id')
                        ->from('PerformanceObjectiveReviewer ptr')
                        ->where('ptr.performance_objective_id =?', $objectiveId);
                $reviewers = $q->execute();

                foreach ($reviewers as $reviewer) {
                    array_push($reviewerIds, $reviewer->getReviewerId());
                }
            }

            return $reviewerIds;

            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    /**
     *
     * @return type 
     */
    public function getPerformanceObjectiveLogList() {
        try {
            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjectiveLog ptl')
                    ->where('ptl.status=?', PerformanceObjectiveLog::STATUS_ACTIVE)
                    ->orderBy('added_date DESC');
            return $q->execute();
        } catch (Exception $e) {
            throw new DaoException($e->getMessage());
        }
    }

    /**
     *
     * @return type 
     */
    public function getPerformanceObjectiveList($parameters) {
        try {

            $offset = ($parameters['page'] > 0) ? (($parameters['page'] - 1) * $parameters['limit']) : 0;

            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjective pt')
                    ->leftJoin('pt.Employee e')
                    ->where('pt.status=?', PerformanceObjective::STATUS_ACTIVE)
                    ->orderBy('e.firstName ASC');
            $q->offset($offset);

            if ($parameters['limit'] != null) {
                $q->limit($parameters['limit']);
            }
            return $q->execute();
        } catch (Exception $e) {
            throw new DaoException($e->getMessage());
        }
    }

    /**
     * Retrieve PerformanceObjective by reviewerId, must make this retrieve domain object
     * @param int $reviewerId
     * @returns boolean
     * @throws DaoException
     */
    public function getPerformanceObjectiveListByReviewer($parameters) {
        try {

            $offset = ($parameters['page'] > 0) ? (($parameters['page'] - 1) * $parameters['limit']) : 0;

            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjective p')
                    ->where('p.PerformanceObjectiveReviewer.reviewer_id =?', $parameters['reviewerId'])
                    ->andWhere('p.status=?', PerformanceObjective::STATUS_ACTIVE)
                    ->orderBy('added_date ASC');

            $q->offset($offset);

            if ($parameters['limit'] != null) {
                $q->limit($parameters['limit']);
            }

            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    /**
     * Retrieve PerformanceObjectiveLog by reviewerId, must make this retrieve domain object
     * @param int $reviewerId
     * @returns boolean
     * @throws DaoException
     */
    public function getPerformanceObjectiveLogListByReviewer($reviewerId) {
        try {
            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjectiveLog ptl')
                    ->where('ptl.reviewer_id =?', $reviwerId)
                    ->andWhere('ptl.status=?', PerformanceObjectiveLog::STATUS_ACTIVE)
                    ->orderBy('added_date ASC');
            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    public function deleteReviweres($objectiveId, $reviwerArray) {
        try {
            $q = Doctrine_Query::create()
                    ->delete('PerformanceObjectiveReviewer ptr')
                    ->where('ptr.performance_objective_id =?', $objectiveId)
                    ->andWhereIn('ptr.reviewer_id', $reviwerArray);
            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    public function getPerformanceObjectiveLogListByObjective($objectiveId) {
        try {
            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjectiveLog ptl')
                    ->where('ptl.performance_objective_id =?', $objectiveId)
                    ->andWhere('ptl.status=?', PerformanceObjectiveLog::STATUS_ACTIVE)
                    ->orderBy('added_date DESC');
            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    public function getPerformanceObjectiveByEmployee($parameters) {
        try {
            $offset = ($parameters['page'] > 0) ? (($parameters['page'] - 1) * $parameters['limit']) : 0;
            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjective pt')
                    ->where('pt.emp_number =?', $parameters['employeeId'])
                    ->andWhere('pt.status =?', PluginPerformanceObjective::STATUS_ACTIVE)
                    ->orderBy('added_date DESC');
            $q->offset($offset);

            if ($parameters['limit'] != null) {
                $q->limit($parameters['limit']);
            }
            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    public function getPerformanceObjectiveLogByEmployeeNumber($empNumber) {
        try {
            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjectiveLog ptl')
                    ->where('ptl.PerformanceObjective.emp_number =?', $empNumber)
                    ->andWhere('ptl.status=?', PerformanceObjectiveLog::STATUS_ACTIVE)
                    ->orderBy('added_date DESC');
            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    public function isObjectiveExistForEmployee($empNumber) {
        try {
            //TO DO use count or EXIST to chek
            $q = Doctrine_Query :: create()
                    ->from('PerformanceObjective pt')
                    //->where('pt.emp_number =?', $empNumber)
                    ->where('pt.emp_number =?', $empNumber)
                    ->orderBy('added_date DESC');
            return $q->execute();
            // @codeCoverageIgnoreStart
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
        // @codeCoverageIgnoreEnd
    }

    //Marc Modif
    public function searchRatingByParameters($objectiveId,$reviewerId){
        try {
            $q = Doctrine_Query::create()
                ->select('finalRate')
                ->from('PerformanceObjectiveReviewer por')
                ->where('por.performance_objective_id = ?', $objectiveId)
                ->andWhere('por.reviewer_id = ?', $reviewerId);

            return $q->execute();

        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
    }

    public function isValidObjective($objectiveId){
        try {
            $q = Doctrine_Query :: create()
                ->from('PerformanceObjective po')
                ->where('po.id =?', $objectiveId);
            return $q->execute();
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }
    }

    public function getPerformanceObjectiveReviewer($objectiveId,$reviewerId) {

        try{
            $q = Doctrine_Query :: create()
                ->from('PerformanceObjectiveReviewer por')
                ->where('por.reviewer_id =?', $reviewerId)
                ->andWhere('por.performance_objective_id =?', $objectiveId);
            return $q->execute();
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }

    }
	
	public function getPerformanceObjectiveReviewers($objectiveId) {

        try{
            $q = Doctrine_Query :: create()
                ->from('PerformanceObjectiveReviewer por')
                ->where('por.performance_objective_id =?', $objectiveId);
            return $q->execute();
        } catch (Exception $e) {
            throw new DaoException($e->getMessage(), $e->getCode(), $e);
        }

    }

    public function savePerformanceObjectiveReviewer($objectiveReviewer){

        try{
            $query = Doctrine_Query::create()
                ->update('PerformanceObjectiveReviewer por')
                ->set('final_rate', '?', $objectiveReviewer['finalRate'])
                ->set('final_comment', '?',$objectiveReviewer['finalComment'])
                ->where('por.id = ?', $objectiveReviewer['id']);
            $results = $query->execute();
            return $results;
        } catch (Exception $ex) {
            throw new DaoException($ex->getMessage());
        }

    }

}

?>
