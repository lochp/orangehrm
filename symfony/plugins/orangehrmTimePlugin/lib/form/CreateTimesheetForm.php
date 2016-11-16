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
class CreateTimesheetForm extends sfForm {

    public $formWidgets = array();
    public $formValidators = array();

    public function configure() {

        $this->formWidgets['date'] = new ohrmWidgetDatePicker(array(), array('id' => 'time_date'));

        //Marc Modif 7/13/2016
        //For duplicate timesheet
        $this->formWidgets['previous'] = new sfWidgetFormInputCheckbox(array(), array('id' => 'previous'));
        // End Modif

        $this->setWidgets($this->formWidgets);
        
        $inputDatePattern = sfContext::getInstance()->getUser()->getDateFormat();
        $this->formValidators['date'] = new ohrmDateValidator(array('date_format' => $inputDatePattern, 'required' => false), array('invalid' => "Date format should be $inputDatePattern"));
        //Marc Modif 7/14/2016
        //For duplicate timesheet
        $this->formValidators['previous'] = new sfValidatorPass(array('required' => false));
        //End Modif
        $this->widgetSchema->setNameFormat('time[%s]');

        $this->setValidators($this->formValidators);
    }

}
