<?php 

include 'dbcon.php';

$clubId = $_POST['ClubId'];

$response=new stdClass;
$response->status="";
$response->message="";

$query = "Select * from messages where ClubId='$clubId' order by Id";

$result = mysqli_query($connection,$query);

$rows = $result->fetch_all(MYSQLI_ASSOC);

// //decrypting_message and adding it to response.
$ciphering_value="AES-128-CTR";
$decryption_key="clubsOfOngole";
$options =0;
$encryption_iv_value='1111111111111121';
for($j=0; $j<count($rows);$j++){
    $rows[$j]['Message'] = openssl_decrypt($rows[$j]['Message'],$ciphering_value,$decryption_key,$options,$encryption_iv_value);
}
$response->messages = $rows;


//To get all active members and adding it to response
$query = "Select registereduserdetails.Id,registereduserdetails.FirstName,registereduserdetails.LastName,registereduserdetails.ProfilePic,registereduserdetails.Status from registereduserdetails JOIN memberclubs ON (memberclubs.UserId=registereduserdetails.Id) AND (memberclubs.ClubId='$clubId')";

$result = mysqli_query($connection,$query);

$rows = $result->fetch_all(MYSQLI_ASSOC);

$response->AllMembers = $rows;


$response->status="true";
$response->message="All data fetched for ClubId - ".$clubId;


$response = json_encode($response);
echo($response);


?>