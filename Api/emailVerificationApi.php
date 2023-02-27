<?php
include("dbcon.php");

$token=$_GET['Token'];
//echo $token;
$q="update registereduserdetails set isActive=1 where Token='$token'";
mysqli_query($connection,$q); 
echo "Account Activated Successfully!!"





?>