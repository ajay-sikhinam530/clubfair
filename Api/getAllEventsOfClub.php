<?php 

include 'dbcon.php';

$clubId = $_POST['ClubId'];

$response=new stdClass();
$response->status="";
$response->message="";

$query = "Select * from events where ClubId='$clubId' ";

$result = mysqli_query($connection,$query);
if($result->num_rows>0){
    $response->status="true";
    $response->message="All events fetched successfully.";
    $response->allEvents = $result->fetch_all(MYSQLI_ASSOC);
}
else{
    $response->status="false";
    $response->message="No Events for this club.";
    $response->allEvents=[];
}

$response=json_encode($response);
echo($response);



?>