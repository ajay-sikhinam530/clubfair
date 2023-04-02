<?php 

include 'dbcon.php';

$Id = $_POST['Id'];

$query= "Select * from registereduserdetails where Id='$Id'";

$result = mysqli_query($connection,$query);

$row = $result->fetch_assoc();

session_start();
$_SESSION['USER'] = $row;

echo("Session Id changed");
?>