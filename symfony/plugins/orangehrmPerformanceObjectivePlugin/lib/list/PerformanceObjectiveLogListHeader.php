<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PerformanceObjectiveListHeader
 *
 * @author Anika
 */
class PerformanceObjectiveLogListHeader extends ListHeader{
  public function __construct() {
      $this->elementTypes[] = 'performanceObjectiveLogLink';
  }
}

?>
