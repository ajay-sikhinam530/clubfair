<?php
include("dbcon.php");

$message=$_POST['Message'];
$clubId=$_POST['ClubId'];
$userId=$_POST['UserId'];
$userPic=$_POST['UserPic'];
$userName = $_POST['UserName'];
$timeStamp =$_POST['TimeStamp'];

//encrypting message
$ciphering_value="AES-128-CTR";
$iv_length= openssl_cipher_iv_length($ciphering_value);
$options =0;
$encryption_iv_value='1111111111111121';
$encryption_key="clubsOfOngole";

$encrypted_msg=openssl_encrypt($message,$ciphering_value,$encryption_key,$options,$encryption_iv_value);

$response=new stdClass;
$response->status="";
$response->message="";

$query="insert into messages(Message,ClubId,UserId,UserName,UserPic,TimeStamp) values('$encrypted_msg','$clubId','$userId','$userName','$userPic','$timeStamp')";
if($connection->query($query)=== TRUE){
    $response->Id = $connection->insert_id;
    $response->status="true";
    $response->message="Message Sent";
}
else{
    $response->Id = '';
    $response->status="false";
    $response->message="Message not Sent";
}



$response=json_encode($response);
echo($response);






?>