<?php

class PerformanceObjectiveLogListConfigurationFactory extends ohrmListConfigurationFactory {

    protected static $listMode;
    protected static $loggedInEmpNumber;
    protected $title;


    public function __construct($customTitle) {
        $this->title = $customTitle;
    }
    
    protected function init() {
        
        $this->setRuntimeDefinitions(array('title'=> $this->title));
        $header1 = new PerformanceObjectiveLogListHeader();
        $header2 = new ListHeader();
        $header3 = new ListHeader();
        $header4 = new ListHeader();
        $header5 = new ListHeader();
        $header6 = new ListHeader();

        $header1->populateFromArray(array(
            'name' => 'Reviewer',
            'width' => '18%',
            'elementType' => 'performanceObjectiveLogLink',
            'elementProperty' => array(
                'labelGetter' => 'getReviewerName', 
                'placeholderGetters' => array('objectiveId' => 'getPerformanceObjectiveId', 'id' => 'getId'),
                'urlPattern' => 'index.php/performance/addPerformanceObjectiveLog/objectiveId/{objectiveId}/logId/{id}'),
        ));

        $header2->populateFromArray(array(
            'name' => 'Log',
            'width' => '20%',
            'elementType' => 'label',
            'elementProperty' => array('getter' => 'getLog'),
        ));
                
          $header3->populateFromArray(array(
            'name' => 'Comments',
            'width' => '30%',
            'isSortable' => false,
            'elementType' => 'comment',
            'textAlignmentStyle' => 'left',
            'elementProperty' => array(
                'getter' => 'getComment',
                'idPattern' => 'hdnObjectiveLogComment-{id}',
                'namePattern' => 'objectiveLogComments[{id}]',
                'placeholderGetters' => array('id' => 'getId'),
                'hasHiddenField' => true,
                'hiddenFieldName' => 'objectiveLog[{id}]',
                'hiddenFieldId' => 'hdnObjectiveLog_{id}',
                'hiddenFieldValueGetter' => 'getId',
            ),
        ));
             
        $header4->populateFromArray(array(
            'name' => 'Achievement',
            'elementType' => 'label',
            'elementProperty' => array('getter' => 'getAchievementText'),
        ));

        $header5->populateFromArray(array(
            'name' => 'Added Date',
            'elementType' => 'labelDate',
            'elementProperty' => array('getter' => 'getAddedDate'),
        ));

        $header6->populateFromArray(array(
            'name' => 'Modified Date',
            'elementType' => 'labelDate',
            'elementProperty' => array('getter' => 'getModifiedDate'),
        ));

        $this->headers = array($header1, $header2, $header3, $header4, $header5, $header6);
    }

    public function getClassName() {
        return 'PerformanceObjectiveLog';
    }

    public static function setLoggedInEmpNumber($empNumber) {
        self::$loggedInEmpNumber = $empNumber;
    }

}

?>
