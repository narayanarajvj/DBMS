<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Display</title>
    <style>
        table#nat{
            width: 50%;
            background-color: #c48ec5;
        }
    </style>
</head>
<body>
<%
    String fullname = request.getParameter("fullname");
    String mobile = request.getParameter("mobile");
    String pincode = request.getParameter("pincode");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
%>
<table id ="nat">
    <tr>
        <td>Full Name</td>
        <td><%= fullname %></td>
    </tr>
    <tr>
        <td>Mobile</td>
        <td><%= mobile %></td>
    </tr>
    <tr>
        <td>Pincode</td>
        <td><%= pincode %></td>
    </tr>
    <tr>
        <td>Address</td>
        <td><%= address %></td>
    </tr>
    <tr>
        <td>City</td>
        <td><%= city %></td>
    </tr>
    <tr>
        <td>State</td>
        <td><%= state %></td>
    </tr>
</table>
<br>
THANK YOU!!!
</body>
</html>