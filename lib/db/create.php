<?php
require("db.php");
$todo_message = $_POST['todo_message'];
// $date_created = $_POST['date_created'];
// $user_id = $_POST['user_id'];
$currentDateTime = date('Y-m-d');
echo $currentDateTime;
$sql = "INSERT INTO todo (user_id, date_created, todo_message) VALUES (1, '$currentDateTime', '$todo_message')";

$result = mysqli_query($con, $sql);
echo $sql;
echo $result;

if ($result > 0) {
    echo json_encode("success");
}
?>