<?php
include("dbcon.php");

$firstname=$_POST['FirstName'];
$lastname=$_POST['LastName'];
$dob=$_POST['DateOfBirth'];
$phone=$_POST['Phone'];
$interests=$_POST['Interests'];
$email=$_POST['Email'];
$Id = $_POST['Id'];


$response=new stdClass();
$response->status="";
$response->message="";

if(isset($_FILES['ProfilePic'])){
    $ProfilePic = $_FILES['ProfilePic'];
    $tmp_name=$_FILES['ProfilePic']['tmp_name'];
    $image_name=$_FILES['ProfilePic']['name'];
    $image_extension=pathinfo($image_name,PATHINFO_EXTENSION);
    $new_name=$Id.'.'.$image_extension;
    $new_path='.\ProfilePictures\\'.$new_name;


    move_uploaded_file($tmp_name,$new_path);

    $imageOpeningPath = "./Api/ProfilePictures/".$Id.".jpg";
    $query="update registereduserdetails set FirstName='$firstname',LastName='$lastname',MobileNumber='$phone',DateOfBirth='$dob',Interests='$interests',ProfilePic='$imageOpeningPath' where Id='$Id' ";

    mysqli_query($connection,$query);
}
else{
    $query="update registereduserdetails set FirstName='$firstname',LastName='$lastname',MobileNumber='$phone',DateOfBirth='$dob',Interests='$interests' where Id='$Id' ";

    mysqli_query($connection,$query);
}




$response=json_encode($response);
echo($response);

?>