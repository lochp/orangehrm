<?php

class PerformanceObjectiveListAdminConfigurationFactory extends ohrmListConfigurationFactory {
	
	protected function init() {

		$header1 = new ListHeader();
		$header2 = new ListHeader();
                $header3 = new ListHeader();                
                $header4 = new ListHeader();
                $header5 = new ListHeader();

		$header1->populateFromArray(array(
		    'name' => 'Employee',
		    'elementType' => 'link',
		    'elementProperty' => array(
			'labelGetter' => array('getEmployee','getFirstAndLastNames'),
                        'placeholderGetters' => array('id' => 'getId'),
                        'urlPattern' => 'index.php/performance/addPerformanceObjective/id/{id}'), 
		));  
                
		$header5->populateFromArray(array(
		    'name' => 'Objective Group',
			'elementType' => 'label',
			'elementProperty' => array('getter' => 'getObjectiveGroup'),
		));  
		
		$header4->populateFromArray(array(
				'name' => 'Objective',
				'elementType' => 'link',
				'elementProperty' => array(
						'labelGetter' => array('getter' => 'getObjectiveName'),
						'placeholderGetters' => array('id' => 'getId'),
						'urlPattern' => 'index.php/performance/addPerformanceObjective/id/{id}'),
						
		));
                
               $header2->populateFromArray(array(
		    'name' => 'Added Date',
                   'width' => '15%',
		    'elementType' => 'labelDate',
		    'elementProperty' => array('getter' => 'getAddedDate'),
		));
               
               $header3->populateFromArray(array(
		    'name' => 'Modified Date',
                   'width' => '15%',
		    'elementType' => 'labelDate',
		    'elementProperty' => array('getter' => 'getModifiedDate'),
		));
                               
		$this->headers = array($header1, $header5, $header4, $header2, $header3);
	}

	public function getClassName() {
		return 'PerformanceObjectiveAdmin';
	}

}

?>
