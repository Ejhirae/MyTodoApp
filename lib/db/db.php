<?php

$con=mysqli_connect("192.168.0.25","root","","mytodo");
 // Check connection
 if (mysqli_connect_errno())
   {
    echo mysqli_error($con);
   return "-1";
   die();
   }

?>