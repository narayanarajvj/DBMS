<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 17-11-2019
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <title>Home Appliances</title>
</head>
<style>
    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        max-width: 300px;
        margin-right:20px;
        margin-top: 2%;
        height: auto;
        width:50%;
        text-align: center;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        position: relative;
        float: left;
        margin-left: 50px;
        background-color: lightgreen;
    }
    .card h2{
        text-transform: uppercase;
        font-size: 27px;
        font-family: "Bookman Old Style";
    }
    .price {
        color: cornflowerblue;
        font-size: 22px;
    }
    .card button {
        border: none;
        outline: 0;
        padding: 12px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
        font-size: 18px;
    }
    .card button:hover {
        opacity: 0.7;
    }
    .ca button {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);
        font-size: 20px;
        float: right;
        margin-top: 5px;
        margin-right: 5px;
    }
    body{
        background-image: url("homeback.jpg");
        height: 100%;
        background-position: center;
        background-size: cover;
    }
    .cart{
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
</style>
<body>
<%!
    Connection con=null;
%>
<div class="ca">
    <form action="cart.jsp" method="post">
        <button class="cart" name="pid" value="" type="submit"><i class="fa fa-shopping-cart"></i>
            Cart
        </button>
    </form>
</div>
<h1 style="text-align:center; font-family: 'Book Antiqua' ; font-size: 40px;">Home Appliances</h1>

<%
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM home NATURAL JOIN item");

    while(rs.next())
    {

%>

<div class="card">
    <h2><%=rs.getString("name")%></h2>
    <p class="price"><i class="fa fa-inr" aria-hidden="true"></i> <%=rs.getInt("price")%></p>
    <p style="font-size: 20px;" color="blue">Color: <%=rs.getString("color")%></p>
    <p style="font-size: 20px;"><b>by <%=rs.getString("com_name")%></b></p>
    <form action="cart" method="post">
        <input type="hidden" name="ele" value="10">
        <button name="pid" value="<%= rs.getString("pid")%>" type="submit">
            Add to cart
        </button>
    </form>
</div>
<%
    }
    rs.close();
    st.close();
    con.close();
%>
</body>
</html>
