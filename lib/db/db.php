<?php

$con=mysqli_connect("192.168.0.15","root"," ","todoapp");
 // Check connection
 if (mysqli_connect_errno())
   {
    echo mysqli_error($con);
   return "-1";
   die();
   }

?>