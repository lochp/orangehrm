<?php

/**
 * PerformanceObjectiveLogTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class PerformanceObjectiveLogTable extends PluginPerformanceObjectiveLogTable
{
    /**
     * Returns an instance of this class.
     *
     * @return object PerformanceObjectiveLogTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PerformanceObjectiveLog');
    }
}