<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'path/to/PHPMailer/src/Exception.php';
require 'path/to/PHPMailer/src/PHPMailer.php';
require 'path/to/PHPMailer/src/SMTP.php';

session_start();
include('dbcon.php');

function sendemail_verify("$id","$username","$firstName","$lastName","$email","$phone","$password","$cpassword","$verify_token")
{
	$mail = new PHPMailer(true);
    $mail->isSMTP();                                            //Send using SMTP
	
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'dailyfresh9718@gmail.com';                     //SMTP username
    $mail->Password   = 'ejwyrtbcacwyjgyg';                               //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
	//autoload the PHPMailer
    $mail->IsHTML(true);
	$mail->From = "dailyfresh9718@gmail.com";
	$mail->FromName = "Daily Fresh";
	$mail->Subject = $subject;
	
	$mail->Subject = $subject;
	$mail->Body = $body;
	$mail->AddAddress($email_to);
	if (!$mail->Send()) {
		echo "Mailer Error: " . $mail->ErrorInfo;
	} else {
		echo "An email has been sent";
	}
	
	&email_template = "
	<h2>You have registered with Daily Fresh Ordering System</h2>
	<h5>Verify your email address to Login with the below given link</h5>
	<br></br>
	<a href = "https://localhost/DailyFreshOrderingSystem/password_reset.php?token=$password_reset"> Click Me </a>
	";
	
	$mail->Body = $email_template;
	$mail->send();
	echo 'Message has been sent';
}


if(isset($_POST['register_btn']))
{

$id= $_POST['id'];
$username = $_POST['username'];
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];
$cpassword = $_POST['cpassword'];
$verify_token = $_POST['verify_token'];

sendemail_verify("$name","$email","$verify_token");
echo "send or not ?";

//email exist or not

$check_email_query = "SELECT email FROM users WHERE email='$email' LIMIT 1 ";
$check_email_query_run = mysqli_query($con, $check_email_query);

if(mysqli_num_rows($check_email_query_run)>0)
{

$_SESSION['status'] = "Email Id already Exist";
header("Location: register.php");
}
else
{

//Insert User / register user data
$_query = "INSERT INTO users (id,username,firstName,lastName,email,phone,userType,password,cpassword,verify_token) VALUES ('$id','$username','$firstName','$lastName','$email,'$phone','$userType','$password','$cpassword','$verify_token')";
$query_run = mysqli_query($con, $query);

if(query_run)

}
sendemail_verify("$id","$username","$firstName","$lastName","$email","$phone","$password","$cpassword,$verify_token");
$_SESSION['status'] = "Registration Succesful! Please verify your Email Address. ";
header("Location: _signupModal.php");
}
}
else
{
$_SESSION['status'] = "Registration Failed";
header("Location: _signupModal.php");
}

?>