<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admincp</title>
    <link rel="stylesheet" type="text/css" href="css/styleadmincp.css">
    <link rel="stylesheet" href="/admincp/css/icon/fontawesome-free-6.2.1-web/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

    <style>
        body {
            font-size: 0.9em;
            margin: 0;
            padding: 0;
        }

        .owl-carousel .owl-item img {
            width: 65%;
        }

        i {
            cursor: pointer;
        }

        ul {
            list-style-type: none;
        }

        /* Profile edit */
        .menu-drop ul li {
            font-size: 12px;
            padding: 5px;
        }

        .menu-drop ul li i {
            padding-right: 15px;
        }

        .menu-drop ul li:hover {
            cursor: pointer;
            background-color: rgb(56, 44, 29);
        }

        .liactive {
            background-color: rgb(74, 65, 53);
        }
    </style>
</head>
<body>
    <h3 class="title-admin"> Welcome admin</h3>
    <div class="wrapper"> 
    <?php
        // include("modules/header.php");
        // include("modules/menu.php");
        include("modules/main.php");
        // include("modules/footer.php");
     ?>
    </div>

    
    <script>
        // Dữ liệu mẫu
        var data = [
            { label: "Căn hộ", value: 5 },
            { label: "KTX", value: 10 },
            { label: "Cao cấp", value: 6 },
            { label: "Công nhân", value: 14 },
            { label: "Dài hạn", value: 15 },
            { label: "Gia đình", value: 10 },
            { label: "Sinh Viên", value: 30 },
            { label: "Ngắn Hạn", value: 10 }
        ];

        // Vẽ biểu đồ donut bằng Morris.js
        new Morris.Donut({
            element: 'chart_1',
            data: data,
            colors: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
            formatter: function (y) { return y + "%" }, // Định dạng giá trị hiển thị
            resize: true
        });
    </script>

<script>
        var char; // Biến global để lưu đối tượng biểu đồ

        $(document).ready(function() {
            char = new Morris.Area({
                element: 'chart',
                xkey: 'date',
                ykeys: ['value', 'orther', 'quatity', 'name'],
                labels: ['Số lượng', 'Số người thuê', 'Doanh thu'],
                lineColors: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
                resize: true
            });

            thongke(); // Gọi hàm thongke() để load dữ liệu ban đầu

            $('.select-date').change(function() {
                var thoigian = $(this).val();
                var text = '';

                switch (thoigian) {
                    case '7ngay':
                        text = '7 ngày qua';
                        break;
                    case '30ngay':
                        text = '30 ngày qua';
                        break;
                    case '180ngay':
                        text = '180 ngày qua';
                        break;
                    case '365ngay':
                        text = '365 ngày qua';
                        break;
                    default:
                        text = '365 ngày qua';
                        break;
                }
                $('#text-date').text(text);
                $.ajax({
                    url: "modules/thongke.php",
                    method: "POST",
                    dataType: "json",
                    data: { thoigian: thoigian },
                    success: function(data) {
                        char.setData(data);
                        $('#text-date').text(text);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching data:', error);
                    }
                });
            });

            function thongke() {
                var text = '365 ngày qua'; 
                $('#text-date').text(text); 

                $.ajax({
                    url: "modules/thongke.php", 
                    method: "POST",
                    dataType: "json",
                    success: function(data) {
         
            if (data && data.length > 0) {
               
                char.setData(data);
            } else {
               
                console.log("Không có dữ liệu trả về từ server.");
               
            }
        },
        error: function(xhr, status, error) {
            console.error('Lỗi khi lấy dữ liệu:', error);
          
        }
    });
            }
        });
    </script>
    
</body>
</html>