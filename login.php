<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h2>Login</h2>
    <form method="post" action="login.php">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <button type="submit" name="login">Login</button>
        </div>
    </form>
</body>
</html>

<?php
session_start();

// 检查用户是否提交了登录表单
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // 定义预设的用户名和密码
    $preset_username = "dami";
    $preset_password = "123456";

    // 获取用户输入的用户名和密码
    $input_username = $_POST["username"];
    $input_password = $_POST["password"];

    // 检查用户名和密码是否正确
    if ($input_username === $preset_username && $input_password === $preset_password) {
        // 登录成功，设置会话变量并跳转到受保护的页面
        $_SESSION['username'] = $input_username;
        header("Location: protected_page.php");
        exit();
    } else {
        // 登录失败，显示错误消息
        echo "<p>Invalid username or password. Please try again.</p>";
    }
}
?>

