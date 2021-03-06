<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of removeAction
 *
 * @author indiran
 */
class deletePerformanceObjectiveAction extends basePerformanceAction {
    //put your code here

    /**
     * @param sfForm $form
     * @return
     */
    public function setForm(sfForm $form) {
        if (is_null($this->form)) {
            $this->form = $form;
        }
    }

    public function execute($request) {

        $form = new DefaultListForm();
        $form->bind($request->getParameter($form->getName()));

        if ($form->isValid()) {
            $toBeDeletedObjectiveIds = $request->getParameter('chkSelectRow');

            if (!empty($toBeDeletedObjectiveIds)) {
                foreach ($toBeDeletedObjectiveIds as $toBeDeletedObjectiveId) {
                    $this->getPerformanceObjectiveService()->DeletePerformanceObjective($toBeDeletedObjectiveId);
                }
                $this->getUser()->setFlash('success', __(TopLevelMessages::DELETE_SUCCESS));
            }
        }
        $this->redirect('performance/addPerformanceObjective');
    }

}

?>
