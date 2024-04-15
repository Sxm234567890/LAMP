<?php
session_start();

// 检查用户是否已经登录，如果没有，则重定向到登录页面
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

// 获取当前登录的用户名
$username = $_SESSION['username'];
?>

<!DOCTYPE html>
<html>
<head>
    <title>Protected Page</title>
</head>
<body>
    <h2>Welcome, <?php echo $username; ?>!</h2>
    <p>This is a protected page. Only logged-in users can see this content.</p>
    <p><a href="logout.php">Logout</a></p>
</body>
</html>

