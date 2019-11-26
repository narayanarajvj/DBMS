<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 21-11-2019
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .div1{
        width:50%;
        margin:auto;
        background-color: rgba(31, 83, 161, 0.548) ;
        padding-top: 3%;
        padding-bottom: 2px;
        border-radius: 10px;
        font-family: 'Old Standard TT', serif;
        color: rgb(202, 198, 198);
    }
    .inner-div{
        margin-left:6%;
    }
    label{
        display: inline-block;
        width:200px;
        padding-left:20px;
        font-size: 18px;

    }
    .submit{
        margin-left: 45%;
        padding: 10px 20px 10px 20px;
        border-radius: 10px;
        border: 1px double black;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3);
        cursor: pointer;
    }
    .bi{
        background-image: url("shippingback.jfif");
        background-size: cover;
        background-position: center;
    }
    .hm{
        border-radius: 4px;
        background-color: #f4511e;
        border: none;
        color: #FFFFFF;
        text-align: center;
        font-size: 28px;
        padding: 12px;
        width: 110px;
        cursor: pointer;
        margin: 5px;
    }
    .cart:hover {
        opacity: 0.7;
    }
    .ca button{
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);
        font-size: 20px;
        float: right;
        margin-top: 5px;
        margin-right: 5px;
        /*text-decoration: none;*/
        /*clip-path: rect(10% 0, 100% 0, 90% 100%,0 100%);*/
        /*background-color: white;*/
    }
</style>
<body class="bi">
<div class="ca">
    <form action="index.jsp" method="post">
        <button class="hm" name="home" value="" type="submit"><i class="fa fa-home" aria-hidden="true"></i>
            Home
        </button>
    </form>
    <%--    <a href="cart.jsp"  style="margin-right: 20px"><i class="fa fa-shopping-cart"></i> Cart</a>--%>
</div>

<h2 style="font-family: 'Book Antiqua'; color: goldenrod; font-size: 30px; margin-top: 20px; margin-left: 10px;">Enter your Login Details:</h2>

<div class="div1">
    <div class="inner-div">
        <form action="lo" method="post">
            <label><b>User Name *</b></label>
            <input type="text" name="username" value="" size="50" maxlength="50" required><br><br>
            <label><b>Password *</b></label>
            <input type="password" name="password" value="" size="30" maxlength="15" required><br><br>
    </div>
    <input class="submit"  type="submit" value="Login" style="font-family: 'Old Standard TT', serif;color: rgb(202, 198, 198); background-color: rgba(6, 6, 122, 0.616); font-size: 18px;">
    </form>

    <p style="color: red; padding-right:15px; text-align: right;">* required field.</p>
</div>


</body>
</html>
