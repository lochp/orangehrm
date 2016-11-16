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
?>
<?php echo javascript_include_tag(plugin_web_path('orangehrmTimePlugin', 'js/editTimesheet')); ?>

<table id="projectRow">

    <tr class="<?php echo ($num & 1) ? 'even' : 'odd' ?>">
        <td id="">
            <?php echo $form['initialRows'][$num]['toDelete'] ?>
            <?php
            // Marc Modif 7/12/2016
            $employeeId = $form->getOption('employeeId');
            $holidayService = $form->getHolidayService();
            $employeeService = $form->getEmployeeService();
            $operationalCountryService = $form->getOperationalCountryService();
            $employee = $employeeService->getEmployee($employeeId);
            $cou_code =$employee->getCountry();
            $operationalCountryAux = $operationalCountryService->getOperationalCountryForCountryCode($cou_code);
            $operationalCountry = $operationalCountryAux[0];
            //End Modif
            ?>
        </td>
        <td>
            <?php echo $form['initialRows'][$num]['projectName']->renderError() ?>
            <?php echo $form['initialRows'][$num]['projectName']->render(array("class" => "project", "size" => 25)); ?>
            <?php echo $form['initialRows'][$num]['projectId'] ?>
        </td>
        <td>
            <?php echo $form['initialRows'][$num]['projectActivityName']->renderError() ?>
            <?php echo $form['initialRows'][$num]['projectActivityName']->render(array("class" => "projectActivity")); ?>
            <?php echo $form['initialRows'][$num]['projectActivityId'] ?>
        </td>
        <?php $dateDepart = $form->getOption('date');
        $duree = 1;
        $dateDepartTimestamp = strtotime($dateDepart);
        ?>
        <?php for ($j = 0; $j < $noOfDays; $j++) { ?>
            <?php $dateFin = date('Y-m-d', strtotime('+'.$j.' day', $dateDepartTimestamp ));
            //Marc Modif 7/12/2016
            if ((substr(date('D', strtotime($dateFin)),0,1) == "S") || $holidayService->isHoliday($dateFin,$operationalCountry)):
                ?>
                <td class="center comments">
                    <?php echo $form['initialRows'][$num][$j]->renderError() ?>
                    <?php echo $form['initialRows'][$num][$j]->render(array("class" => "timeBox weekend", "onclick" => " " . 'javascript:onClickTimeBox(this)')) ?>
                    <?php echo image_tag(theme_path('images/comment.png'), 'id=commentBtn_' . $j . '_' . $num . " class=commentIcon ") ?>
                    <?php echo $form['initialRows'][$num]['TimesheetItemId' . $j] ?>
                </td>
            <? else : ?>
                <td class="center comments">
                    <?php echo $form['initialRows'][$num][$j]->renderError() ?>
                    <?php echo $form['initialRows'][$num][$j]->render(array("class" => "timeBox week", "onclick" => " " . 'javascript:onClickTimeBox(this)')) ?>
                    <?php echo image_tag(theme_path('images/comment.png'), 'id=commentBtn_' . $j . '_' . $num . " class=commentIcon ") ?>
                    <?php echo $form['initialRows'][$num]['TimesheetItemId' . $j] ?>
                </td>
            <?php endif; ?>
            <?php //End Modif ?>
        <?php } ?>
    </tr>
</table>
