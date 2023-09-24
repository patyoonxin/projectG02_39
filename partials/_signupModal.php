  <!-- Sign up Modal -->
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
		  <div class="modal-header" style="background-color: rgb(111 202 203);">
		  <!--<div class="alert">-->
			<?php
			if(isset($_SESSION['status']))
			{
				echo"<h4>".$_SESSION['status']."</h4>";
				unset($_SESSION['status']);
				echo"<br>";
			}else{
			
            echo"<h5>SignUp Here</h5>";
			}
			?>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="partials/code.php" method="post">
              <div class="form-group">
                  <b><label for="username">Username</label></b>
                  <input class="form-control" id="username" name="username" placeholder="Choose an Unique Username" type="text" required pattern="[A-Za-z0-9]+" required minlength="3" maxlength="11"
				  pattern="[^\s]+">
				  <span style="color:#777;font-size:12px;">*Usename cannot include spaces and symbols </span>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <b><label for="firstName">First Name:</label></b>
                  <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required pattern="[A-Za-z ]+" required>
				  <span style="color:#777;font-size:12px;">*First Name cannot include symbols </span>

                </div>
                <div class="form-group col-md-6">
                  <b><label for="lastName">Last name:</label></b>
                  <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last name" required pattern="[A-Za-z ]+" required>
                  <span style="color:#777;font-size:12px;">*Last Name cannot include symbols </span>
				</div>
              </div>
              <div class="form-group">
                  <b><label for="email">Email:</label></b>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Enter Your Email" required>
              </div>
              <div class="form-group">
                <b><label for="phone">Phone No:</label></b>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon">+60</span>
                  </div>
                  <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Your Phone Number" required pattern="[0-9]{9-10}" maxlength="10">
                </div>
              </div>
              <div class="text-left my-2">
                  <b><label for="password">Password:</label></b>
                  <input class="form-control" id="password" name="password" placeholder="Enter Password" type="password" required data-toggle="password" minlength="4" maxlength="21"
				  pattern="[^\s]+">
              </div>
              <div class="text-left my-2">
                  <b><label for="password1">Renter Password:</label></b>
                  <input class="form-control" id="cpassword" name="cpassword" placeholder="Renter Password" type="password" required data-toggle="password" minlength="4" maxlength="21"
				  pattern="[^\s]+">
				 <span style="color:#777;font-size:12px;">*Password cannot include spaces </span>

              </div>
              <button type="submit" class="btn btn-success" name="register_btn" >Submit</button>
            </form>
            <p class="mb-0 mt-1">Already have an account? <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">Login here</a>.</p>
			
			
          </div>
        </div>
      </div>
    </div>
