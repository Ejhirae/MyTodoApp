<?php
require("db.php");
$isComplete = $_POST['is_complete'];
$todo_id = $_POST['todo_id'];
$sql = "INSERT INTO history(todo_id, user_id, todo_message, is_complete, date_finished) SELECT todo_id, user_id, todo_message, is_complete, DATE_FORMAT(NOW(), '%Y-%m-%d') FROM todo WHERE user_id = 1 AND todo_id = $todo_id AND is_complete = $isComplete";
$sql2 = "DELETE FROM todo WHERE todo_id = '$todo_id'";
$result = mysqli_query($con, $sql);
$result2 = mysqli_query($con, $sql2);
echo $sql;
echo $sql2;
echo $result + $result2;
if ($result > 0 && $result2 > 0) {
    echo json_encode("success");
}
?>