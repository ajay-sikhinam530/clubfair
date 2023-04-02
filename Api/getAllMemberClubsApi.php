<?php

include("dbcon.php");

$userId=$_POST['UserId'];

$response=new stdClass();
$response->status="";
$response->message="";

$query = "Select * from clubdetails where Id IN (Select ClubId from memberclubs where UserId='$userId')";
$result = mysqli_query($connection,$query);
if($result->num_rows>0){
    $response->status="true";
    $response->message="You are a member of ".$result->num_rows." clubs";
    $response->allClubs = $result->fetch_all(MYSQLI_ASSOC);
}
else{
    $response->status="false";
    $response->message="You are not a member of any club yet";
    $response->allClubs="";
}

$response=json_encode($response);
echo($response);
?>