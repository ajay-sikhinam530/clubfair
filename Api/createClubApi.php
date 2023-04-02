<?php

include("dbcon.php");

$name=$_POST['Name'];
$ownerId=$_POST['OwnerId'];
$categories=$_POST['Categories'];
$description=$_POST['Description'];

$response=new stdClass();
$response->status="";
$response->message="";

$query="insert into clubdetails(Name,OwnerId,Categories,Description) values('$name','$ownerId','$categories','$description')";


if ($connection->query($query) === TRUE) {
    $last_id = $connection->insert_id;
    $response->status="true";
    $response->message="Club Created Successfully!!";
    $response->ClubId = $last_id;
    $response=json_encode($response);
    echo($response);
    $_POST['ClubId'] = $last_id;
    $_POST['UserId'] = $ownerId;
    $_POST['NoResponse'] = 'true';
    include('joinClubApi.php');
  } else {
    $response->status="false";
    $response->message="Could not insert into database";
    $response->ClubId = "";
    $response=json_encode($response);
    echo($response);
  }

  



?>