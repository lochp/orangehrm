<?php

/**
 * PerformanceObjectiveReviewerTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class PerformanceObjectiveReviewerTable extends PluginPerformanceObjectiveReviewerTable
{
    /**
     * Returns an instance of this class.
     *
     * @return object PerformanceObjectiveReviewerTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PerformanceObjectiveReviewer');
    }
}