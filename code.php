<?php
session_start();
include('dbcon.php');

function sendemail_verify("$id","$username","$firstName","$lastName","$email","$phone","$password","$cpassword")
{

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
$_query = "INSERT INTO users (id,username,firstName,lastName,email,phone,userType,password) VALUES ('$id','$username','$firstName','$lastName','$email,'$phone','$userType',$password)";
$query_run = mysqli_query($con, $query);

if(query_run)

}
sendemail_verify("$id","$username","$firstName","$lastName","$email","$phone","$password","$cpassword");
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