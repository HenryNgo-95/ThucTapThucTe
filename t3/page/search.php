<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="../img/logo.jpg">
  <title>Website cho thuê trọ</title>
  <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/index.css">
  <link rel="stylesheet" href="../assets/css/style.css" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body style="background-color: #faffff;"> <br>
  <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #e3f2fd">
  <?php
        include('includes/header.php');
    ?> 
  </nav>
  <?php
        include('includes/search_bar.php');
    ?>
  
  <div class="container"> 
      <img style="width: 150px; height: 200px;" src="../img/dungtim.com.gif" alt="Hình ảnh cố định" class="fixed-image-left">
  <div class="container my-5">
  <div class="container">
          <h4 id="topsale_header" class="font-rubik font-size-20 d-flex justify-content-center mt-5">
            Danh sách nhà trọ
          </h4> </div> <hr/>
        <ul class="list-unstyled" style="display: flex; flex-wrap: wrap;">
          <?php
				    $conn = mysqli_connect("localhost", "root", "", "nha_tro");
            $thanhphoID = $_POST['tinh_thanh'];
            $gia = $_POST['gia'];
            $gia = $gia * 1000000;
            if ($gia >= 10) $gia -=1;
            $gia_min = $gia - 2000000;
            if ($gia_min < 0) $gia_min == 0;
            if ($gia >= 8000000){
              $gia_min = 7000000 - 1;
              $gia = 99000000;
            }
            $dientich = $_POST['dien_tich'];
            $dt_min = $dientich - 30;
            if ($dt_min < 0) $gia_min == 0;
            if ($dientich >= 85){
              $dt_min = 80;
              $dientich = 990;
            }
            $loai_nt = $_POST['loai_nt'];
            // print_r($_POST);
            //Tạo câu truy vấn sql
            $sql = "SELECT * FROM nhatro WHERE 1";
            if ($thanhphoID != '0') {
              $sql .= " AND thanhpho = $thanhphoID";
            }
            if ($gia != '0') {
              $sql .= " AND gia <= $gia AND gia >= $gia_min";
            }
            if ($dientich != '0') {
              $sql .= " AND dientich <= $dientich AND dientich >= $dt_min";
            }
            if ($loai_nt != '0') {
              $sql .= " AND Loai_nhatro = $loai_nt";
            }
            $result = mysqli_query($conn, $sql);


            while ($row = mysqli_fetch_assoc($result)) {
                $isLiked = false;
                $isRent = false;
                if (isset($_SESSION['TK_ID']) && $_SESSION['TK_ID'] !== 0) {
                $nt_id = $row['ma_tro'];
                $tk_id = $_SESSION['TK_ID'];
                $sqlLiked = "SELECT * FROM yeuthich WHERE ma_tro = $nt_id AND user_id = $tk_id AND is_fav = 1";
                $resultLiked = mysqli_query($conn, $sqlLiked);
                $sqlLiked2 = "SELECT * FROM yeuthich WHERE ma_tro = $nt_id AND user_id = $tk_id AND is_fav = 0";
                $resultLiked2 = mysqli_query($conn, $sqlLiked2);

                if (mysqli_num_rows($resultLiked) > 0) {
                    $isLiked = true;   
               }
                if (mysqli_num_rows($resultLiked2) <= 0) {
                  $sqlInsert = "INSERT INTO yeuthich (ma_tro, user_id, is_fav)
                        SELECT $nt_id, $tk_id, 0
                        WHERE NOT EXISTS (
                            SELECT *
                            FROM yeuthich
                            WHERE ma_tro = $nt_id AND user_id = $tk_id ); ";
                  mysqli_query($conn, $sqlInsert);
               } }
          ?>
          <li class="card" style="display: inline-block; width: 31%;">
                    <div class="card-header" >
                    <a href="page/product.php ?NT_ID=<?php echo $row['ma_tro']; ?>"> 
                      <img style="width: 500px; height: 500px;"
                          src=" <?php
                            $tro_id = $row['ma_tro'];
                            $sql3 = "SELECT * FROM nhatro_anh WHERE ma_tro = $tro_id";
                            $result3 = mysqli_query($conn, $sql3);
                            while ($row3 = mysqli_fetch_assoc($result3)){
                              $imagePath1 = "../" .$row3["image_url_1"];
                              // $imagePath2 = $row3["image_url_2"];
                              // $imagePath3 = $row3["image_url_3"];
                              echo $imagePath1;
                            }
                              ?>" alt="<?php echo $row['ma_tro']; ?>">
                    </a> 
                        <h5 style="width: 240px; height: 70px;">
                          <?php                    
                            $ten_tro = $row['Ten'];
                            $limit = '60';
                            $ten_tro_limit = mb_substr($ten_tro, 0, $limit);
                            if (strlen($ten_tro) > $limit) {
                              $ten_tro_limit .= "...";
                            }                            
                            echo $ten_tro_limit;
                          ?>    </h5>
                        
                    </div>
                    <?php
                      $loai_nt = $row['Loai_nhatro'];
                      $sql2 = "SELECT * FROM loai_nhatro WHERE Loai_nhatro = '$loai_nt'";
                      $result2 = mysqli_query($conn, $sql2);
                      while ($row2 = mysqli_fetch_assoc($result2))
                        $ten_nt = $row2['Ten_nhatro'];
                    ?>
                    <?php
                      $chu_id = $row['chu_id'];
                      $sql6 = "SELECT * FROM information WHERE user_id = '$chu_id'";
                      $result6 = mysqli_query($conn, $sql6);
                      while ($row6 = mysqli_fetch_assoc($result6))
                          $ten_chu = $row6['full_name'];
                    ?>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><i class="fa-solid fa-house" style="width: 20px;"></i> <?php echo $ten_nt; ?></li>
                            <li><i class="fa-solid fa-map-marker-alt" style="width: 20px;"></i> <?php echo $row['Diachi']; ?></li>
                            <li><i class="fa-solid fa-money-bill-alt" style="width: 20px;"></i> <?php echo number_format($row['gia']); ?> VNĐ</li>
                            <li><i class="fa-solid fa-ruler-combined" style="width: 20px;"></i> <?php echo $row['dientich']; ?> m²</li>
                            <li><i class="fa-solid fa-user" style="width: 20px;"></i> <?php echo $ten_chu; ?></li>
                            <li><i class="fa-solid fa-door-closed" style="width: 25px;"></i>Phòng ngủ: <?php echo $row['sophongngu']; ?></li>
                            <li><i class="fa-solid fa-bath" style="width: 25px;"></i>Phòng tắm: <?php echo $row['sophongtam']; ?></li>
                        </ul>                   
                    </div>
                        <p style="display: flex; justify-content: flex-start;" >
                            <?php echo"--" .$row['mieuta']; ?> </p>
    
                </li>
                <?php } ?>
            </ul> 	
    </div>
  </div>

    <?php
        include('includes/bonus.php');
    ?>
    <?php
        include('includes/footer.php');
    ?>

    <script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../assets/js/main.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>

</body>
</html>
