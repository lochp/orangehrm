<?php

/**
 * UpskillsConfigurationTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class UpskillsConfigurationTable extends PluginUpskillsConfigurationTable
{
    /**
     * Returns an instance of this class.
     *
     * @return object UpskillsConfigurationTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('UpskillsConfiguration');
    }
}