<?php
session_start();
if (isset($_SESSION['role'])&& isset($_SESSION['id'])) {
  include "DB_connection.php";
  include "app/model/Task.php";
  include "app/model/User.php";

  $text = "All Task";
    if (isset($_GET['due_date']) &&  $_GET['due_date'] == "Due Today") {
    	$text = "Due Today";
      $tasks = get_all_tasks_due_today($conn);
      $num_task = count_tasks_due_today($conn);

    }else if (isset($_GET['due_date']) &&  $_GET['due_date'] == "Overdue") {
    	$text = "Overdue";
      $tasks = get_all_tasks_overdue($conn);
      $num_task = count_tasks_overdue($conn);

    }else if (isset($_GET['due_date']) &&  $_GET['due_date'] == "No Deadline") {
    	$text = "No Deadline";
      $tasks = get_all_tasks_NoDeadline($conn);
      $num_task = count_tasks_NoDeadline($conn);

    }else{
    	 $tasks = get_all_tasks($conn);
       $num_task = count_tasks($conn);
    }
    $users = get_all_users($conn);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Tasks</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="css/style.css">
 

</head>
<body>
  <input type="checkbox" id="checkbox">
  <?php include "inc/header.php" ?>
  <div class="body">
    <?php include "inc/nav.php" ?> 
    <section class="section-1"> 
      <h4 class="title-2">
				<a href="create_task.php" class="btn">Create Task</a>
				<a href="tasks.php?due_date=Due Today">Due Today</a>
				<a href="tasks.php?due_date=Overdue">Overdue</a>
				<a href="tasks.php?due_date=No Deadline">No Deadline</a>
				<a href="tasks.php">All Tasks</a>
			</h4>
         <h4 class="title-2"><?=$text?> (<?=$num_task?>)</h4>
      <?php if(isset($_GET['success'])) {?>
      <div class="success" role="alert">
      <?php echo stripcslashes($_GET['success']); ?>
      </div>
      <?php } ?>

      <?php if($tasks != 0) { ?>
      <table class="main-table">
        <tr>
          <th>#</th>
          <th>Title</th>
          <th>Description</th>
          <th>Assigned to</th>
          <th>Due Date</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
        <?php $i=0; foreach ($tasks as $task) { ?> 
        <tr>
          <td><?=++$i?></td>
          <td><?=$task['title']?></td>
          <td><?=$task['description']?></td>
          <td>
						<?php 
            foreach ($users as $user) {
						if($user['id'] == $task['assigned_to']){
							echo $user['full_name'];
						}}?>
	          </td>
            <td><?php if($task['due_date'] == "") echo "No Deadline";
	                   else echo $task['due_date'];
	               ?></td></td>
            <td><?=$task['status']?></td>
            <td>
            <a href="edit-task.php?id=<?=$task['id']?>" class="edit-btn">Edit</a>
            <a href="delete-task.php?id=<?=$task['id']?>" class="delete-btn">Delete</a>
            </td>
          </tr>
        <?php } ?>
      </table>
      <?php }else { ?>
        <h3>Empty</h3>
      <?php }?>
    </section>
  </div>


  <script type="text/javascript">
    var active = document.querySelector("#navList li:nth-child(4)");
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



