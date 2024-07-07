<?php
    $ketnoi['host'] = 'localhost'; 
    $ketnoi['dbname'] = 'nha_tro';
    $ketnoi['username'] = 'root'; 
    $ketnoi['password'] = '';
	
    $conn = mysqli_connect(
        "{$ketnoi['host']}",
        "{$ketnoi['username']}",
        "{$ketnoi['password']}")
    or
        die("Không thể kết nối database");
    mysqli_select_db(
		$conn,
        "{$ketnoi['dbname']}") 
    or
        die("Không thể chọn database");
?>