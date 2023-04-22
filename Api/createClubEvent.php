<?php 

include 'dbcon.php';

$name = $_POST['Name'];
$venue = $_POST['Venue'];
$date = $_POST['Date'];
$time = $_POST['Time'];
$clubId = $_POST['ClubId'];
$description = $_POST['Description'];
$organizerId = $_POST['OrganizerId'];
$organizerName = $_POST['OrganizerName'];
$organizerPic = $_POST['OrganizerPic'];

$response=new stdClass();
$response->status="";
$response->message="";

$query = "Insert into events(Name,Date,Time,Venue,ClubId,Description,OrganizerId,OrganizerName,OrganizerPic) values('$name','$date','$time','$venue','$clubId','$description','$organizerId','$organizerName','$organizerPic')";

if ($connection->query($query) === TRUE) {
    $last_id = $connection->insert_id;
    $response->status="true";
    $response->message="Event Created Successfully!!";
    $response=json_encode($response);
    echo($response);
    $_POST['EventId'] = $last_id;
    $_POST['UserId'] = $organizerId;
    $_POST['UserName'] = $organizerName;
    $_POST['UserPic'] = $organizerPic;
    $_POST['NoResponse'] = 'true';
    include('enrollEvent.php');
  } else {
    $response->status="false";
    $response->message="Could not insert into database";
    $response=json_encode($response);
    echo($response);
  }














?>