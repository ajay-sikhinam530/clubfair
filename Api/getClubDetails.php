<?php 
include 'dbcon.php';
$clubId = $_POST['ClubId'];

$clubQuery = "Select * from clubdetails where Id='$clubId'";

$result = mysqli_query($connection,$clubQuery);
$row = $result->fetch_assoc();

$response=new stdClass();
$response->club = $row;

$ownerId = $row['OwnerId'];

$ownerQuery = "Select * from registereduserdetails where Id='$ownerId'";

$result = mysqli_query($connection,$ownerQuery);
$row = $result->fetch_assoc();

$response->owner = $row;
$response = json_encode($response);
echo($response);


?>