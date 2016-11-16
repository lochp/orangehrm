<?php

/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com
 *
 * OrangeHRM is free software; you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301, USA
 */

/**
 * @group PerformanceObjective
 */
class PerformanceObjectiveDaoTest extends PHPUnit_Framework_TestCase {

    private $testCase;
    private $performanceObjectiveDao;
    protected $fixture;
    
    /**
     * Set up method
     */
    protected function setUp() {
        $this->performanceObjectiveDao = new PerformanceObjectiveDao();
        $this->fixture = sfConfig::get('sf_plugins_dir') . '/orangehrmPerformanceObjectivePlugin/test/fixtures/PerformanceObjectiveDao.yml';
        TestDataService::populate($this->fixture);
    }

    /**
     * Testing getEmployeeListAsJson
     */
    public function testPerform() {
        $this->assertTrue(true);
    }
    
    /**
     * Testing getPerformanceObjective
     */
    public function testGetPerformanceObjective() {
        $performanceObjectiveId = 1;
        $result = $this->performanceObjectiveDao->getPerformanceObjective($performanceObjectiveId);
        $this->assertTrue(!empty($result));
        $this->assertEquals(1,$result->getEmpNumber());
    }
    
    public function testGetPerformanceObjectiveList(){
        $parameters['limit'] = null;
        $result = $this->performanceObjectiveDao->getPerformanceObjectiveList($parameters);
        $this->assertEquals(2, count($result));
    }
    
    public function testGetPerformanceReviewersIdListByObjectiveId1(){
        $reviewid = 1;
        $result = $this->performanceObjectiveDao->getPerformanceReviewersIdListByObjectiveId($reviewid);
        $this->assertTrue(!empty($result));       
    }
    
    public function testGetPerformanceReviewersIdListByObjectiveId2(){ 
        $reviewid = 4;
        $result = $this->performanceObjectiveDao->getPerformanceReviewersIdListByObjectiveId($reviewid);
        $this->assertTrue(empty($result));        
    }

    public function testGetPerformanceReviewersIdListByObjectiveId3(){
       $objectiveId = 1;
       $result = $this->performanceObjectiveDao->getPerformanceReviewersIdListByObjectiveId($objectiveId);       
       //only two reviewers assigned
       $this->assertEquals(count($result), 2);
       //reviwer with id 2 and 3 are in the reviewer list.               
       $this->assertTrue(in_array(2, $result));              
       $this->assertTrue(in_array(3, $result));       
    }
    
    public function testGetPerformanceReviewersIdListByObjectiveIdNull(){
        $result = $this->performanceObjectiveDao->getPerformanceReviewersIdListByObjectiveId(null);
        $this->assertTrue(empty($result));
    }

    public function testGetPerformanceObjectiveLog1(){ 
        $objectiveLogId = 2;
        $result = $this->performanceObjectiveDao->getPerformanceObjectiveLog($objectiveLogId);
        $this->assertTrue(!empty($result));        
    }    
    
    public function testGetPerformanceObjectiveLog2(){ 
        $objectiveLogId = 5;
        $result = $this->performanceObjectiveDao->getPerformanceObjectiveLog($objectiveLogId);
        $this->assertTrue(empty($result));        
    }
        
    public function testGetPerformanceObjectiveLogByEmployeeNumber1(){ 
        $empNumber = 1;
        $result = $this->performanceObjectiveDao->getPerformanceObjectiveLogByEmployeeNumber($empNumber);
        $this->assertTrue(!empty($result));        
    }
    
        
    public function testGetPerformanceObjectiveLogByEmployeeNumber2(){ 
        $empNumber = 5;
        $result = $this->performanceObjectiveDao->getPerformanceObjectiveLogByEmployeeNumber($empNumber);
        $this->assertTrue(!empty($result));        
    }
    
}
