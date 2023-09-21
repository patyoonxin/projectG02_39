<?php

if(isset($_POST['password_update']))
{
	$email = mysqli_real_escape_string($con, $_POST['email']);
	$new_password = mysqli_real_escape_string($con, $_POST['new_password']);
	$confirm_password = mysqli_real_escape_string($con, $_POST['confirm_password']);
	
	$key = mysqli_real_escape_string($con, $_POST['password_key']);
	
	if(!empty($key))
	{
		if(!empty($email) && !empty($new_password) && !empty($confirm_password))
		{
			$check_key = "SELECT verify_token FROM users WHERE verify_token = '$key' LIMIT 1 ";
			$check_key_run = mysqli_query($con, $check_key);
			
			if(mysqli_num_rows($check_key_run) > 0)
			{
				if($new_password == $confirm_password)
				{
					
					$update_password = "UPDATE users SET password = '$new_password' WHERE verify_token = '$key' LIMIT 1";
					$update_password_run = mysqli_query($con, $update_password);
						
					if($update_password_run)
					{	
						$new_key = md5(rand())."funda";
						$update_to_new_key = "UPDATE users SET verify_token = '$new_key' WHERE verify_token = '$key' LIMIT 1";
						$update_to_new_key_run= mysqli_query($con, $update_to_new_key);
				
						$_SESSION['status'] = "New Password Successfully updated!";
						header("Location : index.php");
						exit(0);
					}
					else
					{
						$_SESSION['status'] = "Did not update. Something went wrong.!";
						header("Location : password_change.php?key=$key&email=$email");
						exit(0);
					}
					
				}
				else
				{
					$_SESSION['status'] = "Password and Confirm Password does not match";
					header("Location : password_change.php?key=$key&email=$email");
					exit(0);
				}
			}
			else
			{
				$_SESSION['status'] = "Invalid Key";
				header("Location : password_change.php?key=$key&email=$email");
				exit(0);
			}
		}
		else 
		{
			$_SESSION['status'] = "All Filed are Mandatory";
			header("Location: password_change.php?key=$key&email=$email");
			exit(0);
		}
	}
	else
	{
		$_SESSION['status'] = "No Key Available";
		header("Location: password_change.php");
		exit(0);
	}
}	


?>