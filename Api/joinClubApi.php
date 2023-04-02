<?php

include("dbcon.php");

$clubId=$_POST['ClubId'];
$userId=$_POST['UserId'];


$response=new stdClass();
$response->status="";
$response->message="";

$clubSearchQuery = "Select Id from clubdetails where Id='$clubId'";
$result = mysqli_query($connection,$clubSearchQuery);
//print_r($result);

if($result->num_rows>0){
    //echo("Club exists");
    
    //To check if user is already a member of the club
    $query="Select UserId from memberclubs where(UserId='$userId' AND ClubId='$clubId')";
    $result = mysqli_query($connection,$query);
    if($result->num_rows>0){
        $response->status="false";
        $response->message="You are already member of the club";
    }
    else{
        $query="insert into memberclubs(ClubId,UserId) values('$clubId','$userId')";
        mysqli_query($connection,$query);
        $response->status="true";
        $response->message="You joined the club";
    }

}
else{
    //echo("Club Doesn't exist");
    $response->status="false";
    $response->message="Invalid club Id";
}

$response=json_encode($response);
if(!isset($_POST['NoResponse'])){
    echo($response);
}

?>