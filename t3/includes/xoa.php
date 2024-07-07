<?php
// Bao gồm file config.php để có thể sử dụng biến kết nối $mysqli
include('C:/xampp/htdocs/t3/admincp/config/config.php');

if (!$mysqli) {
    die('Không thể kết nối đến cơ sở dữ liệu: ' . mysqli_connect_error());
}

// Đoạn mã xử lý xóa
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Chuẩn bị câu truy vấn DELETE
    $query = "DELETE FROM yeuthich1 WHERE id_yt = ?";
    $stmt = $mysqli->prepare($query);

    if ($stmt === false) {
        die('Lỗi chuẩn bị câu truy vấn: ' . $mysqli->error);
    }

    // Gán giá trị và thực thi câu truy vấn
    $stmt->bind_param('i', $id);
    if (!$stmt->execute()) {
        die('Lỗi thực thi câu truy vấn: ' . $stmt->error);
    }

    // Đóng kết nối
    $stmt->close();
    $mysqli->close();

    // Thông báo đã xóa thành công và quay lại trang addyeuthich.php
    echo '<script>alert("Đã xóa thành công!"); window.location.href = "../includes/addyeuthich.php";</script>';
    exit; // Dừng script PHP để ngăn việc thực thi các lệnh phía sau

} else {
    // Nếu không có ID được cung cấp, chuyển hướng người dùng về trang addyeuthich.php
    echo '<script>alert("Không có ID hợp lệ!"); window.location.href = "../includes/addyeuthich.php";</script>';
    exit;
}
?>