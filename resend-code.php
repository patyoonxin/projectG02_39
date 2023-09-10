<?php
session_start();
include('dbcon.php');


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

function resend_email_verify($name, $email, $verify_token)
{
	$mail = new PHPMailer(true);
	$mail ->isSMTP();
	$mail ->SMTPAuth = true;
	
	$mail->Host = "smtp.gmail.com";
	$mail->Username = "admin@gmail.com";
	$mail->Password = "admin";
	
	$mail->SMTPSecure = "tls";
	$mail->Port = 587;
	
	$mail->setForm("digitalwebnex@gmail.com", $name);
	$mail->AddAddress($email);
	
	$mail->isHTML(true);
	$mail->Subject = "Resend - Email Verification from Daily Fresh";
	
	$email_template = "
				<h2> You have registered with Daily Fresh Ordering System</h2>
				<h3> Verify your email address to Login with the below given link</h3>
				<br></br>
				<a href = 'http://localhost/OnlinePizzaDelivery/register-login-with-verification/verify-email.php?token=$verify_token
				";
				
				$mail->Body = $email_template;
				$mail->send();
				
}

if(isset($_POST['resend_email_verify_btn']))
{
	
	if(!empty(trim($_POST['email'])))
	{
		$email = mysqili_real_escape_string($con, $_POST['email']);
		
		$checkemail_query = "SELECT * FROM users WHERE email ='$email' LIMIT 1";
		$checkemail_query_run = mysqli_query($con, $checkemail_query);
		
		if(mysqli_num_rows($checkemail_query_run)> 0)
		{
			$row = mysqli_fetch_array($checkemail_query_run);
			if($row['userType'] =="0")
			{
				$name = $row['name'];
				$email = $row['email'];
				$verify_token = $row['verify_token'];
				
				resend_email_verify($name, $email, $verify_token);
				
				$_SESSION['status'] = "Verification Email link has been sent to your email address!";
				header("location: resend-email-verification.php");
				exit(0);
			}
			else
			{
				$_SESSION['status'] = "Email already verified. Please Login";
				header("location: login.php");
				exit(0);
			}
			
			
		}
		
		else
		{
				
		$_SESSION['status'] = "Email is not registered. Please register now!";
		header("location: resend-email-verification.php");
		exit(0);
		}
		
	}
	else
	{
		
		$_SESSION['status'] = "please enter the email field";
		header("location: resend-email-verification.php");
		exit(0);
	}

	
	
	
}


?>