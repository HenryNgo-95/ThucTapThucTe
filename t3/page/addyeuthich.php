<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Sản phẩm yêu thích</title>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Danh sách sản phẩm yêu thích</h2>
        <div class="row">
            <div class="col-md-6">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Bao gồm file config.php để có thể sử dụng biến kết nối $mysqli
                        include('C:/xampp/htdocs/test/admincp/config/config.php');

                        // Câu truy vấn SQL để lấy dữ liệu từ các bảng
                        $query = "SELECT yt.id, n.image_url_1, nt.ten
                                  FROM nhatro_anh n, nhatro nt, tbl_yeuthich yt
                                  WHERE n.ma_tro = nt.ma_tro
                                  AND nt.ma_tro = yt.ma_tro
                                  ORDER BY yt.id";

                        // Thực thi câu truy vấn và lưu kết quả vào biến $result
                        $result = mysqli_query($mysqli, $query);

                        // Kiểm tra và xử lý kết quả
                        if (mysqli_num_rows($result) > 0) {
                            // Lặp qua từng dòng kết quả và xử lý
                            while ($row = mysqli_fetch_assoc($result)) {
                                // Đọc và sử dụng dữ liệu từ từng dòng
                                $id = $row['id'];
                                $image_url = $row['image_url_1'];
                                $ten = $row['ten'];
                                
                                // Xuất các dòng dữ liệu vào trong bảng HTML
                                echo "<tr>";
                                echo "<td>" . $id . "</td>";
                                echo "<td><img src='" . $image_url . "' alt='Ảnh' style='max-width: 100px;'></td>";
                                echo "<td>" . $ten . "</td>";
                                echo "<td><a href='../includes/xoa.php?id=" . $id . "' class='btn btn-danger'>Xóa</a></td>"; // Thêm tham số id vào URL
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='4'>Không có dữ liệu</td></tr>";
                        }

                        // Đóng kết nối
                        mysqli_close($mysqli);
                        ?>
                    </tbody>
                </table>
            </div>
         
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>