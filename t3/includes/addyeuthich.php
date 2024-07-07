<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Sản phẩm yêu thích</title>

    <link rel="icon" type="image/x-icon" href="../img/logo.jpg">
    <link rel="stylesheet" href="../assets/css/index.css">
    <link rel="stylesheet" href="../assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        .table th, .table td {
            text-align: center;
        }
        .table img {
            max-width: 100px; 
        }
    </style>
</head>

<body>
<?php
        include('../page/includes/header.php');
    ?> <br> <br> <br> <br> <br> 

    <div class="container">
        <h2 class="my-4">Danh sách sản phẩm yêu thích</h2>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
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
                          
                            include('C:/xampp/htdocs/t3/admincp/config/config.php');

                        
                            $query = "SELECT yt.id_yt, a.image_url_1, nt.ten
                            FROM yeuthich1 yt
                            JOIN nhatro nt ON yt.ma_tro = nt.ma_tro
                            JOIN nhatro_anh a ON nt.ma_tro = a.ma_tro";

                        
                            $result = mysqli_query($mysqli, $query);

                            if (mysqli_num_rows($result) > 0) {
                               
                                while ($row = mysqli_fetch_assoc($result)) {
                                  
                                    $id = $row['id_yt'];
                                    $image_url = $row['image_url_1'];
                                    $ten = $row['ten'];
                                    
                                 
                                    echo "<tr>";
                                    echo "<td>" . $id . "</td>";
                                    echo "<td><img src='../" . $image_url . "' alt='Ảnh'></td>";
                                    echo "<td>" . $ten . "</td>";
                                    echo "<td><a href='../includes/xoa.php?id=" . $id . "' class='btn btn-danger'>Xóa</a></td>"; 
                                }
                            } else {
                                echo "<tr><td colspan='4'>Không có dữ liệu</td></tr>";
                            }

                         
                            mysqli_close($mysqli);
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>