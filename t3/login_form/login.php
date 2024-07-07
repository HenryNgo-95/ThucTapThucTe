<?php
include "../connect.php";
session_start();
// xử lý đăng nhập
if (isset($_POST['dangnhap'])) {
    $username = $_POST['name'];
    $password = $_POST['password'];

    // Truy vấn sử dụng prepared statement
    $stmt = $conn->prepare("SELECT * FROM users WHERE user_name=?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();

        // Kiểm tra mật khẩu bằng cách sử dụng password_verify
        if (password_verify($password, $row['pass'])) {
            echo "password_verify result: " . var_dump(password_verify($password, $row['pass'])) . "<br>";

            $_SESSION['id'] = $row['id'];
            $_SESSION['user_name'] = $row['user_name'];
            if ($row['gp'] == 1) {
                // Chuyển hướng tới trang admin
                header("location: ../nhatro/admin/index.php");
            } else {
                // Chuyển hướng tới trang người dùng thông thường
                header("location: ../index.php");
            }
            exit();
        } else {
            echo "<script>alert('Tài khoản hoặc mật khẩu không đúng.');
            window.location.href = 'login.php';</script>";
        }
    } else {
        echo "<script>alert('Tài khoản hoặc mật khẩu không đúng.');
        window.location.href = 'login.php';</script>";
    }
    $stmt->close();
}

// xử lý đăng ký
if (isset($_POST['btn'])) {
    $username = $_POST['name'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $confirm_password = $_POST['confirm-password'];

    // Kiểm tra mật khẩu phải dài hơn 8 ký tự
    if (strlen($password) < 8) {
        echo "<script>alert('Mật khẩu phải dài hơn 8 ký tự.');
        window.location.href = 'login.php';</script>";
        exit(); // Ngừng xử lý tiếp tục nếu mật khẩu không hợp lệ
    }

    // Kiểm tra xem tên người dùng đã tồn tại trong cơ sở dữ liệu chưa
    $stmt_check_user = $conn->prepare("SELECT * FROM users WHERE user_name=?");
    $stmt_check_user->bind_param("s", $username);
    $stmt_check_user->execute();
    $result_check_user = $stmt_check_user->get_result();

    if ($result_check_user->num_rows > 0) {
        echo "<script>alert('Tên tài khoản đã tồn tại trong hệ thống. Vui lòng chọn tên khác.');
        window.location.href = 'login.php';</script>";
        exit(); // Ngừng xử lý nếu tên người dùng đã tồn tại
    }

    if ($password !== $confirm_password) {
        echo "<script>alert('Mật khẩu và xác nhận mật khẩu không khớp.');
        window.location.href = 'login.php';</script>";
    } else {
        $group = 2; // nhóm người dùng thông thường

        // Thêm mật khẩu đã mã hóa vào cơ sở dữ liệu
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Sử dụng prepared statement để ngăn chặn tấn công SQL injection
        $stmt = $conn->prepare("INSERT INTO users (user_name, pass, gp, email) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssis", $username, $hashed_password, $group, $email);

        if ($stmt->execute()) {
            // Lấy ID người dùng vừa đăng ký
            $user_id = $stmt->insert_id;

            // Thiết lập session cho người dùng mới đăng ký
            $_SESSION['id'] = $user_id;
            $_SESSION['user_name'] = $username;

            echo "<script>
                alert('Đăng ký thành công');
                window.location.href = '../index.php';
            </script>";
        } else {
            echo "<script>alert('Đăng ký thất bại');</script>";
        }

        $stmt->close();
    }
}
?>

<!DOCTYPE HTML>
<html>

<head>
    <title>Login and Registration Form</title>
    <!-- <script src="js/jquery.min.js"></script> -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Login and Registration form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
</head>

<body>
    <div class="header">
        <div class="header-main">
            <h1>Welcome</h1>
            <div class="header-bottom">
                <div class="form-container">
                    <div id="login-form" class="form-content">
                        <h2>Login</h2>
                        <form action="#" method="post">
                            <input type="text" placeholder="User name" name="name" required />
                            <input type="password" placeholder="Password" name="password" required />
                            <div class="remember">
                                <span class="checkbox1">
                                    <label class="checkbox"><input type="checkbox" name="" checked=""><i> </i>Remember
                                        me</label>
                                </span>
                                <div class="forgot">
                                    <h6><a href="#">Forgot Password?</a></h6>
                                </div>
                                <div class="clear"> </div>
                            </div>
                            <button type="submit" name="dangnhap">Login</button>
                            <button type="button" id="show-register">Register</button>
                        </form>
                    </div>

                    <div id="register-form" class="form-content">
                        <h2>Register</h2>
                        <form action="#" method="post">
                            <input type="text" placeholder="User name" name="name" required />
                            <input type="email" placeholder="Email" name="email" required />
                            <input type="password" placeholder="Password" name="password" required />
                            <input type="password" placeholder="Confirm Password" name="confirm-password" required />
                            <button type="submit" name="btn">Register</button>
                            <button type="button" id="show-login">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Kiểm tra query parameter để xác định phần hiển thị ban đầu
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const isRegister = urlParams.get('register') === 'true';
            if (isRegister) {
                document.getElementById('login-form').style.display = 'none';
                document.getElementById('register-form').style.display = 'block';
            } else {
                document.getElementById('login-form').style.display = 'block';
                document.getElementById('register-form').style.display = 'none';
            }
        };


        document.getElementById('show-register').addEventListener('click', function() {
            document.getElementById('login-form').style.display = 'none';
            document.getElementById('register-form').style.display = 'block';
        });

        document.getElementById('show-login').addEventListener('click', function() {
            document.getElementById('register-form').style.display = 'none';
            document.getElementById('login-form').style.display = 'block';
        });
    </script>
</body>

</html>
