<?php
session_start();
include('dbcon.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

function sendemail_verify($username, $firstName, $lastName, $email, $phone, $verify_token)
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
    $mail->Subject = "Email Verification";

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

if (isset($_POST['register_btn'])) {
    $username = $_POST['username'];
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];
    $verify_token = md5(rand()); //$_POST['verify_token']; 
    //$verify_status = ''; // You need to define this variable

   

    //email exist or not

    $check_email_query = "SELECT email FROM users WHERE email='$email' LIMIT 1 ";
    $check_email_query_run = mysqli_query($con, $check_email_query);

    if (mysqli_num_rows($check_email_query_run) > 0) {
        $showError = "Email Id already Exist";
        header("Location: /DailyFreshOrderingSystem/index.php?signupsuccess=false&error=$showError");
    } else {
		// Check whether this username exists
		$existSql = "SELECT * FROM `users` WHERE username = '$username'";
		$result = mysqli_query($con, $existSql);
		$numExistRows = mysqli_num_rows($result);
		if($numExistRows > 0){
			$showError = "Username Already Exists";
			header("Location: /DailyFreshOrderingSystem/index.php?signupsuccess=false&error=$showError");
			}
		else{
        
			if(($password == $cpassword)){
				$hash = password_hash($password, PASSWORD_DEFAULT);
				$_query = "INSERT INTO `users` ( `username`, `firstName`, `lastName`, `email`, `phone`, `password`, `joinDate`,`verify_token`) VALUES ('$username', '$firstName', '$lastName', '$email', '$phone', '$hash', current_timestamp(),'$verify_token')";   
				$query_run = mysqli_query($con, $_query);
					if ($query_run)
					{
						sendemail_verify($username, $firstName, $lastName, $email, $phone, $verify_token);
						$_SESSION['status'] = "Registration Successful! Please verify your Email Address. ";
						//$showAlert = true;
						header("Location: /DailyFreshOrderingSystem/index.php?signupsuccess=true");
					}		
					else 
					{
						$_SESSION['status'] = "Registration Failed";
						header("Location: /DailyFreshOrderingSystem/index.php?signupsuccess=false&error=$showError");
					}
			}
			else{
				$showError = "Passwords do not match";
				header("Location: /DailyFreshOrderingSystem/index.php?signupsuccess=false&error=$showError");
				}  
			}				
		
    }
} else {
    $_SESSION['status'] = "Registration Failed";
    header("Location: /DailyFreshOrderingSystem/index.php?signupsuccess=false&error=$showError");
}
?>
