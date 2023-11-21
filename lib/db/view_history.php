<?php
require("db.php");
$sql = "SELECT * FROM history WHERE user_id = 1";
$result = mysqli_query($con, $sql);
$records = [];
while ($row = mysqli_fetch_assoc($result)) {
    $records[] = $row;
}

echo json_encode($records);
?>