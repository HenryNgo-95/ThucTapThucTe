<div class="clear"></div>
<div class="main.php">
<?php
    if(isset($_GET['action'])){
        $tam = $_GET['action'];
        echo "Tham số action: $tam"; // Dòng kiểm tra
    }else
    {
        $tam = '';
        echo "Không có tham số action"; // Dòng kiểm tra
    }
    if ($tam=='quanlyloainhatro'){
        include("modules/them.php");
    }
    else{
        include("modules/dashboard.php");
    }
    ?>
</div>
