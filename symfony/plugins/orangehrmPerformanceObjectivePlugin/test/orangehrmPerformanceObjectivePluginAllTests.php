<?php

class orangehrmPerformanceObjectivePluginAllTests {

    protected function setUp() {

    }

    public static function suite() {

        $suite = new PHPUnit_Framework_TestSuite('orangehrmPerformanceObjectivePluginAllTest');

        /* Dao Test Cases */
        $suite->addTestFile(dirname(__FILE__) . '/model/dao/PerformanceObjectiveDaoTest.php');
        
        /*Services Test Cases*/
        $suite->addTestFile(dirname(__FILE__) . '/model/service/PerformanceObjectiveServiceTest.php');
        
        return $suite;

    }

    public static function main() {
        PHPUnit_TextUI_TestRunner::run(self::suite());
    }

}

if (PHPUnit_MAIN_METHOD == 'orangehrmPerformanceObjectivePluginAllTests::main') {
    orangehrmPerformanceObjectivePluginAllTests::main();
}

?>
