<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id=request.getParameter("id");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
        Statement st=conn.createStatement();
        String sql="DELETE FROM cart WHERE id="+id;
        int i=st.executeUpdate(sql);
//        out.println("Data Deleted Successfully!");
        response.sendRedirect("cart.jsp");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>