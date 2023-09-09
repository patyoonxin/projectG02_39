<?php
include('dbcon');

if(isset($_POST['password_rest_link']))
{
	$email = mysqli_real_escape_string($con, $_POST['email']);
	$token = md5(rand());
}


?>