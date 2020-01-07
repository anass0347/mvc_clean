<?php
require_once 'model/logic.php';


class controller{

    public function __construct()
    {
        $this->logic = new logic();
        //$this->htmlElements = new htmlElements();
    }

    public function __destruct()
    {
        // TODO: Implement __destruct() method.
    }


    public function handleRequest()
    {
        try {
            $op = isset($_REQUEST['op']) ? $_REQUEST['op'] : NULL;
            switch ($op) {
               default:
                    $this->test();
                    break;
                case 'datuum':
                    $this->readDatuum();
                    break;
            }
        } catch (ValidationException $e) {
            $errors = $e->getErrors();
        }

    }

    public function test(){
        $result = $this->logic->test();
        include 'view/test.php';
    }




}

?>