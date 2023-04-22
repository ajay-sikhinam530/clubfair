<?php 

include 'dbcon.php';

$eventId = $_POST['EventId'];

$response=new stdClass();
$response->status="";
$response->message="";

$query = "Select * from eventmembers where EventId='$eventId' ";

$result = mysqli_query($connection,$query);
if($result->num_rows>0){
    $response->status="true";
    $response->message="All enrolled users fetched successfully.";
    $response->allParticipants = $result->fetch_all(MYSQLI_ASSOC);
}
else{
    $response->status="false";
    $response->message="No participants for event.";
    $response->allParticipants="";
}

$response=json_encode($response);
echo($response);



?>