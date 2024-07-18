<?php
include("database.php");
function redirect($url)
{
    echo"
    <script>
    window.location.href='$url';
    </script>";
}

function alerting($msg)
{
    echo"
    <script>
    alert('$msg');
    </script>";
}
?>
