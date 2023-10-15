<?php
if($_SERVER["REQUEST_METHOD"] == "POST"){
    include '_dbconnect.php';
    $username = $_POST["loginusername"];
    $password = $_POST["loginpassword"]; 
    
    $sql = "Select * from users where username='$username'"; 
    $result = mysqli_query($conn, $sql);
    $num = mysqli_num_rows($result);
    if ($num == 1){
        $row=mysqli_fetch_assoc($result);
        $userId = $row['id'];
        if (password_verify($password, $row['password'])){ 
            	
			$userType=$row['userType'];
			if($row['userType']=="0"){
			
			if($row['verify_status']=="1"){
				/*session_start();
				$_SESSION['authenticated'] = true;
				$_SESSION['auth-user'] = [
						'username' => $row['name'],
						'firstName' => $row['firstName'],
						'lastName' => $row['lastName'],
						'phone' => $row['phone'],
						'email' => $row['email']
						];
				header("location: /DailyFreshOrderingSystem/index.php?loginsuccess=true");*/
				
				session_start();
				$_SESSION['loggedin'] = true;
				$_SESSION['username'] = $username;
				$_SESSION['userId'] = $userId;
				header("location: /DailyFreshOrderingSystem/index.php?loginsuccess=true");
				exit();
				
			}else{
				
				//$_SESSION['status'] = "Please Verify your Email before Login.";
				header("location: /DailyFreshOrderingSystem/index.php?loginsuccess=false1");
			}
			}
			else{
				session_start();
				$_SESSION['loggedin'] = true;
				$_SESSION['username'] = $username;
				$_SESSION['userId'] = $userId;
				header("location: /DailyFreshOrderingSystem/index.php?loginsuccess=true");
				exit();
			}
			
        } 
        else{
			//$_SESSION['status'] = "Wrong Password.";
			header("location: /DailyFreshOrderingSystem/index.php?loginsuccess=false");
        }
    } 
    else{
        //$_SESSION['status'] = "Invalid.";
		header("location: /DailyFreshOrderingSystem/index.php?loginsuccess=false");
    }
}    
?>