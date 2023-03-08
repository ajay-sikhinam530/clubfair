<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Page</title>
</head>

<body>
    <form method="POST">
        <label>Password</label>
        <input type="text" name="password">
        <label>Confirm Password</label>
        <input type="text" name="confirmPassword">
        <input type="submit" value="Submit" name="submit">
    </form>
</body>

</html>
<?php
if(isset($_POST['submit'])){
include("dbcon.php");
$token=$_GET['Token'];
$pass=$_POST['password'];
$confirmPass=$_POST['confirmPassword'];


if($pass==$confirmPass){
    $pass = password_hash($pass,PASSWORD_DEFAULT);
    $query ="update registereduserdetails set Password='$pass' where Token='$token'";
    mysqli_query($connection,$query);

}
$response=new stdClass();
$response->status="true";
$response->message="Password changed successfully";
$response=json_encode($response);
echo "$response";
}

?>