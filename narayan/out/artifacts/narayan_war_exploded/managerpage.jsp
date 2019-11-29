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
    String sql="select * from details;";
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <title>Admin Page</title>
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
        padding: 5px 30px 5px 30px;
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
    .shi{
        border-radius: 4px;
        background-color: #f4511e;
        border: none;
        color: #FFFFFF;
        text-align: center;
        font-size: 28px;
        padding: 12px;
        width: 11%;
        cursor: pointer;
        margin: 5px;
    }
    .shi:hover {
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
    input{
        border-radius: 4px;
        background-color: #777777;
        border: none;
        color: #FFFFFF;
        text-align: center;
        font-size: 28px;
        padding: 12px;
        width: 11%;
        cursor: pointer;
        margin: 5px;
    }
    input:hover {
        opacity: 0.7;
    }
    .ca input{
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
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

    if(session.getAttribute("username")==null){
        response.sendRedirect("login.jsp");
    }
%>
<div class="ca">
    <form action="logout" method="get">
        <input type="submit" value="Logout">
    </form>
</div>
<h2>Customer Details</h2>
<div class="ca">
    <input type="submit" value="Download PDF" name="download" onclick="window.print()" />
</div>
<div class="ca">
    <form action="ship2.jsp" method="post">
        <button class="shi" name="ship" value="" type="submit" style="margin-bottom: 20px;"></i>
            Only Shipping
        </button>
    </form>
</div>
<form action="" method="post">
    <table>
        <tr>
            <th>TokenID</th>
            <th>Name</th>
            <th>Phone No</th>
            <th>Total Price</th>
            <th>Shipping</th>
            <th>Address</th>
            <th>City</th>
            <th>Pincode</th>
            <th>Purchase Time</th>
        </tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getString("phone")%></td>
            <td><%=rs.getInt("price")%></td>
            <td><%=rs.getString("shipping")%></td>
            <td><%=rs.getString("address")%></td>
            <td><%=rs.getString("city")%></td>
            <td><%=rs.getString("pincode")%></td>
            <td><%=rs.getString("pur_time")%></td>
        </tr
    </table>
    <% }
        rs.close();
        stmt.close();
        conn.close();
    %>

</form>
</body>
</html>
