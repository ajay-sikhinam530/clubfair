<?php
include 'dbcon.php';
$username=$_POST['username'];
$password=$_POST['password'];

$response=new stdClass();
$response->status="";
$response->message="";


$userNameCheck="SELECT * from registereduserdetails where Email='$username'";
$result=mysqli_query( $connection,$userNameCheck);

if($result->num_rows==1)
{
    $row=$result->fetch_assoc();
    if($row['isActive']==1)
    {
        $passwordCheck=password_verify($password,$row['Password']);
        if($passwordCheck==1)
        {
            $response->status="true";
            $response->message="login successful";
            session_start();
            $_SESSION['USER'] = $row;
            
        }
        else
        {
            $response->status="false";
            $response->message="wrong password";

        }
    }
    else{
        $response->status="false";
        $response->message="user not activated";

    }
}

elseif($result->num_rows==0)
{
    $response->status="false";
    $response->message="user does not exist";
}
$response=json_encode($response);
echo "$response";


?>