<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["email"]) && !empty($_POST["email"])) {
        $email = $_POST["email"];
        $email = filter_var($email, FILTER_SANITIZE_EMAIL);
        $email = filter_var($email, FILTER_VALIDATE_EMAIL);

        if (!$email) {
            $error .= "Invalid email address";
        } else {
            include('dbcon.php');

            // Check if the email exists in your database (assuming your table is named 'users')
            $query = "SELECT * FROM users WHERE email = ?";
            $stmt = $con->prepare($query);
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
            $stmt->close();

            if ($result->num_rows === 0) {
                $error .= "<script>alert('No record found!');</script>";
            }
        }

        if (empty($error)) {
            $output = '';
            $key = md5(time() . uniqid(rand(), true));

            // Insert data into a table (you should create this table)
            $query = "INSERT INTO password_reset_temp (email, `key`, expDate) VALUES (?, ?, ?)";
            $stmt = $con->prepare($query);

            $expFormat = mktime(date("H"), date("i"), date("s"), date("m"), date("d") + 1, date("Y"));
            $expDate = date("Y-m-d H:i:s", $expFormat);

            $stmt->bind_param("sss", $email, $key, $expDate);

            if ($stmt->execute()) {
                $output .= '<p>Hello ! Please click on the following link to reset your password.</p>';
                $output .= '<p><a href="http://localhost/DailyFreshOrderingSystem/password_change.php?key=' . $key . '&email=' . $email . '&action=reset" target="_blank">Reset Password</a></p>';
                $body = $output;
                $subject = "Reset Password Notification";

                $email_to = $email;

                $mail = new PHPMailer(true);

                try {
                    // Server settings
                    $mail->isSMTP();
                    $mail->Host = 'smtp.gmail.com';
                    $mail->SMTPAuth = true;
                    $mail->Username = 'dailyfresh9718@gmail.com'; // Your Gmail email address
                    $mail->Password = 'ejwyrtbcacwyjgyg'; // Your Gmail password
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                    $mail->Port = 587;

                    // Sender info
                    $mail->setFrom('dailyfresh9718@gmail.com', 'Daily Fresh');
                    $mail->addAddress($email_to);

                    // Content
                    $mail->isHTML(true);
                    $mail->Subject = $subject;
                    $mail->Body = $body;

                    $mail->send();
                    echo "<script>alert('An email has been sent. Please check your email');</script>";
                } catch (Exception $e) {
                    echo "Mailer Error: " . $mail->ErrorInfo;
                }
            } else {
                echo "Error: " . $con->error;
            }
        } else {
            echo $error;
        }
    }
}

if(isset($_SESSION['password_update']))
{
	$email = mysqli_real_escape_string($con, $_POST['email']);
	$new_password = mysqli_real_escape_string($con, $_POST['new_password']);
	$confirm_password = mysqli_real_escape_string($con, $_POST['confirm_password']);
	$key = mysqli_real_escape_string($con, $_POST['password_key']);
	
	if(!empty($key))
	{
		if(!empty($email) && !empty($new_password) && !empty($confirm_password))
		{
			$check_key = "SELECT key FROM users WHERE key = '$key' LIMIT 1 ";
			$check_key_run = mysqli_query($con, $check_key);
			
			if(mysqli_num_rows($check_key_run) > 0)
			{
				if($new_password == $confirm_password)
				{
					$new_key = md5(rand())."funda";
					$update_to_new_key = "UPDATE users SET key = '$new_key' WHERE key = '$key' LIMIT 1";
					$update_to_new_key_run= mysqli_query($con, $update_to_new_key);
					
					
					if($update_password_run)
					{	
						$update_password = "UPDATE users SET password = '$new_password' WHERE key = '$key' LIMIT 1";
						$update_password_run = mysqli_query($con, $update_password);
				
						$_SESSION['status'] = "New Password Successfully updated!";
						header("Location : index.php");
						exit(0);
					}
					else
					{
						$_SESSION['status'] = "Did not update. Something went wrong";
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
				$_SESSION['status'] = "Invalid key";
				header("Location : password_change.php?key=$key&email=$email");
				exit(0);
			}
		}
		else 
		{
			$_SESSION['status'] = "All Filed are Mandatory";
			header("Location : password_change.php?key=$key&email=$email");
			exit(0);
		}
	}
	else
	{
		$_SESSION['status'] = "No Key Available";
		header("Location : password_change.php");
		exit(0);
	}
}	


?>
