<?php

/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures 
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2010 OrangeHRM Inc., http://www.orangehrm.com
 *
 * Please refer the file license/LICENSE.TXT for the license which includes terms and conditions on using this software.
 *
 * */

/**
 * Description of ReviewEvaluationForm
 *
 * @author nadeera
 */
class ReviewEvaluationForm extends BasePefromanceSearchForm {

    public $reviewEvaluation;

    /**
     *
     * @return integer 
     */
    public function getReviewId() {

    if ($this->getValue('id')) {
        return $this->getValue('id');
    }

    if ($this->getOption('id') > 0) {
        return $this->getOption('id');
    }
}

    /**
     *
     * @return type 
     */
    public function getReview() {

        $parameters ['id'] = $this->getReviewId();
        $review = $this->getPerformanceReviewService()->searchReview($parameters, 'piority');
        return $review;
    }

    public function getReviewerId() {
        return $this->getUser()->getEmployeeNumber();
    }

    /**
     *
     * @return type 
     */
    public function getReviewRatings() {

        /* TODO: Control Circle */
        $parameters ['id'] = $this->getReviewId();
        $parameters ['reviewerId'] = $this->getReviewerId();
        $review = $this->getPerformanceReviewService()->searchReview($parameters);

        $ratings = array();

        foreach ($review->getReviewers()->getFirst()->getRating() as $rating) {
            $ratings [$rating->getKpi()->getKpiIndicators() . "_" . $rating->getKpi()->getId() . "_" . $rating->getId()] = $rating;
        }
        ksort($ratings);
        return $ratings;
    }

    public function getSortedRatings($ratings) {

        $ratingsArray = array();

        foreach ($ratings as $rating) {
            $ratingsArray [$rating->getKpi()->getKpiIndicators() . "_" . $rating->getKpi()->getId() . "_" . $rating->getId()] = $rating;
        }

        ksort($ratingsArray);
        return $ratingsArray;
    }

    public function getReviewers() {
        $parameters ['id'] = $this->getReviewId();
        $review = $this->getPerformanceReviewService()->searchReview($parameters);
        return $review->getReviewers();
    }

    public function getReviewer() {
        $parameters ['id'] = $this->getReviewId();
        $parameters ['reviewerId'] = $this->getReviewerId();

        $reviewers = $this->getPerformanceReviewService()->searchReview($parameters)->getReviewers();
        if (sizeof($reviewers) > 0) {
            return $this->getPerformanceReviewService()->searchReview($parameters)->getReviewers()->getFirst();
        } else {
            return new Reviewer();
        }
    }

    /**
     *
     * @param type $reviewEvaluation 
     */
    public function setReviewEvaluation($reviewEvaluation) {
        $this->reviewEvaluation = $reviewEvaluation;
    }

    public function configure() {

        $this->setWidgets($this->getFormWidgets());
        $this->setValidators($this->getFormValidators());

        $this->getWidgetSchema()->setNameFormat('reviewEvaluation[%s]');
        $this->getWidgetSchema()->setLabels($this->getFormLabels());
    }

    /**
     *
     * @return array
     */
    public function getStylesheets() {
        $styleSheets = parent::getStylesheets();
        $styleSheets[plugin_web_path('orangehrmPerformancePlugin', 'css/reviewEvaluationSuccess.css')] = 'all';
        $styleSheets[plugin_web_path('orangehrmPerformancePlugin', 'css/reviewEvaluateByAdminSuccess.css')] = 'all';
        return $styleSheets;
    }

    public function getJavaScripts() {
        $javaScripts = parent::getJavaScripts();
        return $javaScripts;
    }

    /**
     *
     * @return array
     */
    protected function getFormWidgets() {
        $widgets = array(
            'id' => new sfWidgetFormInputHidden(),
            'action' => new sfWidgetFormInputHidden()
        );
        return $widgets;
    }

    /**
     *
     * @return array
     */
    protected function getFormValidators() {
        $inputDatePattern = sfContext::getInstance()->getUser()->getDateFormat();

        $validators = array(
            'id' => new sfValidatorString(array('required' => false)),
            'action' => new sfValidatorString(array('required' => false))
        );
        return $validators;
    }

    /**
     *
     * @return array
     */
    protected function getFormLabels() {
        $requiredMarker = ' <span class="required">*</span>';
        $labels = array(
            'name' => __('Group Name') . $requiredMarker,
            'weight' => __('Weightage (1 - 100) ') . $requiredMarker,
        );
        return $labels;
    }

    /**
     *
     * @return boolean 
     */
    public function saveForm($request) {

        if ($this->isEditable()) {
            $postParameters = $request->getPostParameters();
            foreach ($postParameters['rating'] as $ratingId => $rating) {
                if ($this->isValidRatingId($ratingId)) {
                    $rating = $this->getPerformanceReviewService()->getReviewRating($ratingId);
                    $rating->setRating($postParameters['rating'][$ratingId]);
                    $rating->setComment($postParameters['comment'][$ratingId]);
                    $rating->save();
                }
            }
			
            $reviewer = $rating->getReviewer();
            foreach ($postParameters['objective'] as $objectiveId => $rate){
                $performanceObjectiveService = new PerformanceObjectiveService();
                if ($performanceObjectiveService->isValidObjective($objectiveId)) {
                    $objectiveReviewDoctrineObject = $performanceObjectiveService->getPerformanceObjectiveReviewer($objectiveId,$reviewer->getEmployeeNumber());
                    $objectiveReview = $objectiveReviewDoctrineObject[0];
                    $objectiveReview->setFinalRate($rate);
                    $objectiveReview->setFinalComment($postParameters['comment_objective'][$objectiveId]);
                    $performanceObjectiveService->savePerformanceObjectiveReviewer($objectiveReview);
                }
            }

            if ($this->getValue('action') == 'complete') {
                if ($reviewer->getGroup()->getId() == 2) {
                    $comment = $postParameters['general_comment'][$reviewer->getGroup()->getId()];
                    $status = ReviewerReviewStatusFactory::getInstance()->getStatus('completed');
                    $reviewer->setStatus($status->getStatusId());
                    $reviewer->setCompletedDate(date("Y-m-d H:i:s"));
                    $reviewer->setComment($comment);
                    $comment = $postParameters['general_comment_objective'][$reviewer->getGroup()->getId()];
					$reviewer->setObjectives($comment);
                    $reviewer->save();
                } else {
                    $reviewers = $this->getReviewers();
                    foreach ($reviewers as $reviewer) {
                        $comment = $postParameters['general_comment'][$reviewer->getGroup()->getId()];
                        $status = ReviewerReviewStatusFactory::getInstance()->getStatus('completed');
                        $reviewer->setStatus($status->getStatusId());
                        $reviewer->setCompletedDate(date("Y-m-d H:i:s"));
                        $reviewer->setComment($comment);
                        $comment = $postParameters['general_comment_objective'][$reviewer->getGroup()->getId()];
						$reviewer->setObjectives($comment);
                        $reviewer->save();
                    }
                }
            }

            if ($this->getValue('action') == 'save') {
                if ($reviewer->getGroup()->getId() == 2) {
                    $comment = $postParameters['general_comment'][$reviewer->getGroup()->getId()];
                    $status = ReviewerReviewStatusFactory::getInstance()->getStatus('inProgress');
                    $reviewer->setStatus($status->getStatusId());
                    $reviewer->setComment($comment);
                    $comment = $postParameters['general_comment_objective'][$reviewer->getGroup()->getId()];
					$reviewer->setObjectives($comment);
                    $reviewer->save();
                } else {
                    $reviewers = $this->getReviewers();
                    foreach ($reviewers as $reviewer) {
                        $comment = $postParameters['general_comment'][$reviewer->getGroup()->getId()];
                        $status = ReviewerReviewStatusFactory::getInstance()->getStatus('inProgress');
                        $reviewer->setStatus($status->getStatusId());
                        $reviewer->setComment($comment);
                        $comment = $postParameters['general_comment_objective'][$reviewer->getGroup()->getId()];
						$reviewer->setObjectives($comment);
                        $reviewer->save();
                    }
                }
            }

            $review = $this->getPerformanceReviewService()->searchReview($this->getReviewId());
            $status = $this->getReviewStatusFactory()->getStatus($reviewer->getReview()->getStatusId());
            $review = $reviewer->getReview();
            $review->setStatusId($status->getNextStatus());
            $review->save();
            return $review;
        }
    }

    public function isValidRatingId($ratingId) {

        $parameters ['id'] = $ratingId;
        $parameters ['reviewId'] = $this->getReviewId();

        if (sizeof($this->getPerformanceReviewService()->searchReviewRating($parameters)) > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     *
     * @return boolean
     */
    public function isFinalRatingVisible() {
        /* TODO: Control Circle */
        if ($this->getReview()->getEmployeeNumber() == $this->getReviewerId()) {
            $parameters ['id'] = $this->getReviewId();
            $review = $this->getPerformanceReviewService()->searchReview($parameters);

            if (ReviewStatusFactory::getInstance()->getStatus($review->getStatusId())->isFinalRatingVisible()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     *
     * @param integer $id 
     */
    public function loadFormData($id) {
        $this->setDefault('id', $this->getReviewId());
        $this->setDefault('action', 'save');
    }

    public function isEditable() {
        /* TODO: Control Circle */
        $parameters ['id'] = $this->getReviewId();
        $parameters ['reviewerId'] = $this->getReviewerId();

        $review = $this->getPerformanceReviewService()->searchReview($parameters);
        if (ReviewerReviewStatusFactory::getInstance()->getStatus($review->getReviewers()->getFirst()->getStatus())->isEvaluationFormEditable() && $this->getReviewStatusFactory()->getStatus($review->getStatusId())->isEvaluationsEditable()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     *
     * @return string 
     */
    public function getGoBackUrl() {
        if ($this->getReview()->getEmployeeNumber() == $this->getReviewerId()) {
            return "performance/myPerformanceReview";
        } else {
            return "performance/searchEvaluatePerformancReview";
        }
    }

}
