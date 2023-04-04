<?php 
$message = "6nXpkuWMfrf2rw==";
$ciphering_value="AES-128-CTR";
$decryption_key="clubsOfOngole";
$options =0;
$encryption_iv_value='1111111111111121';
$message = openssl_decrypt($message,$ciphering_value,$decryption_key,$options,$encryption_iv_value);
echo($message);
?>