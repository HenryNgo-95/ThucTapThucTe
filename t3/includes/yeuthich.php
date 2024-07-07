<?php
// Bao gồm file config.php để có thể sử dụng biến kết nối $mysqli
include('C:/xampp/htdocs/t3/admincp/config/config.php');

// Kiểm tra xem id và ma_tro được gửi lên từ form POST hay không
if (isset($_POST['id']) && isset($_POST['ma_tro'])) {
    $id = $_POST['id']; // Lấy id từ form POST
    $ma_tro = $_POST['ma_tro']; // Lấy mã trọ từ form POST

    // Chuẩn bị câu lệnh SQL để kiểm tra sự tồn tại
    $check_sql = "SELECT * FROM yeuthich1 WHERE id = ? AND ma_tro = ?";
    $check_stmt = $mysqli->prepare($check_sql);
    $check_stmt->bind_param("is", $id, $ma_tro);
    
    // Thực thi câu lệnh kiểm tra
    $check_stmt->execute();
    $check_stmt->store_result();
    
    // Kiểm tra số lượng bản ghi trả về
    if ($check_stmt->num_rows > 0) {
        echo "Exists"; // Nếu đã tồn tại trong danh sách yêu thích
    } else {
        // Chuẩn bị câu lệnh SQL cho lệnh insert
        $insert_sql = "INSERT INTO yeuthich1 (id, ma_tro) VALUES (?, ?)";
        $insert_stmt = $mysqli->prepare($insert_sql);
        $insert_stmt->bind_param("is", $id, $ma_tro);
        
        // Thực thi câu lệnh insert
        if ($insert_stmt->execute()) {
            echo "Done"; // Trả về thông báo thành công nếu insert thành công
        } else {
            echo "Error: " . $mysqli->error; // Trả về thông báo lỗi nếu có lỗi trong quá trình insert
        }
        
        // Đóng statement insert
        $insert_stmt->close();
    }
    
    // Đóng statement kiểm tra
    $check_stmt->close();
} else {
    echo "Invalid data"; // Trường hợp dữ liệu gửi lên không hợp lệ
}

// Đóng kết nối MySQL
$mysqli->close();
?>