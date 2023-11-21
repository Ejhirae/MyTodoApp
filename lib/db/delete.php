<?php
require('db.php');
$todo_id = $_POST['todo_id'];
$sql = "DELETE FROM todo WHERE todo_id = '$todo_id' AND user_id = 1";

$result = mysqli_query($con, $sql);
echo $sql;
echo $result;

if ($result > 0) {
    echo json_encode("success");
}
?>