<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

include('dbcon.php');

function sendemail_verify($username, $firstName, $lastName, $email, $phone, $password, $cpassword, $verify_token, $verify_status)
{
	require 'vendor/autoload.php';
    $mail = new PHPMailer(true);
    $mail->isSMTP();                                            
    $mail->Host       = 'smtp.gmail.com';                     
    $mail->SMTPAuth   = true;                                   
    $mail->Username   = 'dailyfresh9718@gmail.com';                     
    $mail->Password   = 'ejwyrtbcacwyjgyg';                               
        
    $mail->Port       = 587;                                    
    $mail->IsHTML(true);
    $mail->From = "dailyfresh9718@gmail.com";
    $mail->FromName = "Daily Fresh";
    $mail->Subject = "Email Verification";

    // Define the email body and recipient address
    $email_template = "
    <h2>You have registered with Daily Fresh Ordering System</h2>
    <h5>Verify your email address to Login with the below given link</h5>
    <br></br>
    <a href='localhost/DailyFreshOrderingSystem/partials/verify-email.php?token=$verify_token'> Click Me </a>
    ";

    $mail->Body = $email_template;
    $mail->AddAddress($email);

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
    $verify_token = uniqid(); //$_POST['verify_token'];
    $verify_status = ''; // You need to define this variable

    sendemail_verify($username, $firstName, $lastName, $email, $phone, $password, $cpassword, $verify_token, $verify_status);
    echo "send or not ?";

    //email exist or not

    $check_email_query = "SELECT email FROM users WHERE email='$email' LIMIT 1 ";
    $check_email_query_run = mysqli_query($con, $check_email_query);

    if (mysqli_num_rows($check_email_query_run) > 0) {
        $_SESSION['status'] = "Email Id already Exist";
        header("Location: register.php");
    } else {
        // Insert User / register user data
        $_query = "INSERT INTO users (username,firstName,lastName,email,phone,userType,password,cpassword,verify_token) VALUES ('$username','$firstName','$lastName','$email','$phone','$userType','$password','$cpassword','$verify_token')";
        $query_run = mysqli_query($con, $_query);

        if ($query_run) {
            sendemail_verify($username, $firstName, $lastName, $email, $phone, $password, $cpassword, $verify_token, $verify_status);
            $_SESSION['status'] = "Registration Successful! Please verify your Email Address. ";
            header("Location: _signupModal.php");
        } else {
            $_SESSION['status'] = "Registration Failed";
            header("Location: _signupModal.php");
        }
    }
} else {
    $_SESSION['status'] = "Registration Failed";
    header("Location: _signupModal.php");
}
?>
