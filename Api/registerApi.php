<?php
include("dbcon.php");

 $firstname= $_POST['firstname'];
 $lastname= $_POST['lastname'];
 $phonenumber= $_POST['phonenumber'];
 $email= $_POST['email'];
 $pass= $_POST['password'];

   $response=new stdClass();
   $response->status="";
   $response->message="";

 $pass = password_hash($pass,PASSWORD_DEFAULT);//password encryption

 $token=uniqid("",true);

$q= "insert into registereduserdetails(FirstName,LastName,MobileNumber,Email,Password,Token, ProfilePic) values('$firstname','$lastname','$phonenumber','$email','$pass','$token',./Api/ProfilePictures/empty.jpg)";
  
 
mysqli_query($connection,$q);


//sending email with token for activation
$message = "Click on this link to activate: URL- http://localhost/clubs/Api/emailVerificationApi.php/?Token=$token";
mail($email,"Account Activation",$message);

  $response->status="true";
  $response->message="Registration Successful";

  $response=json_encode($response);
  echo $response;

?>