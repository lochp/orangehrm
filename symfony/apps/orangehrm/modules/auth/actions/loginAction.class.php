<?php

class loginAction extends sfAction {

    /**
     * Login action. Forwards to OrangeHRM login page if not already logged in.
     * @param sfRequest $request A request object
     */
    public function execute($request) {
        
        $loginForm = new LoginForm();
        $this->message = $this->getUser()->getFlash('message');
        $this->form = $loginForm;
        
      

        /**Marc Modif 7/22/2016
        *Send email after the $beginSendDate of each month for missing or draft timesheets
        *And send an email before the $endSendDateApproved for approved or missing or draft timesheets
        *For the employee and his direct manager
        */


        $day = date('d');

        //Get the necessary services
        $emailService = new EmailService();
        $emailNotificationService = new EmailNotificationService();
        $employeeService = new EmployeeService();
        $timesheetService = new TimesheetService();
        $systemUserService = new SystemUserService();
        $upskillsConfigurationService = new UpskillsConfigurationService();

        $name = 'Timesheets Automatic Notifications';

        //To see if the email has already been sent today
        $oneTimePerDay = $emailNotificationService->getOneTimePerDay(6);
        $oneTimePerDayTer = $oneTimePerDay->getData();
        $oneTimePerDayBis = $oneTimePerDayTer[0]['oneTimePerDay'];
        $stateList = array("1" => "NOT SUBMITTED");

        //Config data
        $beginDate = mktime(0,0,0,8,1,2016);
        $beginSendDateDoctrineObject = $upskillsConfigurationService->getValue("beginSendDate");
        $beginSendDate = intval($beginSendDateDoctrineObject[0]['value']);
        $endSendDateDoctrineObject = $upskillsConfigurationService->getValue("endSendDateApproved");
        $endSendDateApproved = intval($endSendDateDoctrineObject[0]['value']);
        $refWebSiteDoctrineObject = $upskillsConfigurationService->getValue("refWebSite"); //Reference to Upskills HR web site
        $refWebSite = $refWebSiteDoctrineObject[0]['value'];

        //Mail for Missing Timesheet for
        //If the mail hasn't already been sent today
        if (!($oneTimePerDayBis == date('Y-m-d'))) {
        
            $emailNotificationService->setOneTimePerDay(date('Y-m-d'),$name);

            //Get the EmployeeList
            $employeeList = $employeeService->getEmployeeList();

          
            //For every employees, look if there are missing timesheets
            foreach ($employeeList as $employee) {

                //Get the informations about the employee
                $mailRequired = $employee->getCustom1(); //Custom1 is for see if the employee has to fill the timesheet
                $employeeId = $employee->getEmployeeId();
                $employeeNb = $employee->getEmpNumber();
                $firstName = $employee->getFirstName();
                $lastName = $employee->getLastName();
                $systemUser = $systemUserService->getSystemUser($employeeId);
                $entryDate = strtotime($systemUser['date_entered']);
                $employeeStartDate = $employee->getJoinedDate();
             
            
                $otherInfo = array();
                $otherInfo['firstName'] = $firstName;
                $otherInfo['lastName'] = $lastName;
                $otherInfo['refWebSite'] = $refWebSite;
                $otherInfo['isManager'] = false;
                  
                //If the employee has no email address, no need to search if timesheets are missing or not
                if ($employee->getEmpWorkEmail() ) {
                    if ($mailRequired) {       
                        //XGL - If the entry date of the employee is within this month, he should not have previous timesheets so we ignore   
                        if ($mailRequired == "Yes" && (date('Y-m',strtotime($employeeStartDate)) != date('Y-m'))) {   
                            //var_dump($lastName); 
                            //var_dump(date('Y-m',$entryDate));     
                            //var_dump('-------')  ; 
                            //For now, just mail if the timesheet of this month isn't done
                            //Get the timesheets' startDates and the date of the day
                            $timesheets = $timesheetService->getTimesheetByEmployeeId($employeeNb);
                                   
                            $i = 0;
                            $dates = array();
                            $realDates = array(); //If I use all the months and not just the present month
                            
                            foreach ($timesheets as $timesheet) {
                                $dates[$i] = date('Y-m', strtotime($timesheet->getStartDate()));
                                $i++;
                              
                            }
							              // if current day is greater than the day planned to submit drafts
                            if ($day > $beginSendDate && $beginDate < mktime(0, 0, 0, date("m")  , date("d"), date("Y"))) {
                                $otherInfo['month'] = 'this month';
                                if ($dates) {
                                    if (!(in_array(date('Y-m'), $dates))) {
                                        $realDates[] = date('Y-m');
                                    }
                                } else {
                                    $realDates[] = date('Y-m');
                                }
                                $result = $emailService->sendEmailForMissingTimesheets($employee->getEmpWorkEmail(), $realDates, $otherInfo);
                            } else {
                                if ($day < $endSendDateApproved) {
                                     
                                    //Final timesheet : look if it exists, and then if it's not submitted
                                    $otherInfo['month'] = 'previous month';
                                    $previousMonth = date('Y-m',strtotime("-1 month"));
                                    
									                  if ($dates) {  
                                        if (!(in_array($previousMonth, $dates))) {
                                            $realDates[] = $previousMonth;
                                        } else {  
                                            $startDate = mktime(0, 0, 0, date('m') - 1, 1, date('Y'));
                                            $timesheet = $timesheetService->getTimesheetByStartDateAndEmployeeId(date('Y-m-d',$startDate), $employeeNb);
                                              
                                            if ($timesheet->getState() == "NOT SUBMITTED") {
                                                $realDates[] = $previousMonth;       
                                            }            
                                        }
                                    } else {  //there are no timesheets at all
                                        $realDates[] = $previousMonth;     
                                    }
                                }
                                $result = $emailService->sendEmailForMissingTimesheets($employee->getEmpWorkEmail(), $realDates, $otherInfo);
                            }
                        }
                    }  
                    // Send a message for the Subordinate List   
                    
                    $i = 0;
                    $subordinateListDoctrineObject = $employee->getSubordinates();
                    if ($subordinateListDoctrineObject) {
                        $subordinateList = array();
						            $subList = array();
                        $otherInfo['isManager'] = true;
                        foreach ($subordinateListDoctrineObject as $subordinate) {
                            // XGL -- if must enter timesheet flag is set and he is not a new joiner, he should have a timesheet
                            if (($subordinate->getCustom1() == "Yes") && (date('Y-m',strtotime($subordinate->getJoinedDate())) != date('Y-m')) ){
                                $dates = array();
                                $realDates = array(); //To use all months and not just the present month
                                $timesheets = $timesheetService->getTimesheetByEmployeeId($subordinate->getEmpNumber());
                                foreach ($timesheets as $timesheet) {
                                    $dates[$i] = date('Y-m', strtotime($timesheet->getStartDate()));
                                    $i++;
                                }
                                if ($day <= $endSendDateApproved){
                                    //Final timesheet : look if it exists, and then if it's not submitted
                                    $otherInfo['month'] = 'previous month';
                                    $previousMonth = date('Y-m',mktime(0, 0, 0, date('m') - 1, 1, date('Y')));
                                    if ($dates) {
                                        if (!(in_array($previousMonth, $dates))) {
                                            $realDates[] = $previousMonth;
                                            $subordinateList[] = $subordinate;
                                        } else {
                                            $startDate = date('Y-m-d',mktime(0, 0, 0, date('m') - 1, 1, date('Y')));
                                            $timesheet = $timesheetService->getTimesheetByStartDateAndEmployeeId($startDate, $subordinate->getEmpNumber());
                                            if ($timesheet->getState() == "NOT SUBMITTED") {
                                                $realDates[] = $previousMonth;
                                                $subordinateList[] = $subordinate;
                                            }
											
											                      if ($timesheet->getState() == "SUBMITTED") {
												                        $realDates[] = $previousMonth;
												                        $subList[] = $subordinate;
											                      }
                                        }
                                    } else {
                                        $realDates[] = $previousMonth;
                                        $subordinateList[] = $subordinate;
                                    }
                                }	
								                if ($day > $beginSendDate){
                                    //Final timesheet : look if it exists, and then if it's not submitted
                                    $otherInfo['month'] = 'this month';
                                    if ($dates) {
                                        if (!(in_array(date('Y-m'), $dates))) {
                                            $realDates[] = date('Y-m');
                                            $subordinateList[] = $subordinate;
                                        } else {
											                      $startDate = date('Y-m-d',mktime(0, 0, 0, date('m'), 1, date('Y')));
                                            $timesheet = $timesheetService->getTimesheetByStartDateAndEmployeeId($startDate, $subordinate->getEmpNumber());
                                            if ($timesheet->getState() == "NOT SUBMITTED") {
                                                $realDates[] = date('Y-m');
                                                $subordinateList[] = $subordinate;
                                            }
											
											                     if ($timesheet->getState() == "SUBMITTED") {
												                       $realDates[] = date('Y-m');
												                       $subList[] = $subordinate;
											                     }
                                        }
                                    } else {
                                        $realDates[] = $previousMonth;
                                        $subordinateList[] = $subordinate;
                                    }
                                }		
                            }
                        }   //end foreach subordinate
                        
                        $otherInfo['subordinateList'] = $subordinateList;
						            $otherInfo['subList'] = $subList;
                        if($subordinateList || $subList) {
                            $result = $emailService->sendEmailForMissingTimesheets($employee->getEmpWorkEmail(), $realDates, $otherInfo);
                        }
                    }   
                }
            }
        }
    }
}

