<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Out</title>
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
    /*button{*/
    /*    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);*/
    /*    float: right;*/
    /*    margin-right: 5px;*/
    /*    margin-top: 5px;*/
    /*    border-radius: 4px;*/
    /*    background-color: #f4511e;*/
    /*    border: none;*/
    /*    color: #FFFFFF;*/
    /*    text-align: center;*/
    /*    font-size: 15px;*/
    /*    padding: 12px;*/
    /*    width: 120px;*/
    /*    cursor: pointer;*/
    /*    margin: 5px;*/
    /*}*/
    /*button:hover {*/
    /*    opacity: 0.7;*/
    /*}*/
</style>
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%--<form action="index.jsp" method="post">--%>
<%--    <button name="shop" value="" type="submit">--%>
<%--        Go to Home--%>
<%--    </button>--%>
<%--</form>--%>
<form action="checkout" method="post">
    <p class="in"> <br>Thank You!<br>
        Visit Again.. </p>
    <p class="um">Please note the Token number for payment reference and receive your order at the counter.</p>
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

