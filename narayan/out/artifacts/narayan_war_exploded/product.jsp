<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11-11-2019
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <title>Electronics</title>
</head>
<style>
    /*table{*/
    /*    border-collapse: separate;*/
    /*    border-spacing: 100px 0;*/
    /*}*/
    /*td {*/
    /*    width:150px;*/
    /*    text-align:center;*/
    /*    padding:5px;*/
    /*    height: 5px;*/

    /*}*/
    /*p{*/
    /*    font-family: 'Megrim', cursive;*/
    /*    size:13px;*/
    /*    color:black;*/
    /*}*/
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
        background-color: lightpink;
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
    /*.card p::first-letter{*/
    /*    text-transform: uppercase;*/
    /*}*/
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
    /*.ca a:hover{*/
    /*    color: coral;*/
    /*}*/
    body{
        background-image: url("prodback.jpg");
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
<%--    <a href="cart.jsp"  style="margin-right: 20px"><i class="fa fa-shopping-cart"></i> Cart</a>--%>
    </div>
    <h1 style="text-align:center; font-family: 'Book Antiqua' ; font-size: 40px;">Electronics Products</h1>
<%--    <table>--%>
<%--        <tr>--%>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM electronics NATURAL JOIN item");

                while(rs.next())
                {

            %>

<%--            <td>--%>
    <div class="card">
        <h2><%=rs.getString("name")%></h2>
        <p class="price"><i class="fa fa-inr" aria-hidden="true"></i> <%=rs.getInt("price")%></p>
        <p style="font-size: 20px;" color="blue">Color: <%=rs.getString("color")%></p>
        <p style="font-size: 20px;"><b>by <%=rs.getString("com_name")%></b></p>
        <form action="cart" method="post">
            <input type="hidden" name="ele" value="5">
            <button name="pid" value="<%= rs.getString("pid")%>" type="submit">
                Add to cart
            </button>
        </form>
    </div>
<%--            </td>--%>
            <%
                }
                rs.close();
                st.close();
                con.close();
            %>
<%--        </tr>--%>
<%--    </table>--%>
</body>
</html>
