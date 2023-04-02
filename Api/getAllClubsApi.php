<?php 

include 'dbcon.php';

$userId = $_POST['Id'];

$response=new stdClass();
$response->status="true";
$response->message="All clubs are fetched";

$query1 = "(Select * from clubdetails where Id NOT IN (Select ClubId from memberclubs where UserId='$userId')) UNION (Select FirstName,LastName,ProfilePic, from registereduserdetails where Id='$userId')";

$query2 = "select clubdetails.*, registereduserdetails.FirstName,registereduserdetails.LastName,registereduserdetails.ProfilePic from clubdetails JOIN registereduserdetails ON clubdetails.OwnerID=registereduserdetails.Id where clubdetails.Id NOT IN (Select ClubId from memberclubs where UserId='$userId')";

 $query3 = "select clubdetails.*, registereduserdetails.FirstName,registereduserdetails.LastName,registereduserdetails.ProfilePic,COUNT(memberclubs.ClubId) as TotalMembers from memberclubs JOIN clubdetails ON memberclubs.ClubId=clubdetails.Id JOIN registereduserdetails ON clubdetails.OwnerID=registereduserdetails.Id where clubdetails.Id NOT IN (Select ClubId from memberclubs where UserId='$userId') group by Id";

$result = mysqli_query($connection,$query3);
$rows = $result->fetch_all(MYSQLI_ASSOC);
$response->clubs = $rows;



// $query4 = "Select ClubId,COUNT(ClubId) as total from memberclubs group by ClubId";
// $result = mysqli_query($connection,$query4);
// $rows = $result->fetch_all(MYSQLI_ASSOC);

// for($j=0; $j<count($response->clubs);$j++){
//     for ($i=0; $i < count($rows); $i++) { 
//         if($rows[$i]['ClubId']==$response->clubs[$j]['Id']){
//             $response->clubs[$j]['TotalMembers'] = $rows[$i]['total'];
//         }
//     }
//     if(isset($response->clubs[$j]['TotalMembers'])){
        
//     }
//     else{
//         $response->clubs[$j]['TotalMembers'] = "0";
//     }

    
// }

$response=json_encode($response);
echo($response);

?>