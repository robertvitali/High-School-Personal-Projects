<?php>
$to= ‘support@encryptmee.com’; //change this to your email
$subject=‘EncryptMee Message’;
$name = $_POST [‘name’];
$email= $_POST [‘email’];
$message = $_POST [‘message’];   
$message=<<<EMAIL   
Hi! My name is $name.
$message
From $name
P.S My email is $email

EMAIL;//you can customize message above. Just be sure you include $name, $message and $email somewhere
$header= ‘$email’

if($_POST){
mail ($to, $subject, $ message, $header); 
$feedback=‘’Thanks for the email’;

}
 //I did if statement here otherwise you’ll receive blank emails every time someone visits your page
?>