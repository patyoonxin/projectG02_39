<?php
session_start();
$page_title = "Password Change Update";
include('header.php'); // Include your header file
?>

<div class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <?php
                if (isset($_SESSION['status'])) {
                ?>
                    <div class="alert alert-success">
                        <h5><?= $_SESSION['status']; ?></h5>
                    </div>
                <?php
                    unset($_SESSION['status']);
                }
                ?>

                <div class="card">
                    <div class="card-header">
                        <h5>Change Password</h5>
                    </div>
                    <div class="card-body p-4">

                        <form action="password-reset-code.php" method="POST">
                            <input type="hidden" name="password_key" value="<?php if (isset($_GET['key'])) {
                                                                                echo $_GET['key'];
                                                                            } ?>">
                            

                            <div class="form-group mb-3">
                                <label>Email Address</label>
                                <input type="text" name="email" value="<?php if (isset($_GET['email'])) {
                                                                            echo $_GET['email'];
                                                                        } ?>" class="form-control" placeholder="Enter Email Address">
                            </div>

                            <div class="form-group mb-3">
                                <label>New Password</label>
                                <input type="password" name="new_password" class="form-control" placeholder="Enter New Password" minlength="4" maxlength="14">
                            </div>

                            <div class="form-group mb-3">
                                <label>Confirm Password</label>
                                <input type="password" name="confirm_password" class="form-control" placeholder="Enter Confirm Password" minlength="4" maxlength="14">
								<span style="color:#777;font-size:12px;">*Password cannot include spaces and should be 4-14 length long</span>
                            </div>

                            <div class="form-group mb-3">
                                <button type="submit" name="password_update" class="btn btn-success w-100">Update Password</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
