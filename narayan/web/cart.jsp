<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12-11-2019
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpServletResponse res=null;
    Connection conn=null;
    Statement stmt=null;
    conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
    stmt= conn.createStatement();
    String sql="select * from cart;";
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <title>Cart</title>
</head>
<style>
    h2 {
        text-align: center;
        font-size: 50px;
        color: black;
        font-family: "Bookman Old Style";
    }
    body {
        background-color: peachpuff;
    }
    th {
        font-weight: bold;
        height: 65px;
        color: black;
        font-family: "Book Antiqua";
        font-size: 25px;
        clip-path: rect(100% 0, 100% 0, 100% 100%,0 100%);
        background-color: honeydew;
    }
    table {
        border-collapse: separate;
        width: 75%;
        position: relative;
    }
    td {
        height: 50px;
        color: chocolate;
        font-size: 20px;
        text-align: center;
    }
    tr:hover {background-color:#f5f5f5;}
    .shop{
        margin-bottom: auto;
        margin-left: 8%;
    }
    .out{
        margin-bottom: auto;
    }
    .click{
        text-decoration: underline;
        color: blue;
    }
    .cl{
        margin-left: 0px;
        font-size: 18px;
    }
    .tot{
        margin-bottom: auto;
        font-size: 35px;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        margin-bottom: 50px;
        clip-path: rect(100% 0, 100% 0, 100% 100%,0 100%);
        background-color: gray;
        text-align: center;
        color: azure;
    }
    .bloc{
        text-align: right;
        bottom: auto;
        left: 1200px;
        position: absolute;
        vertical-align: bottom;
        margin-right: 5px;
    }
    button{
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);
        border-radius: 4px;
        background-color: #f4511e;
        border: none;
        color: #FFFFFF;
        text-align: center;
        font-size: 15px;
        padding: 12px;
        width: 120px;
        cursor: pointer;
        margin: 5px;
    }
    button:hover {
        opacity: 0.7;
    }
</style>
<body>
<h2>Cart</h2>
<form action="cart" method="post">
    <table>
        <tr>
            <th>PID</th>
            <th>Product Name</th>
            <th>Price</th>
        </tr>
        <%
            while(rs.next()){
//                if(!rs.next()){
//                    break;
//                }
        %>
        <tr>
            <td><%=rs.getInt("pid")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getInt("price")%></td>
            <%--        <td><form action="delete" method="post">--%>
            <%--            <button name="delete"  type="button" value="<%= rs.getString("pid")%>" >Remove</button>--%>
            <%--        </form></td>--%>
            <td><a href="delete.jsp?id=<%=rs.getString("id") %>">
                <button name="button" type="button" class="delete"><i class="fa fa-times" aria-hidden="true"></i> Remove</button></a></td>
        </tr
    </table>
    <% }
//            Statement st=conn.createStatement();
//            String str1 = "SELECT SUM(price) FROM cart";
//            ResultSet rs1 = st.executeQuery(str1);
        CallableStatement cst = conn.prepareCall("{CALL totalprice ()}");
        ResultSet rs1 = cst.executeQuery();
        String total=null;
        while(rs1.next()){
            total=rs1.getString(1);
        }
        rs.close();
        rs1.close();
        stmt.close();
        cst.close();
        conn.close();
    %>
</form>
<div class="bloc">
    <%if(total!=null){%>
    <p class="tot">Total Price: <i class="fa fa-inr" aria-hidden="true" aria-setsize="4"></i><%=Integer.parseInt(total)%></p>
    <% }%>
    <form action="index.jsp" method="post">
        <button class="shop" name="shop" value="" type="submit" style="margin-left: 190px"><i class="fa fa-shopping-bag" aria-hidden="true"></i>
            Continue Shopping
        </button>
    </form>
    <%if(total!=null){%>
    <form action="details.jsp" method="post">
        <button class="out" name="out" value="" type="submit"><i class="fa fa-check" aria-hidden="true"></i>
            Check Out
        </button>
    </form>
    <p class="cl">If you require Shipping, Please <a href="shipping.jsp" class="click">  Click here</a></p>
    <% }%>
</div>
</body>
</html>