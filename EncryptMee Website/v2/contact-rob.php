<?php>
$to= ‘eonnigeljohn@gmail.com’;
$subject=‘EncryptMee Message’;
$name = $_POST [‘name’];
$email= $_POST [‘email’];
$message = $_POST [‘message’];
$body=<<<EMAIL
Hi! My name is $name.
$message
From $name
P.S My email is $email

EMAIL;
$header= “From: $email”;

if($_POST){
if($name==‘’ || $email == ‘’ || $message ==‘’){
$feedback = ‘fill out all the fields’;
}else{
mail ($to, $subject, $body, $header); 
$feedback=‘Thanks for the email’;
}

}
 //I did if statement here otherwise you’ll receive blank emails every time someone visits your page
?>
