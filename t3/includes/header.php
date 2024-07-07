<header>
    <nav class="navbar" style="background-color: #e3f2fd;">
      <a href="index.php" class="nav-brand">
        <img style="width: 60px; height: 60px;"
            src="img/logo.jpg"
            alt="Logo" />  
      Trang chủ</a>
      <ul class="nav-links">
          <?php
          //session_status();
          session_start();
          require_once('connect.php');
          // $_SESSION['id']=4;
          // $_SESSION['user_name']="thanhhuy";
          
          // Kiểm tra người dùng đã đăng nhập hay chưa
          if (isset($_SESSION['id']) && $_SESSION['id'] !== 0) {
            $tkId = $_SESSION['id'];
            $tenNguoiDung = $_SESSION['user_name'];
            $idNguoiDung = $_SESSION['id'];
            ?>
            <?php
              // $conn = mysqli_connect("localhost", "root", "", "nha_tro");
              $tkId = $_SESSION['id'];
              $sql4 = "SELECT * FROM users WHERE id = $tkId";
              $result4 = mysqli_query($conn, $sql4);
              if (mysqli_num_rows($result4) > 0){
            ?>
              <select name="data-dropdown" onchange="changeColor(this)">
                <?php
                  while ($row4 = mysqli_fetch_assoc($result4))
                    $khId = $tkId;
                  // Lấy dữ liệu từ bảng
                  $sqlHD = "SELECT hoadon_id, nhatro_id, trangthai FROM hoadon";
                  $sqlHD .= " WHERE user_id = $khId";
                  $resultHD = $conn->query($sqlHD);

                  // Hiển thị dữ liệu trong ô sổ xuống
                  if ($resultHD->num_rows > 0) {
                    echo "<option style='background-color: $color; height: 50%;'>Lịch sử hợp đồng</option>";
                    while ($rowHD = $resultHD->fetch_assoc()) {
                      $hdId = $rowHD["hoadon_id"];
                      $ntId = $rowHD["nhatro_id"];
                      $ttId = $rowHD["trangthai"];
                      if($ttId == 2)
                        $tt_Ten = "Xác nhận";
                      else
                        $tt_Ten = "Đang chờ";
                      $color = ($ttId == 2) ? "#7FFF00" : "#FFFF00" ;
                      ?>
                      <?php
                      echo "<option value='$hdId|$ntId|$tt_Ten' data-hdid='$hdId' style='background-color: $color;'>$hdId - $ntId - $tt_Ten</option>";
                    }
                  }
                  else echo "<option style='background-color: $color; height: 50%;'>Lịch sử hợp đồng</option>";
                ?>
              </select>
              <?php
                  }
              ?>
            <?php
          // Hiển thị các button khi đăng nhập
          $tenNguoiDung = $_SESSION['user_name'];
          $idNguoiDung = $_SESSION['id'];
          echo '<li><a href="includes/addyeuthich.php" style="color: #f15a5a; padding: 1em 1em; border: 1px solid #635454; border-radius: 90px;">';
          echo '<i class="fas fa-heart"></i> Yêu thích </a></li>';
          echo '<a href="page/info.php ?TK_ID='.$idNguoiDung;
          echo '">';  
          echo '<li style="color: #000; padding: 1em 1em; border: 1px solid #635454; ">';
          echo "<span> Xin chào, $tenNguoiDung </span>";
          echo '<br>';
          echo "<span> Mã tài khoản: $idNguoiDung </span>";
          echo '</li>';
          echo '</a>';
          echo '<li><a id="logout-btn" href="page/logout.php" style="color: #000; padding: 1em 1em; border: 1px solid #635454; border-radius: 90px;">Đăng xuất</a></li>';
        } else {
          // Hiển thị button đăng nhập và đăng ký
          echo '<li><a id="login-btn" href="/t4/t3/login_form/login.php" style="color: #000; padding: 1em 1em; border: 1px solid #635454; border-radius: 90px;">Đăng nhập</a></li>';
          echo '<li><a id="signup-btn" href="/t4/t3/login_form/login.php?register=true" style="color: #000; padding: 1em 1em; border: 1px solid #635454; border-radius: 90px;">Đăng ký</a></li>';
        }
        ?>
      </ul>
    </nav>
  </header>
  
  <script>
      function changeColor(dropdown) {
        var selectedOption = dropdown.options[dropdown.selectedIndex];
        var hdId = selectedOption.getAttribute('data-hdid');
        window.location.href = 'page/process.php?hdId=' + hdId;
      }
    </script>