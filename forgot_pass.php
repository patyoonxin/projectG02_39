<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$error = "";
?>
<html>
    <head>
	 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Password Recovery</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">

                    <h2>Forgot Password</h2>   

                    <?php
                    include('dbcon.php');
                    if (isset($_POST["email"]) && (!empty($_POST["email"]))) {
                        $email = $_POST["email"];
                        $email = filter_var($email, FILTER_SANITIZE_EMAIL);
                        $email = filter_var($email, FILTER_VALIDATE_EMAIL);
                        if (!$email) {
                            $error .= "Invalid email address";
                        } else {
                            $sel_query = "SELECT * FROM `users` WHERE email='" . $email . "'";
                            $results = mysqli_query($con, $sel_query);
                            $row = mysqli_num_rows($results);
                            if ($row === 0) {
                                $error .=  "<script>alert('No record found!');</script>";
                            }
                        }
                        if ($error != "") {
                            echo $error;
                        } else {

                            $output = '';

                            $expFormat = mktime(date("H"), date("i"), date("s"), date("m"), date("d") + 1, date("Y"));
                            $expDate = date("Y-m-d H:i:s", $expFormat);
                            $key = md5(time());
                            $addKey = substr(md5(uniqid(rand(), 1)), 3, 10);
                            $key = $key . $addKey;
                            // Insert Temp Table
                            mysqli_query($con, "INSERT INTO `password_reset_temp` (`email`, `key`, `expDate`) VALUES ('" . $email . "', '" . $key . "', '" . $expDate . "');");

                            $output.='<p>Please click on the following link to reset your password.</p>';
                            //replace the site url
                            $output.='<p><a href="http://localhost/DailyFreshOrderingSystem/reset_pass.php?key=' . $key . '&email=' . $email . '&action=reset" target="_blank">http://localhost/DailyFreshOrderingSystem/reset_pass.php?key=' . $key . '&email=' . $email . '&action=reset</a></p>';
                            $body = $output;
                            $subject = "Password Recovery";

                            $email_to = $email;

                            //autoload the PHPMailer
                            require("vendor/autoload.php");
                            $mail = new PHPMailer();
                            $mail->IsSMTP();
                            $mail->Host = "smtp.gmail.com"; // Enter your host here
                            $mail->SMTPAuth = true;
                            $mail->Username = "dailyfresh9718@gmail.com"; // Enter your email here
                            $mail->Password = "ejwyrtbcacwyjgyg"; //Enter your password here
                            $mail->Port = 587;
                            $mail->IsHTML(true);
                            $mail->From = "dailyfresh9718@gmail.com";
                            $mail->FromName = "Daily Fresh";

                            $mail->Subject = $subject;
                            $mail->Body = $body;
                            $mail->AddAddress($email_to);
                            if (!$mail->Send()) {
                                echo "Mailer Error: " . $mail->ErrorInfo;
                            } else {
                                echo "<script>alert('An email has been sent. Please check your email');</script>";
                            }
                        }
                    }
                    ?>
                    <form method="post" action="" name="reset">
                        <div class="form-group">
                           <label><strong>Enter Your Email Address:</strong></label>
                            <input type="email" name="email" placeholder="username@email.com" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <input type="submit" id="reset" value="Reset Password"  class="btn btn-primary"/>
                        </div>
                    </form>

                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </body>
</html>
