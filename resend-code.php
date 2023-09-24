<?php
session_start();
include('dbcon.php');


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

function resend_email_verify($username, $firstName, $lastName, $email, $phone, $verify_token)
{
	//require 'vendor/autoload.php';
    $mail = new PHPMailer(true);
    $mail->isSMTP();    
	$mail->SMTPAuth = true; 
	
    $mail->Host       = "smtp.gmail.com";                     
    //$mail->SMTPAuth   = true;                                   
    $mail->Username   = "dailyfresh9718@gmail.com";                     
    $mail->Password   = "ejwyrtbcacwyjgyg";  
	
	$mail->SMTPSecure = "tls";   
    $mail->Port       = 587; 

	$mail->setFrom("dailyfresh9718@gmail.com",$username);
	$mail->addAddress($email);
	
    $mail->IsHTML(true);
    //$mail->From = "dailyfresh9718@gmail.com";
    //$mail->FromName = "Daily Fresh";
    $mail->Subject = "Resend - Email Verification from Daily Fresh";

    // Define the email body and recipient address
    $email_template = "
    <h2>You have registered with Daily Fresh Ordering System</h2>
    <h5>Verify your email address to login with the below given link</h5>
    <br></br>
    <a href='localhost/DailyFreshOrderingSystem/partials/verify-email.php?token=$verify_token'> Click Me </a>
    ";

    $mail->Body = $email_template;
    //$mail->AddAddress($email);

    if (!$mail->Send()) {
        echo "Mailer Error: " . $mail->ErrorInfo;
    } else {
        echo "An email has been sent";
    }
				
}

if(isset($_POST['resend_email_verify_btn']))
{
	
	if(!empty(trim($_POST['email'])))
	{
		$email = mysqli_real_escape_string($con, $_POST['email']);
		
		$checkemail_query = "SELECT * FROM users WHERE email ='$email' LIMIT 1";
		$checkemail_query_run = mysqli_query($con, $checkemail_query);
		
		if(mysqli_num_rows($checkemail_query_run)> 0)
		{
			$row = mysqli_fetch_array($checkemail_query_run);
			if($row['verify_status'] =="0")
			{
				$username = $row['username'];
				$firstname = $row['firstname'];
				$lastname = $row['lastname'];
				$email = $row['email'];
				$phone = $row['phone'];
				$verify_token = $row['verify_token'];
				
				resend_email_verify($username, $firstName, $lastName, $email, $phone, $verify_token);
				
				$_SESSION['status'] = "Verification Email link has been sent to your email address!";
				header("Location: resend-email-verification.php");
				exit(0);
			}
			else
			{
				$_SESSION['status'] = "Email already verified. Please Login";
				header("Location: resend-email-verification.php");
				exit(0);
			}
			
			
		}
		
		else
		{
				
		$_SESSION['status'] = "Email is not registered. Please register now!";
		header("Location: resend-email-verification.php");
		exit(0);
		}
		
	}
	else
	{
		
		$_SESSION['status'] = "Please enter the email field";
		header("Location: resend-email-verification.php");
		exit(0);
	}

	
	
	
}


?>