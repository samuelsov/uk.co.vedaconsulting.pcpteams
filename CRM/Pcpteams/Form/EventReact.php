<?php

/**
 * Form controller class
 *
 * @see http://wiki.civicrm.org/confluence/display/CRMDOC43/QuickForm+Reference
 */
class CRM_Pcpteams_Form_EventReact extends CRM_Pcpteams_Form_Workflow {

  function preProcess() {
    parent::preProcess();
    $workflowEvent   = $this->get("workflowEvent");
    if (isset($workflowEvent)) {
      $this->_reactToFile = $this->getEventReactFile($workflowEvent);
    } else {
      $option = CRM_Utils_Request::retrieve('option', 'String', CRM_Core_DAO::$_nullObject);
      $this->set("workflowEvent", $option);
      $this->_reactToFile = $this->getEventReactFile($option);
    }
    $className = 'CRM_Pcpteams_Form_' . $this->_reactToFile;
    $className::preProcess($this);
    $this->assign('reactClass', $this->_reactToFile);
  }

  function setDefaultValues() {
    if($this->_reactToFile == 'EventJoin'){
      $className = 'CRM_Pcpteams_Form_' . $this->_reactToFile;
      $className::setDefaultValues($this);
    }
  }
  
  function buildQuickForm() {
    $className = 'CRM_Pcpteams_Form_' . $this->_reactToFile;
    $className::buildQuickForm($this);
  }  
  

  function postProcess() {
    $className = 'CRM_Pcpteams_Form_' . $this->_reactToFile;
    $className::postProcess($this);
  }

  /**
   * Get the fields/elements defined in this form.
   *
   * @return array (string)
   */
  function getRenderableElementNames() {
    $elementNames = array();
    foreach ($this->_elements as $element) {
      /** @var HTML_QuickForm_Element $element */
      $label = $element->getLabel();
      if (!empty($label)) {
        $elementNames[] = $element->getName();
      }
    }
    return $elementNames;
  }
  
  function getEventReactFile($workflowEvent){
   switch ($workflowEvent) {
      case '0':
        return 'EventCreate';
        break;
      
      default:
        return 'EventJoin';
        break;
    } 
  }  
}
