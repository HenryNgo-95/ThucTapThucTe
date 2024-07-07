<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./img/logo.jpg">
  <title>Website cho thuê trọ</title>
  <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/index.css">
  <link rel="stylesheet" href="assets/css/style.css" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<body style="background-color: #faffff">


  <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #e3f2fd">
  <?php
        include('includes/header.php');
    ?> 
  </nav> 
  <br> <br> <br> <br> <br>
  <?php
      include('includes/gallery_indicator.php');
    ?>
  <?php
      include('includes/search_bar.php');
    ?>
  <?php
      include('includes/fast_search.php'); 
    ?>	
  
  <div class="container">
    <div class="container my-5">

      <!-- Có thể đóng cái này -->
       <!-- <ul><li><a href="page/addyeuthich.php">yeu thich</a></li></ul> -->
       
          <div class="container">
          <h4 id="topsale_header" class="font-rubik font-size-20 d-flex justify-content-center mt-5">
            Danh sách nhà trọ
            <!-- Modal -->
             <form action="yeuthich"></form>
<div class="modal fade" id="xemnhanh" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
          </h4>
          <?php
          $conn = mysqli_connect("localhost", "root", "", "nha_tro");
          $resultCount = mysqli_query($conn, "SELECT COUNT(ma_tro) AS count FROM nhatro;");
          while ($rowCount = mysqli_fetch_assoc($resultCount)) 
              $count = $rowCount['count'];
              $max = $count/9;
              $maxPage = ceil($max);
            
              $page = isset($_GET['page']) ? intval($_GET['page']) : 1;
              $page = max(1, min($page, $maxPage));
              $prevPage = ($page > 1) ? $page - 1 : 1;
              $nextPage = ($page < $maxPage) ? $page + 1 : $maxPage;
          ?>          
</div>
    <?php
        include('includes/list_product.php');
    ?>
      </div>
      </div>


    <div class="pagination-container" style="left: 30%;">
            <ul>
              <li style="display: inline-block;"><a href="?page=<?php echo $prevPage; ?>">Previous</a></li>
              <li style="display: inline-block;"><a href="?page=1">1</a></li>
                  <?php if($maxPage >= 2){ ?>
              <li style="display: inline-block;"><a href="?page=2">2</a></li>
                  <?php if($maxPage >= 3){ ?>
              <li style="display: inline-block;"><a href="?page=3">3</a></li>
                  <?php if($maxPage >= 4){ ?>
              <li style="display: inline-block;"><a href="?page=4">4</a></li>
                  <?php if($maxPage >= 5){ ?>
              <li style="display: inline-block;"><a href="?page=5">5</a></li>
                  <?php
                    }}}}
                  ?>
              <li style="display: inline-block;"><a href="?page=<?php echo $nextPage; ?>">Next</a></li>
            </ul>
    </div> <br> <br>
    
    <?php
        include('includes/bonus.php');
    ?>
    <?php
        include('includes/footer.php');
    ?>

    <script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="./assets/js/main.js"></script>
    <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
    <script>
function yeuthich(ma_tro) {
    var user_id = <?php echo $_SESSION['id']; ?>; // Lấy user_id từ session PHP

    $.ajax({
        url: "includes/yeuthich.php",
        method: "POST",
        data: { id: user_id, ma_tro: ma_tro },
        success: function(data) {
            console.log("Response: ", data);
            if (data.trim() === "Done") {
                alert('Sản phẩm đã được thêm vào danh sách yêu thích.');
            } else if (data.trim() === "Exists") {
                alert('Sản phẩm đã có trong danh sách yêu thích.');
            } else {
                alert('Đã xảy ra lỗi: ' + data); // Hiển thị thông báo lỗi chi tiết
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("AJAX Error: ", textStatus, errorThrown);
        }
    });
}
</script>
   
</body>
</html>