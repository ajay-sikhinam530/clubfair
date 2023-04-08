<?php 
session_start();

include 'dbcon.php';

$Id = $_POST['Id'];

$query= "Select * from registereduserdetails where Id='$Id'";

$result = mysqli_query($connection,$query);

$row = $result->fetch_assoc();


$_SESSION['USER'] = $row;

echo("Session Id changed");
?>