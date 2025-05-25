﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BulkSMSWebApp.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Bulk SMS</title>
  <style>
    html, body {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;
        background-image: url('Content/bk.jpg'); /* Make sure bk.jpg exists */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .login-box {
        width: 320px;
        position: absolute;
        top: 20%;
        right: 60px;
        padding: 20px;
        background: rgba(255, 255, 255, 0.92);
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    .login-box h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .login-box label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }

    .login-box input[type="text"],
    .login-box input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .login-box input[type="submit"],
    .login-box input[type="button"],
    .login-box button {
        width: 100%;
        padding: 10px;
        margin-top: 15px;
        background: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: background 0.3s;
    }

    .login-box input[type="submit"]:hover,
    .login-box input[type="button"]:hover,
    .login-box button:hover {
        background: #45a049;
    }

    .login-box .error {
        color: red;
        margin-top: 10px;
        text-align: center;
    }

    /*.captcha-img {
        margin-top: 10px;
        display: block;
        border: 1px solid #ccc;
        border-radius: 4px;
    }*/

    .captcha-img {
    margin-top: 10px;
    display: block;
    width: 50%;              /* Makes it responsive to login-box width */
    max-width: 150px;         /* Adjust max size */
    height: 40px;             /* Set desired height */
    object-fit: cover;
    border: 1px solid #ccc;
    border-radius: 4px;
}


    .refresh-captcha {
        font-size: 13px;
        margin-top: 5px;
        display: block;
        text-align: right;
    }

    .refresh-captcha a {
        color: #007BFF;
        text-decoration: none;
        cursor: pointer;
    }

    .refresh-captcha a:hover {
        text-decoration: underline;
    }
body {
    margin: 0;
    height: 100vh;
    font-family: Arial, sans-serif;
    background-image: url('Content/bk.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: flex;
    align-items: center; /* vertical center */
    justify-content: flex-start; /* shift content to the left */
    padding-left: 5%; /* adjust horizontal spacing */
}

.left-text {
    color: white;
    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.6);
}

.left-text h1 {
    font-size: 60px;
    margin: 0;
    font-weight: bold;
}

.left-text p {
    font-size: 24px;
    margin-top: 20px;
}



</style>

</head>
<body>
    <form id="form1" runat="server">
         <!-- Left Side Welcome Text -->
         <div class="left-text">
            <h1>Welcome to</h1>
            <h1>Bulk SMS Portal</h1>
            <p>Login to send your updates instantly.</p>
        </div>
        
        <div class="login-box">
            <h2>Employee Login</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="error" />

            <label>Employee ID:</label>
            <asp:TextBox ID="txtEmployeeId" runat="server" />

            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

            <label>Enter CAPTCHA:</label>
            <img src="Captcha.aspx" alt="Captcha" class="captcha-img" id="captchaImage" />
            <span class="refresh-captcha"><a onclick="document.getElementById('captchaImage').src = 'CaptchaImage.aspx?' + Math.random();">🔁 Refresh Captcha</a></span>
            <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Enter text from image" />

            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>