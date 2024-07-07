<?php
$mysqli = new mysqli("localhost","root","","nha_tro");

// Check connection
if ($mysqli->connect_errno) {
  echo "looix: " . $mysqli->connect_error;
  exit();
}
?>
