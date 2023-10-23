<?php
include '_dbconnect.php';
?>

<!-- Checkout Modal -->
<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="checkoutModal">Enter Your Details:</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form action="partials/_manageCart.php" method="post">
                <div class="form-group">
                    <b><label for="address">Address:</label></b>
                    <input class="form-control" id="address" name="address" placeholder="1234 Main St" type="text" required minlength="3" maxlength="500">
					<small class="text-danger address"></small>
                </div>
                <div class="form-group">
                    <b><label for="address1">Address Line 2:</label></b>
                    <input class="form-control" id="address1" name="address1" placeholder="near st, Surat, Gujarat" type="text">
					<small class="text-danger address1"></small>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6 mb-0">
                        <b><label for="phone">Phone No:</label></b>
                        <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon">+60</span>
                        </div>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="xxxxxxxxxx" required pattern="[0-9]+" minlength="9" maxlength="10">
                        </div>
						<small class="text-danger phone"></small>
                    </div>
                    <div class="form-group col-md-6 mb-0">
                        <b><label for="zipcode">Zip Code:</label></b>
                        <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="xxxxxx" required pattern="[0-9]{5}" maxlength="5">       
						<small class="text-danger zipcode"></small>						
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <input type="hidden" name="amount" value="<?php echo $totalPrice ?>">
					<input type="hidden" name="paymentMode" value="0">
					<input type="hidden" name="payment_id" value="0">
                    <button type="submit" name="checkout" class="btn btn-success">Order by COD</button>
					<input type="hidden" name="amount" value="<?php echo $totalPrice ?>">
					<div id="paypal-button-container" class="mt-2" ></div>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>

<!-- Replace the "test" client-id value with your client-id -->
    <script src="https://www.paypal.com/sdk/js?client-id=ASIMg1fITwry2EHK31X5Pm2znzEz81EmyEVhx_Kc2ZZcoKFCOhdgKknvwjgX0wImG94_u-xfMCsNJD7j&disable-funding=credit,card"></script>
	
	<script>
		
		paypal.Buttons({
			
			onClick(){
				
				console.log("on click");
				
				var address = $('#address').val();
				var address1 = $('#address1').val();
				var phone = $('#phone').val();
				var zipcode = $('#zipcode').val();
				var password = $('#password').val();

				
				if(address.length==0){
					$('.address').text("*This field is required.");
				}else{
					$('.address').text("");
				}
				
				if(address1.length==0){
					$('.address1').text("*This field is required.");
				}else{
					$('.address1').text("");
				}
				
				if(zipcode.length==0){
					$('.zipcode').text("*This field is required.");
				}else{
					$('.zipcode').text("");
				}
				
				
				if (address.length==0 || address1.length==0 || zipcode.length==0)
				{
					return false;
				}
			},
			
			createOrder:(data,actions) => {
				console.log("create order");
				return actions.order.create({
					purchase_units: [{
						amount:{
							value: '0.1'//'<?= $totalPrice ?>'
						}
					}]
				});
			},
			
		onApprove: (data,actions) => {
			
			return actions.order.capture().then(function(orderData){
			//console.log('Capture result', orderData, JSON.stringify(orderData,null,2));
			console.log("order data");
			const transaction = orderData.purchase_units[0].payments.captures[0];
			//alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);
			
			var address = $('#address').val();
			var address1 = $('#address1').val();
			var phone = $('#phone').val();
			var zipcode = $('#zipcode').val();
			var password = $('#password').val();
			
			var data = {
				'address': address,
				'address1': address1,
				'phone': phone,
				'zipcode': zipcode,
				//'address': address1+address2,
				'paymentMode': 1,
				'payment_id': transaction.id,
				'checkout': true
			};
			
			$.ajax({
				method: "POST",
				url: "partials/_manageCart.php",
				data: data,
				success: function (response){
					if (response==201){
						alert("Thanks for ordering with us. Your order id is ' .$orderId. '.");
						window.location.href="http://localhost/DailyFreshOrderingSystem/index.php";  
					}else{
						console.log(response);
					}
				}
			});

			
		});
		
		}
		}).render('#paypal-button-container');
	</script>