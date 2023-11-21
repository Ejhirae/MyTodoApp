<?php
require('db.php');
$todo_id = $_POST['todo_id'];
$isComplete = $_POST['is_complete'];
$sql = "UPDATE todo SET is_complete = '$isComplete' WHERE user_id = 1 AND todo_id = '$todo_id'";

$result = mysqli_query($con, $sql);
echo $sql;
echo $result;

if ($result > 0) {
    echo json_encode("success");
}
?>