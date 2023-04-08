<?php 
session_start();
$response=new stdClass();
$response->status="";
$response->message="";

if (isset($_SESSION['USER'])) {
    $user = $_SESSION['USER'];
    $response->status="true";
    $response->message="User Fetched";
    $response->userDetails = $user;
}
else{
    $response->status="false";
    $response->message="Session variable not set";
    $response->userDetails = "";
}

$response=json_encode($response);
echo($response);
?>