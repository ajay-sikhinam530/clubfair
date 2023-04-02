<?php 

session_start();
unset($_SESSION['USER']);
session_destroy();
session_abort();
echo("session destroyed");
?>