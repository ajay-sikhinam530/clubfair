<?php
    
    $user = 'root';
    $passwod = '';
    $database = 'clubs';
    
    $connection = new mysqli('localhost',$user,$passwod,$database);
    if($connection->connect_error){
        die('connection failed :'.$connection->connect_error);
    }
    else{
        //echo 'Connection successful';
    }
    
    
    
    ?>

