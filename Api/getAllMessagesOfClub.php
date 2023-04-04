<?php 

include 'dbcon.php';

$clubId = $_POST['ClubId'];

$response=new stdClass;
$response->status="";
$response->message="";

$query = "Select * from messages where ClubId='$clubId' order by Id";

$result = mysqli_query($connection,$query);

$rows = $result->fetch_all(MYSQLI_ASSOC);

// //decrypting_message
$ciphering_value="AES-128-CTR";
$decryption_key="clubsOfOngole";
$options =0;
$encryption_iv_value='1111111111111121';
for($j=0; $j<count($rows);$j++){
    $rows[$j]['Message'] = openssl_decrypt($rows[$j]['Message'],$ciphering_value,$decryption_key,$options,$encryption_iv_value);
}



$response->status="true";
$response->message="All messages fetched for ClubId - ".$clubId;
$response->messages = $rows;

$response = json_encode($response);
echo($response);


?>