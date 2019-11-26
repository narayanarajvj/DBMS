<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 19-11-2019
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <title>Customer Checkout Details</title>
</head>
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
    .tot{
        margin-bottom: auto;
        font-size: 35px;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        margin-bottom: 20px;
        margin-top: 20px;
        clip-path: rect(100% 0, 100% 0, 100% 100%,0 100%);
        background-color: gray;
        text-align: center;
        color: azure;
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
    .um{
        font-size: 20px;
        margin-top:3px;
        color: coral;
        text-align: center;
    }
</style>
<body class="bi">
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<h2 style="font-family: 'Book Antiqua'; color: goldenrod; font-size: 30px; margin-top: 20px; margin-left: 10px;">Enter your Details:</h2>

<div class="div1">
    <div class="inner-div">
        <form action="det" method="post">
            <label><b>Full Name *</b></label>
            <input type="text" name="fullname" value="" size="50" maxlength="50" required><br><br>
            <label><b>Mobile Number *</b></label>
            <input type="text" name="mobile" value="" size="30" maxlength="15" required><br><br>
    </div>
            <p class="um">Please make sure that the details you have provided are correct.<br>No further changes can be made after you Submit.</p>
            <input type="hidden" name="de" value="5">
            <input class="submit"  type="submit" style="font-family: 'Old Standard TT', serif;color: rgb(202, 198, 198); background-color: rgba(6, 6, 122, 0.616); font-size: 18px;">
        </form>

        <%
            Connection conn=null;
            conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
            CallableStatement cst = conn.prepareCall("{CALL totalprice ()}");
            ResultSet rs1 = cst.executeQuery();
            String total=null;
            while(rs1.next()){
                total=rs1.getString(1);
            }
        %>
        <p class="tot">Total Price: <i class="fa fa-inr" aria-hidden="true"></i><%=Integer.parseInt(total)%></p>
        <p style="color: red; padding-right:15px; text-align: right;">* required field.</p>

</div>
<%
    rs1.close();
    cst.close();
    conn.close();
%>
</body>
</html>
