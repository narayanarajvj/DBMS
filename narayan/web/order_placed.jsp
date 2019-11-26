<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Placed</title>
</head>
<style>
    .in{
        text-align: center;
        font-size: 40px;
        font-family: 'Old Standard TT', serif;
        color: white;
        line-height: 60px;
    }
    body{
        background-color: blue;
    }
    .um{
        font-size: 25px;
        margin-top:10px;
        color: white;
        text-align: center;
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
</style>
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<form action="order_placed" method="post">
<p class="in"> <br>Thank You!<br>
 Visit Again.. </p>
<p class="um">Please note the Token number for payment reference.<br> Soon you will receive your order.</p>
    <%
        Connection conn=null;
        conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
        Statement st = conn.createStatement();
        String sql1 = "SELECT * FROM details;";
        ResultSet rs=st.executeQuery(sql1);
        String token=null;
        rs.last();
        token = rs.getString(1);
    %>
    <p class="tot">TOKEN NUMBER: <%=Integer.parseInt(token)%></p>
<% response.setHeader("Refresh", " 5; url=index.jsp");
st.close();
conn.close();%>
</form>
</body>
</html>
