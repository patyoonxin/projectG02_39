<?php
if($_SERVER["REQUEST_METHOD"] == "POST"){
    include '_dbconnect.php';
    $username = $_POST["username"];
    $password = $_POST["password"]; 
    
    $sql = "Select * from users where username='$username'"; 
    $result = mysqli_query($conn, $sql);
    $num = mysqli_num_rows($result);
    if ($num == 1){
        $row=mysqli_fetch_assoc($result);
        $userType = $row['userType'];
        if($userType == 2) {
            $userId = $row['id'];
            if (password_verify($password, $row['password'])){ 
                session_start();
                $_SESSION['staffloggedin'] = true;
                $_SESSION['staffusername'] = $username;
                $_SESSION['staffuserId'] = $userId;
                header("location: /DailyFreshOrderingSystem/staff/index.php?loginsuccess=true");
                exit();
            } 
            else{
                header("location: /DailyFreshOrderingSystem/staff/login.php?loginsuccess=false");
            }
        }
        else {
            header("location: /DailyFreshOrderingSystem/staff/login.php?loginsuccess=false");
        }
    } 
    else{
        header("location: /DailyFreshOrderingSystem/staff/login.php?loginsuccess=false");
    }
}    
?>