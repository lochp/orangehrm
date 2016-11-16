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
 * updateComment
 */
class updateCommentAction extends basePerformanceAction {

    public function execute($request) {

        $objectiveLogId = trim($request->getParameter("objectiveLogId"));
        $comment = trim($request->getParameter("objectiveLogComment"));
        $userId = $this->getUser()->getAttribute('auth.userId');

        //echo $objectiveLogId . '   ===' . $comment;
        //get objective log by id
        //set comment
        //save objective log

        $performanceObjectiveLog = $this->getPerformanceObjectiveService()->getPerformanceObjectiveLog($objectiveLogId);
        $logOwner = $performanceObjectiveLog->getUserId();
        //echo 'cur=' . $userId . ' owner=' . $logOwner . '#';
        if ($userId == $logOwner) {
            $performanceObjectiveLog->setComment($comment);
            $flag = $this->getPerformanceObjectiveService()->savePerformanceObjectiveLog($performanceObjectiveLog);
            $flag =1;
        }else{
            $flag = 0;
        }
        return $this->renderText($flag);
    }

    protected function isEssMode() {
        $userMode = 'ESS';

        if ($_SESSION['isSupervisor']) {
            $userMode = 'Supervisor';
        }

        if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 'Yes') {
            $userMode = 'Admin';
        }

        return ($userMode == 'ESS');
    }

}