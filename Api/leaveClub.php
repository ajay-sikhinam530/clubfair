<?php 

include 'dbcon.php';

$clubId = $_POST['ClubId'];
$userId = $_POST['UserId'];

$response=new stdClass();
$response->status="false";
$response->message="operation failed";

$query = "Delete From memberclubs where ClubId='$clubId' and UserId='$userId'";

if($connection->query($query)){
    $response->status="true";
    $response->message="You left the club.";
}

$response = json_encode($response);
echo($response);

?>