<?php 

include 'dbcon.php';

$userId = $_POST["UserId"];
$status = $_POST["Status"];

$response=new stdClass();

$query = "Update registereduserdetails set Status='$status' where Id='$userId'";

mysqli_query($connection,$query);

$response->status="true";
$response->message="User Status changed";

$response = json_encode($response);
echo($response);

?>