<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 21-11-2019
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpServletResponse res=null;
    Connection conn=null;
    Statement stmt=null;
    conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
    stmt= conn.createStatement();
    String sql="select * from shipping;";
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
    <title>Only Shipping</title>
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
        padding: 5px 40px 5px 40px;
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
<h2>Shipping Details of Customers</h2>
<div class="ca">
    <input type="submit" value="Download PDF" name="download" onclick="window.print()" />
</div>
<form action="" method="post">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone No</th>
            <th>Pincode</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
        </tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td><%=rs.getInt("idshipping")%></td>
            <td><%=rs.getString("fullname")%></td>
            <td><%=rs.getString("mobile")%></td>
            <td><%=rs.getString("pincode")%></td>
            <td><%=rs.getString("address")%></td>
            <td><%=rs.getString("city")%></td>
            <td><%=rs.getString("state")%></td>
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
