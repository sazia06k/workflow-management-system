<?php
session_start();
if (isset($_SESSION['role'])&& isset($_SESSION['id']) && $_SESSION['role'] == "admin") {
  include "DB_connection.php";
  include "app/model/User.php";

  $users = get_all_users($conn);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Task</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="css/style.css">
 

</head>
<body>
  <input type="checkbox" id="checkbox">
  <?php include "inc/header.php" ?>
  <div class="body">
    <?php include "inc/nav.php" ?>
    <section class="section-1">
      <h4 class="title">Create Task</h4><br>

      <form class="form-1"
			      method="POST"
			      action="app/add-task.php">
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
					<lable>Title</lable>
					<input type="text" name="title" class="input-1" placeholder="Title"><br><br>
				</div>

        <div class="input-holder">
					<lable>Description</lable>
          <textarea type="text" name="description" class="input-1" placeholder="Description"></textarea><br><br>
				</div>
        <div class="input-holder">
					<lable>Due Date</lable>
					<input type="date" name="due_date" class="input-1" placeholder="Due Date"><br>
				</div>

        <div class="input-holder">
					<lable>Assigned to</lable>
					<select name="assigned_to"   class="input-1">
            <option value="0">Select employee</option>
            <?php if ($users !=0) { 
							foreach ($users as $user) {
						?>
                  <option value="<?=$user['id']?>"><?=$user['full_name']?></option>
						<?php } } ?>
          </select><br>
				</div>
				<button class="edit-btn">Create Task</button>
			</form>

    </section>
  </div>
   <script type="text/javascript">
    var active = document.querySelector("#navList li:nth-child(3)");
    active.classList.add("active");
  </script>
</body>
</html>
<?php
} else{
  $em = "first login";
    header("Location: login.php?error=$em");
    exit();
}



