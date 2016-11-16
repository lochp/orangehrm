<?php

class PerformanceObjectiveListConfigurationFactory extends ohrmListConfigurationFactory {

    protected function init() {

        $header1 = new ListHeader();
        $header2 = new ListHeader();
        $header3 = new ListHeader();
        $header4 = new ListHeader();

        $header1->populateFromArray(array(
            'name' => 'Objective',
            'width' => '30%',
            'elementType' => 'link',
            'elementProperty' => array(
                'labelGetter' => array('getter' => 'getObjectiveName'),
                'placeholderGetters' => array('id' => 'getId'),
                'urlPattern' => 'index.php/performance/addPerformanceObjectiveLog/objectiveId/{id}'),
        ));

        $header2->populateFromArray(array(
            'name' => 'Employee',
            'width' => '30%',
            'elementType' => 'link',
            'elementProperty' => array(
                'labelGetter' => array('getEmployee', 'getFirstAndLastNames'),
                'placeholderGetters' => array('id' => 'getId'),
                'urlPattern' => 'index.php/performance/addPerformanceObjectiveLog/objectiveId/{id}'),
        ));


        $header3->populateFromArray(array(
            'name' => 'Added Date',
            'width' => '15%',
            'elementType' => 'labelDate',
            'elementProperty' => array('getter' => 'getAddedDate'),
        ));

        $header4->populateFromArray(array(
            'name' => 'Modified Date',
            'width' => '15%',
            'elementType' => 'labelDate',
            'elementProperty' => array('getter' => 'getModifiedDate'),
        ));

        $this->headers = array( $header2, $header1,$header3, $header4);
    }

    public function getClassName() {
        return 'PerformanceObjective';
    }

}

?>
