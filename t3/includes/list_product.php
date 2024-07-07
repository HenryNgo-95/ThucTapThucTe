<ul class="list-unstyled" style="display: flex; flex-wrap: wrap;">
    <?php
    $from = $page * 9 - 9;
    $sql = "SELECT * FROM nhatro ORDER BY ma_tro DESC LIMIT $from, 9;";
    $result = mysqli_query($conn, $sql); 
    $isRent = false;

    // Duyệt qua từng nhà trọ 
    while ($row = mysqli_fetch_assoc($result)) {
        $isLiked = false;
        if (isset($_SESSION['id']) && $_SESSION['id'] !== 0) {
            $nt_id = $row['ma_tro'];
            $tk_id = $_SESSION['id'];
        }
    ?>
        <li class="card" style="display: inline-block; width: 31%; margin: 1%; height: 550px;">
            <div class="card-header" style="height: 270px;">
                <a href="page/product.php?NT_ID=<?php echo $row['ma_tro']; ?>"> 
                    <img style="width: 100%; height: 100%; object-fit: cover;"
                        src="<?php
                            $tro_id = $row['ma_tro'];
                            $sql3 = "SELECT * FROM nhatro_anh WHERE ma_tro = $tro_id";
                            $result3 = mysqli_query($conn, $sql3);
                            while ($row3 = mysqli_fetch_assoc($result3)){
                                $imagePath1 = $row3["image_url_1"];
                                echo $imagePath1;
                            }
                        ?>" alt="<?php echo $row['ma_tro']; ?>">
                </a> 
                <h5>
                    <?php                    
                        $ten_tro = $row['Ten'];
                        $limit = 60;
                        $ten_tro_limit = mb_substr($ten_tro, 0, $limit);
                        if (strlen($ten_tro) > $limit) {
                            $ten_tro_limit .= "...";
                        }                            
                        echo $ten_tro_limit;
                    ?>
                </h5>
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

            <div class="card-body" style="height: 200px; overflow: hidden;">
                <ul class="list-unstyled">
                    <li><i class="fa-solid fa-house" style="width: 20px;"></i> <?php echo $ten_nt; ?></li>
                    <li><i class="fa-solid fa-map-marker-alt" style="width: 20px;"></i> <?php echo $row['Diachi']; ?></li>
                    <li><i class="fa-solid fa-money-bill-alt" style="width: 20px;"></i> <?php echo number_format($row['gia']); ?> VNĐ</li>
                    <li><i class="fa-solid fa-ruler-combined" style="width: 20px;"></i> <?php echo $row['dientich']; ?> m²</li>
                    <li><i class="fa-solid fa-user" style="width: 20px;"></i> <?php echo $ten_chu; ?></li>
                    <li><i class="fa-solid fa-door-closed" style="width: 25px;"></i> Phòng ngủ: <?php echo $row['sophongngu']; ?></li>
                    <li><i class="fa-solid fa-bath" style="width: 25px;"></i> Phòng tắm: <?php echo $row['sophongtam']; ?></li>
                </ul>
                <p><?php echo "--" . $row['mieuta']; ?></p>
            </div>

            <div class="card-footer" style="text-align: right; height: 80px; display: flex; align-items: center;">
                <button onclick="yeuthich(<?php echo $row['ma_tro'] ?>)" class="btn btn-danger" style="width: 100%;">Yêu thích</button>
            </div>
        </li>
    <?php } ?>
</ul>
