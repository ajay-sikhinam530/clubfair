<?php
include("dbcon.php");

$email = $_POST['email'];

$query = "select Token from registereduserdetails where Email='$email'";

$result = mysqli_query($connection, $query);
//print_r($result);
$row = $result->fetch_assoc();
//print_r($row);
$token = $row['Token'];
$message = "Click here to reset password URL: http://localhost/clubs/Api/resetPasswordApi.php/?Token=$token";

mail($email, "Reset Password", $message);

$response=new stdClass();
$response->status="true";
$response->message="Email sent successfully";
$response=json_encode($response);
echo "$response";
?>