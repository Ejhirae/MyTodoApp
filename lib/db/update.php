<?php
require('db.php');
$updated_todo_message = $_POST['todo_message'];
$todo_id = $_POST['todo_id'];
$sql = "UPDATE todo SET todo_message = '$updated_todo_message' WHERE user_id = 1 AND todo_id = '$todo_id'";

$result = mysqli_query($con, $sql);
echo $sql;
echo $result;

if ($result > 0) {
    echo json_encode("success");
}
?>