<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of addReviewForm
 *
 * @author indiran
 */
class AddPerformanceObjectiveLogForm extends sfForm {

    public $performanceObjectiveService;

    public function getPerformanceObjectiveService() {
        if (is_null($this->performanceObjectiveService)) {
            $this->performanceObjectiveService = new PerformanceObjectiveService();
        }
        return $this->performanceObjectiveService;
    }

    public function configure() {
        $achievement = array(1 => 'Does Not Meet Expectations', 2 => 'Meets Some Expectations', 3 => 'Meets Expectations', 4 => 'Exceeds Expectations', 5 => 'Excellent');
        $this->setWidgets(array(
            //TO DO remove name  
            'log' => new sfWidgetFormInput(),
            'achievement' => new sfWidgetFormSelect(array('choices' => $achievement)),
            'comment' => new sfWidgetFormTextarea(),
            'hdnTrckId' => new sfWidgetFormInputHidden(),
            'hdnLogId' => new sfWidgetFormInputHidden(),
            'hdnMode' => new sfWidgetFormInputHidden(),
        ));

        $this->setValidators(array(
            'log' => new sfValidatorString(array('required' => true)),
            'achievement' => new sfValidatorChoice(array('choices' => array_keys($achievement))),
            'comment' => new sfValidatorString(array('required' => true, 'max_length'=> 3000)),
            'hdnTrckId' => new sfValidatorString(array('required' => false)),
            'hdnLogId' => new sfValidatorString(array('required' => false)),
            'hdnMode' => new sfValidatorString(array('required' => false))
        ));

        $this->widgetSchema->setNameFormat('addperformanceObjectiveLog[%s]');
        $this->widgetSchema->setLabels(array('log' => __('log'). ' <em>*</em>',
            'comment' => __("Comment"). ' <em>*</em>'));
    }

    public function getPerformanceObjectiveLog() {

        $performanceObjectiveLog = new PerformanceObjectiveLog();
        $performanceObjectiveLog->setPerformanceObjectiveId($this->getValue('hdnTrckId'));
         
        //die;
        $logId = $this->getValue('hdnLogId');
        if (!empty($logId)) {
            $performanceObjectiveLog->setId($logId);
        }
        $performanceObjectiveLog->setComment($this->getValue('comment'));
        $performanceObjectiveLog->setLog($this->getValue('log'));
        $performanceObjectiveLog->setAchievement($this->getValue('achievement'));
        return $performanceObjectiveLog;
    }

    public function setDefaultValues($objectiveId, $objectiveLogId) {
        if (!empty($objectiveLogId)) { 
            $performanceObjectiveLog = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLog($objectiveLogId);
            if ($performanceObjectiveLog instanceof PerformanceObjectiveLog) {
                $this->setDefault('hdnTrckId', $performanceObjectiveLog->getPerformanceObjectiveId());
                $this->setDefault('hdnLogId', $performanceObjectiveLog->getId());
                $this->setDefault('log', $performanceObjectiveLog->getLog());
                $this->setDefault('comment', $performanceObjectiveLog->getComment());
                $this->setDefault('achievement', $performanceObjectiveLog->getAchievement());
                $this->setDefault('hdnMode', 'edit');
            }
        } elseif (!empty($objectiveId)) { 
            //TO DO chechk if objective exist 
            $this->setDefault('hdnTrckId', $objectiveId);
        }
    }

}

?>
