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
abstract class displayReportAction extends basePimReportAction {

    private $confFactory;
    private $form;
    protected $reportName = 'pim-report';
    protected $reportTitle = 'PIM Report';
    public $timesheetService;
    public $employeeService;

    public function getEmployeeService(){
        return $this->employeeService;
    }

    public function setEmployeeService($employeeService){
        $this->employeeService = $employeeService;
    }

    public function getTimesheetService() {
        return $this->timesheetService;
    }

    public function setTimesheetService($timesheetService){
        $this->timesheetService = $timesheetService;
    }

    /**
     * Get Logger instance
     * @return Logger
     */
    protected function getLoggerInstance() {
        if (is_null($this->logger)) {
            $this->logger = Logger::getLogger('core.report.displayReportAction');
        }
        return $this->logger;
    }
    
    /**
     *
     * @return string
     */
    public function getReportName() {
        return $this->reportName;
    }

    /**
     *
     * @param string $reportName 
     */
    public function setReportName($reportName) {
        $this->reportName = $reportName;
    }

    /**
     *
     * @return string
     */
    public function getReportTitle() {
        return $this->reportTitle;
    }

    /**
     *
     * @param string $reportTitle 
     */
    public function setReportTitle($reportTitle) {
        $this->reportTitle = $reportTitle;
    }

    
    public function execute($request) {
        
        $this->setInitialActionDetails($request);

        $reportId = $request->getParameter("reportId");
        $backRequest = $request->getParameter("backRequest");
        $arrayValues = $request->getParameter('formValues');

        $reportableGeneratorService = new ReportGeneratorService();

        $sql = $request->getParameter("sql");

        $reportableService = new ReportableService();
        $this->report = $reportableService->getReport($reportId);

        if (empty($this->report)) {
            return $this->renderText(__('Invalid Report Specified'));
        }

        $useFilterField = $this->report->getUseFilterField();

        if (!$useFilterField) {

            $this->setCriteriaForm();
            if ($request->isMethod('post')) {

                $this->form->bind($request->getParameter($this->form->getName()));

                if ($this->form->isValid()) {
                    $reportGeneratorService = new ReportGeneratorService();
                    $formValues = $this->form->getValues();
                    $this->setReportCriteriaInfoInRequest($formValues);

                    $sql = $reportGeneratorService->generateSqlForNotUseFilterFieldReports($reportId, $formValues);
                }else{
                    $this->redirect($request->getReferer());
                }
            }
        } else {

            if ($request->isMethod("get")) {
                $reportGeneratorService = new ReportGeneratorService();
//                $selectedRuntimeFilterFieldList = $reportGeneratorService->getSelectedRuntimeFilterFields($reportId);

                $selectedFilterFieldList = $reportableService->getSelectedFilterFields($reportId, false);

                $values = $this->setValues();
//                $linkedFilterFieldIdsAndFormValues = $reportGeneratorService->linkFilterFieldIdsToFormValues($selectedRuntimeFilterFieldList, $values);
//                $runtimeWhereClauseConditionArray = $reportGeneratorService->generateWhereClauseConditionArray($linkedFilterFieldIdsAndFormValues);

                $runtimeWhereClauseConditionArray = $reportGeneratorService->generateWhereClauseConditionArray($selectedFilterFieldList, $values);
                $sql = $reportGeneratorService->generateSql($reportId, $runtimeWhereClauseConditionArray);
            }
        }

        $paramArray = array();

        if ($reportId == 1) {
            if (!isset($backRequest)) {
                $this->getUser()->setAttribute("reportCriteriaSql", $sql);
                $this->getUser()->setAttribute("parametersForListComponent", $this->setParametersForListComponent());
            }
            if (isset($backRequest) && $this->getUser()->hasAttribute("reportCriteriaSql")) {
                $sql = $this->getUser()->getAttribute("reportCriteriaSql");
                $paramArray = $this->getUser()->getAttribute("parametersForListComponent");
            }
        }

        $params = (!empty($paramArray)) ? $paramArray : $this->setParametersForListComponent();
        if ($reportId != 2) {
            try {
                $rawDataSet = $reportableGeneratorService->generateReportDataSet($reportId, $sql);
            } catch (Exception $e) {
                $this->getLoggerInstance()->error($e->getMessage(), $e);
                $this->getUser()->setFlash(displayMessageAction::MESSAGE_HEADING, __('Report could not be generated'), false);
                $this->getUser()->setFlash('error.nofade', __('Please run the report again.'), false);
                $this->forward('core', 'displayMessage');
            }

            $dataSet = self::escapeData($rawDataSet);

            $headerGroups = $reportableGeneratorService->getHeaderGroups($reportId);

            $this->setConfigurationFactory();
            $configurationFactory = $this->getConfFactory();
            $configurationFactory->setHeaderGroups($headerGroups);

            if ($reportId == 3) {
                if (empty($dataSet[0]['employeeName']) && $dataSet[0]['totalduration'] == 0) {
                    $dataSet = null;
                }
            }

            //Set the ConfigurationFactory
            ohrmListComponent::setConfigurationFactory($configurationFactory);

            $this->setListHeaderPartial();

            //Set the ListData
            ohrmListComponent::setListData($dataSet);

            //Set the params
            $this->parmetersForListComponent = $params;

            $this->initilizeDataRetriever($configurationFactory, $reportableGeneratorService, 'generateReportDataSet', array($reportId, $sql));

            $listData = call_user_func_array(array($reportableGeneratorService, 'generateReportDataSet'), array($reportId, $sql));
        }
        
        //For PIM Reports
        if($reportId == 5) {

            // Create new PHPExcel object
            $objPHPExcel = new PHPExcel();

            // Set document properties
            $objPHPExcel->getProperties()->setCreator("Upskills - Reports")
                ->setLastModifiedBy("Upskills - Reports")
                ->setTitle("Upskills - PIM Reports")
                ->setSubject("Upskills - PIM Reports")
                ->setDescription("Upskills - PIM Reports")
                ->setKeywords("upskills excel pim");

            //Set the style header
            $style_header = array(
                'fill' => array(
                    'type' => PHPExcel_Style_Fill::FILL_SOLID,
                    'color' => array('rgb' => '111170'),
                ),
                'font' => array(
                    'bold' => true,
                    'color' => array('rgb' => 'FFFFFF'),
                )
            );

            //To get the headers
            $column = 'A';
            foreach ($headerGroups as $headerGroup) {
                $objPHPExcel->setActiveSheetIndex(0)
                    ->setCellValue($column . 1, $headerGroup->getName())
                    ->getStyle($column . 1)->applyFromArray($style_header);
                foreach ($headerGroup->getHeaders() as $header) {
                    $objPHPExcel->setActiveSheetIndex(0)
                        ->setCellValue($column . 2, $header->getName())
                        ->getStyle($column . 2)->applyFromArray($style_header);
                    $column++;
                }
            }

            $headers = $configurationFactory->getHeaders();
            $dataArray = array();
            $row = 3;

            //Create the excel report
            foreach ($listData as $object) {
                $column = 'A';
                $dataArray[$row] = array();
                foreach ($headers as $header) {
                    //if ($header->isExportable()) {
                    $elementType = $header->getElementType();
                    $properties = $header->getElementProperty();
                    $cellClass = ucfirst($header->getElementType()) . 'Cell';

                    $cell = new $cellClass;
                    $cell->setProperties($properties);
                    $cell->setDataObject($object);

                    $value = $cell->toValue();

                    if ($cell->getPropertyValue('isValueList')) {
                        if ($value == array('')) {
                            $value = '';
                        } elseif (is_array($value)) {
                            $value = implode(',', $value);
                        }
                    }
                    $dataArray[$row][] = $value;
                    $objPHPExcel->setActiveSheetIndex(0)
                        ->setCellValue($column . $row, $value);
                    $column++;
                    //}
                }
                $row++;
            }

            // Rename worksheet
            $objPHPExcel->getActiveSheet()->setTitle('Test');

            // Set active sheet index to the first sheet, so Excel opens this as the first sheet
            $objPHPExcel->setActiveSheetIndex(0);

            // Redirect output to a client’s web browser (Excel5)
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="' . $this->reportName . '.xls"');
            header('Cache-Control: max-age=0');

            // To permit the download of the excel file
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
            $objWriter->save('php://output');
        }
        
        // For Timesheet Employee Reports
        // Loc modified 
        if ($reportId == 2) {

            // Create new PHPExcel object
            $objPHPExcel1 = new PHPExcel();

            // Set document properties
            $objPHPExcel1->getProperties()->setCreator("Upskills - Reports")
                ->setLastModifiedBy("Upskills - Reports")
                ->setTitle("Upskills - Reports on " . $dataSet[0]['employeeName'])
                ->setSubject("Upskills - Reports on " . $dataSet[0]['employeeName'])
                ->setDescription("Reports on someone for test")
                ->setKeywords("upskills excel test")
                ->setCategory("Youhou");

            //Set the style header
            $style_header = array(
                'fill' => array(
                    'type' => PHPExcel_Style_Fill::FILL_SOLID,
                    'color' => array('rgb' => '111170'),
                ),
                'font' => array(
                    'bold' => true,
                    'color' => array('rgb' => '#FFFFFF'),
                )
            );

            // Start Code 
            /**
             * Loc modified
             */
            
            $objPHPExcel1->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setSize(30)->setBold(true)->getColor()->setRGB('0035149');
            $objPHPExcel1->setActiveSheetIndex(0)->setCellValue('A1', "UPSKILLS");
            
            $objPHPExcel1->setActiveSheetIndex(0)->mergeCells('B3:G3');
            $objPHPExcel1->setActiveSheetIndex(0)->getStyle('B3')->getFont()->setSize(15)->setBold(true)->getColor()->setRGB('0035149');
            $objPHPExcel1->setActiveSheetIndex(0)->getStyle('B3')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER)->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
            $objPHPExcel1->setActiveSheetIndex(0)->getStyle('B3:G3')->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);//->setColor(PHPExcel_Style_Color::COLOR_BLUE);
            $objPHPExcel1->setActiveSheetIndex(0)->setCellValue('B3', "Monthly Time Sheet");
            
            /**
             * title
             */
            $objPHPExcel1->getActiveSheet()->setCellValue('B5', 'Consultant')
		            ->setCellValue('B6', 'Client:')
		            ->setCellValue('F5', 'Month Start:')
		            ->setCellValue('F6', 'Month End:')
            ;
            // Header
            $row = 8;
            $column = 'B';
            $objPHPExcel1->getActiveSheet()->setCellValue($column++.$row, 'Day')
            		->setCellValue($column++.$row, 'Date')
            		->setCellValue($column++.$row, 'Project')
            		->setCellValue($column++.$row, 'Activity')
            		->setCellValue($column++.$row, 'Hours')
            		->setCellValue($column++.$row, 'Days');
            $row++;
            //Differents used Services
            $employeeService = new EmployeeService();
            $timesheetService = new TimesheetService();
            $projectService = new ProjectService();
            
            //Get all the important values of the form
            $empId = $arrayValues["employee_name"]["empId"];
            $employee = $employeeService->getEmployee($empId);
            if ($arrayValues["project_date_range"]["from"]) {
            	$fromDate = strtotime($arrayValues["project_date_range"]["from"]);
            }else{
            	$fromDate = strtotime("1970-01-01");
            }
            if ($arrayValues["project_date_range"]["to"]) {
            	$toDate = strtotime($arrayValues["project_date_range"]["to"]);
            }else{
            	$toDate = strtotime(date('Y-m-d'));
            }
            $onlyIncludeApprovedTimesheets = $arrayValues["only_include_approved_timesheets"];
        	
        	//For just one employee
            if ($empId) {
                //Set the timesheet List, only approved or not
				/**
				 * Fill data into title: Employee, from date, to date
				 * @var unknown
				 */
            	$objPHPExcel1->getActiveSheet()->setCellValue('C5', $employee->getLastName() . ' ' . $employee->getFirstName())
// 	            	->setCellValue('C6', 'Client:')
	            	->setCellValue('G5', $arrayValues["project_date_range"]["from"])
	            	->setCellValue('G6', $arrayValues["project_date_range"]["to"])
            	;
            	
            	/**End code*/
                $timesheets = array();
                if ($onlyIncludeApprovedTimesheets == "on") {
                    $timesheetsTemp = $timesheetService->getTimesheetListByEmployeeIdAndState(array($empId), array("APPROVED"));
                    foreach ($timesheetsTemp as $timesheet) {
                        $timesheets[] = $timesheetService->getTimesheetById($timesheet["timesheetId"]);
                    }
                } else {
                    $timesheets = $timesheetService->getTimesheetByEmployeeId(intval($employee->getEmpNumber()));
                }
				
                //Set the tab
                foreach ($timesheets as $timesheet) {
                    $timesheetItems = $timesheetService->getTimesheetItem($timesheet->getTimesheetId(), $employee->getEmpNumber());
                    if ($timesheetItems) {
                        foreach ($timesheetItems as $timesheetItem) {
                            if (($fromDate <= strtotime($timesheetItem->getDate())) && (strtotime($timesheetItem->getDate()) <= $toDate)) {
                                if (intval($arrayValues["project_name"]) == -1) {
                                    $projectId = $timesheetItem->getProjectId();
                                    $customerEmailDoctrine = $projectService->getCustomerMailByProjectId($projectId);
                                    $customerEmail = $customerEmailDoctrine[0]['customerMail'];
                                    $projectNameWithCustomerName = $projectService->getProjectNameWithCustomerName($projectId);
                                    $project = explode(" - ", $projectNameWithCustomerName);
                                    $activityId = $timesheetItem->getActivityId();

                                    $activityName = $timesheetService->getActivityByActivityId($activityId)->getName();
                                    $column = 'B';

                                    // Customer
                                    /* $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[0]);
                                    $column++; */
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                    ->setCellValue($column . $row, $timesheetItem->getDate()); /*Day - will edit later*/
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                    ->setCellValue($column . $row, $timesheetItem->getDate()); /*Date*/
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[1]); /*Project*/
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $activityName); /*Activity*/
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $timesheetItem->getDate());
                                    $column++;
                                    $inHour = ($timesheetItem->getDuration()) / 3600;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $inHour);
                                    $row++;
                                }
                                if (intval($arrayValues["project_name"]) == $timesheetItem->getProjectId() && (intval($arrayValues["activity_name"]) == -1)) {
                                    $projectNameWithCustomerName = $projectService->getProjectNameWithCustomerName($timesheetItem->getProjectId());
                                    $customerEmailDoctrine = $projectService->getCustomerMailByProjectId($projectId);
                                    $customerEmail = $customerEmailDoctrine[0]['customerMail'];
                                    $project = explode(" - ", $projectNameWithCustomerName);
                                    $activityId = $timesheetItem->getActivityId();

                                    $activityName = $timesheetService->getActivityByActivityId($activityId)->getName();
                                    $column = 'B';

                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getLastName());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getFirstName());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getEmpWorkEmail());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[0]);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $customerEmail);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[1]);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $activityName);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $timesheetItem->getDate());
                                    $column++;
                                    $inHour = ($timesheetItem->getDuration()) / 3600;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $inHour);
                                    $row++;
                                }
                                if (intval($arrayValues["project_name"]) == $timesheetItem->getProjectId() && (intval($arrayValues["activity_name"]) == $timesheetItem->getActivityId())) {
                                    $projectNameWithCustomerName = $projectService->getProjectNameWithCustomerName($timesheetItem->getProjectId());
                                    $project = explode(" - ", $projectNameWithCustomerName);
                                    $customerEmailDoctrine = $projectService->getCustomerMailByProjectId($projectId);
                                    $customerEmail = $customerEmailDoctrine[0]['customerMail'];
                                    $activityId = $timesheetItem->getActivityId();
                                    $activityName = $timesheetService->getActivityByActivityId($activityId)->getName();
                                    $column = 'B';

                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getLastName());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getFirstName());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getEmpWorkEmail());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[0]);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $customerEmail);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[1]);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $activityName);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $timesheetItem->getDate());
                                    $column++;
                                    $inHour = ($timesheetItem->getDuration()) / 3600;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $inHour);
                                    $row++;
                                }
                            }
                        }
                    }
                }
            }
            
            // End Code
            
            // Rename worksheet
            $objPHPExcel1->getActiveSheet()->setTitle('Test');

            // Set active sheet index to the first sheet, so Excel opens this as the first sheet
            $objPHPExcel1->setActiveSheetIndex(0);

            // Redirect output to a client’s web browser (Excel5)
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="' . $this->reportName . '.xls"');
            header('Cache-Control: max-age=0');

            // Permit to download the excel file
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel1, 'Excel5');
            $objWriter->save('php://output');

        }

        //For Project Timesheets Reports
        if ($reportId == 1){
            // Create new PHPExcel object
            $objPHPExcel1 = new PHPExcel();

            // Set document properties
            $objPHPExcel1->getProperties()->setCreator("Upskills - Reports")
                ->setLastModifiedBy("Upskills - Reports")
                ->setTitle("Upskills - Reports on " . $dataSet[0]['employeeName'])
                ->setSubject("Upskills - Reports on " . $dataSet[0]['employeeName'])
                ->setDescription("Reports on someone for test")
                ->setKeywords("upskills excel test")
                ->setCategory("Youhou");

            //Set the style header
            $style_header = array(
                'fill' => array(
                    'type' => PHPExcel_Style_Fill::FILL_SOLID,
                    'color' => array('rgb' => '111170'),
                ),
                'font' => array(
                    'bold' => true,
                    'color' => array('rgb' => '#FFFFFF'),
                )
            );

            if ($arrayValues["project_date_range"]["from"]) {
                $fromDate = $arrayValues["project_date_range"]["from"];
            }else{
                $fromDate = strtotime("1970-01-01");
            }
            if ($arrayValues["project_date_range"]["to"]) {
                $toDate = $arrayValues["project_date_range"]["to"];
            }else{
                $toDate = strtotime(date('Y-m-d'));
            }
            $projectId = $arrayValues["project_name"];
            $onlyIncludeApprovedTimesheets = $arrayValues["only_include_approved_timesheets"];

            $column = 'B';
            $row = 2;
            //Name of the columns
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Employee Last Name");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Employee First Name");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Employee Email");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Customer");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Customer Email");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Project");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Activity");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Date");
            $column++;
            $objPHPExcel1->setActiveSheetIndex(0)
                ->setCellValue($column . $row, "Duration (Hours)");

            $row = 3;
            $employeeService = new EmployeeService();
            $employees = $employeeService->getEmployeeList();
            $timesheetService = new TimesheetService();
            $projectService = new ProjectService();

            //Set the tab
            foreach ($employees as $employee) {
                $timesheets = array();
                if ($onlyIncludeApprovedTimesheets == "on"){
                    $timesheetsTemp = $timesheetService->getTimesheetListByEmployeeIdAndState(array($employee->getEmpNumber()),array("APPROVED"));
                    foreach($timesheetsTemp as $timesheet){
                        $timesheets[] = $timesheetService->getTimesheetById($timesheet["timesheetId"]);
                    }
                }else {
                    $timesheets = $timesheetService->getTimesheetByEmployeeId(intval($employee->getEmpNumber()));
                }
                foreach ($timesheets as $timesheet) {
                    $timesheetItems = $timesheetService->getTimesheetItem($timesheet->getTimesheetId(), $employee->getEmpNumber());
                    if ($timesheetItems) {
                        foreach ($timesheetItems as $timesheetItem) {
                            if ($projectId == $timesheetItem->getProjectId() || $projectId == -1) {
                                if (($fromDate <= strtotime($timesheetItem->getDate())) && (strtotime($timesheetItem->getDate()) <= $toDate)) {
                                    $projectNameWithCustomerName = $projectService->getProjectNameWithCustomerName($timesheetItem->getProjectId());
                                    $project = explode(" - ", $projectNameWithCustomerName);
                                    $customerEmailDoctrine = $projectService->getCustomerMailByProjectId($timesheetItem->getProjectId());
                                    $customerEmail = $customerEmailDoctrine[0]['customerMail'];
                                    $activityId = $timesheetItem->getActivityId();
                                    $activityName = $timesheetService->getActivityByActivityId($activityId)->getName();
                                    $column = 'B';

                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getLastName());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getFirstName());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $employee->getEmpWorkEmail());
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[0]);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $customerEmail);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $project[1]);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $activityName);
                                    $column++;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $timesheetItem->getDate());
                                    $column++;
                                    $inHour = ($timesheetItem->getDuration()) / 3600;
                                    $objPHPExcel1->setActiveSheetIndex(0)
                                        ->setCellValue($column . $row, $inHour);
                                    $row++;
                                }
                            }
                        }
                    }
                }
            }
            // Rename worksheet
            $objPHPExcel1->getActiveSheet()->setTitle('Test');

            // Set active sheet index to the first sheet, so Excel opens this as the first sheet
            $objPHPExcel1->setActiveSheetIndex(0);

            // Redirect output to a client’s web browser (Excel5)
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="' . $this->reportName . '.xls"');
            header('Cache-Control: max-age=0');

            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel1, 'Excel5');
            //ob_start();
            $objWriter->save('php://output');
            //ob_end_clean();
            }

    }

    abstract public function setParametersForListComponent();

    abstract public function setConfigurationFactory();

    abstract public function setListHeaderPartial();

    abstract public function setValues();
    
    abstract public function setInitialActionDetails($request);

    public function getConfFactory() {

        return $this->confFactory;
    }

    public function setConfFactory(ListConfigurationFactory $configurationFactory) {

        $this->confFactory = $configurationFactory;
    }

    public function setReportCriteriaInfoInRequest($formValues) {
        
    }

    public function setCriteriaForm() {
        
    }

    public function setForm($form) {
        $this->form = $form;
    }
       
    public function initilizeDataRetriever(ohrmListConfigurationFactory $configurationFactory, BaseService $dataRetrievalService, $dataRetrievalMethod, array $dataRetrievalParams) {
        $dataRetriever = new ExportDataRetriever();
        $dataRetriever->setConfigurationFactory($configurationFactory);
        $dataRetriever->setDataRetrievalService($dataRetrievalService);
        $dataRetriever->setDataRetrievalMethod($dataRetrievalMethod);
        $dataRetriever->setDataRetrievalParams($dataRetrievalParams);

        $this->getUser()->setAttribute('persistant.exportDataRetriever', $dataRetriever);
        $this->getUser()->setAttribute('persistant.exportFileName', $this->getReportName());
        $this->getUser()->setAttribute('persistant.exportDocumentTitle', $this->getReportTitle());
        $this->getUser()->setAttribute('persistant.exportDocumentDescription', 'Generated at ' . date('Y-m-d H:i'));
    }
    
    public function escapeData($data) {
        if (is_array($data)) {
            $escapedArray = array();
            foreach ($data as $key => $rawData) {
                $escapedArray[$key] = self::escapeData($rawData);
            }
            return $escapedArray;
        } else {
            return htmlspecialchars($data);
        } 
    }

}