<?php

require_once "datahandler.php";

class logic
{

    public function __construct()
    {
        $this->DataHandler = new DataHandler("localhost", "mysql", "continenten", "root", "");
    }

    public function __destruct()
    {
    }

    public function test(){

        $html = "clean mvc";


        $result = $html;
        return $result;
    }


}

?>

<?php /* $sql = "SELECT Continent FROM continent";

$result = $this->DataHandler->readData($sql);
while ($result = $result->fetch(PDO::FETCH_ASSOC)) {


foreach ($result as $key => $value) {

if ($key == "Continent") {

$result = $value;


} else {
echo "Geen continenten";
}

}

print $result;

}

//$result = $continent;*/
?>