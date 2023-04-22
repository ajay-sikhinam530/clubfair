<?php 

include 'dbcon.php';

$eventId = $_POST['EventId'];
$userId = $_POST['UserId'];
$userName = $_POST['UserName'];
$userPic = $_POST['UserPic'];

$response=new stdClass();
$response->status="";
$response->message="";

$query = "Insert into eventmembers(EventId,UserId,UserName,UserPic) values('$eventId','$userId','$userName','$userPic')";

if ($connection->query($query) === TRUE) {
    $response->status="true";
    $response->message="Club Created Successfully!!";
    $response=json_encode($response);
  } else {
    $response->status="false";
    $response->message="Could not insert into database";
    $response=json_encode($response);
    
  }
  
if(!isset($_POST['NoResponse'])){
    echo($response);
}

  
?>