<?php 
session_start();
if (isset($_SESSION['role']) && isset($_SESSION['id']) && $_SESSION['role'] == "admin") {
?>
<!DOCTYPE html>
<html>
<head>
	<title>Add Users </title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<input type="checkbox" id="checkbox">
	<?php include "inc/header.php" ?>
	<div class="body">
		 <?php include "inc/nav.php" ?>
		<section class="section-1">
      <h4 class="title">Add Users <a href="user.php">Users</a></h4>
      <form class="form-1"
			      method="POST"
			      action="app/add-user.php">
			      <?php if (isset($_GET['error'])) {?>
      	  	<div class="danger" role="alert">
			  <?php echo stripcslashes($_GET['error']); ?>
			</div>
      	  <?php } ?>

      	  <?php if (isset($_GET['success'])) {?>
      	  	<div class="success" role="alert">
			  <?php echo stripcslashes($_GET['success']); ?>
			</div>

      	  <?php } ?>
				<div class="input-holder">
					<lable>Full Name</lable>
					<input type="text" name="full_name" class="input-1" placeholder="Full Name"><br><br>
				</div>

        <div class="input-holder">
					<lable>Username</lable>
					<input type="text" name="user_name" class="input-1" placeholder="Username"><br><br>
				</div>

				<div class="input-holder">
					<lable>Password</lable>
					<input type="text" name="password" class="input-1" placeholder="Password"><br><br>
				</div>

				<button class="edit-btn">Add</button>
			</form>

		</section>
	</div>

<script type="text/javascript">
    var active = document.querySelector("#navList li:nth-child(2)");
    active.classList.add("active");
  </script>

</body>
</html>
<?php }else{ 
   $em = "First login";
   header("Location: login.php?error=$em");
   exit();
}
 ?>