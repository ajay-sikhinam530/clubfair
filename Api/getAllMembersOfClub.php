<?php 

include 'dbcon.php';

$clubId = $_POST['ClubId'];

$response=new stdClass;
$response->status="";
$response->message="";

$query = "Select registereduserdetails.Id,registereduserdetails.FirstName,registereduserdetails.LastName,registereduserdetails.ProfilePic,registereduserdetails.Status from registereduserdetails JOIN memberclubs ON (memberclubs.UserId=registereduserdetails.Id) AND (memberclubs.ClubId='$clubId')";

$result = mysqli_query($connection,$query);

$rows = $result->fetch_all(MYSQLI_ASSOC);


$response->Members = $rows;


$response->status="true";
$response->message="All members fetched for - ".$clubId;


$response = json_encode($response);
echo($response);

?>