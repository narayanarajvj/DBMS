import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ship")
public class Shipping extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s=null;
        s = request.getParameter("sh");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Random generator=new Random();
        int id = generator.nextInt(1000);
//        String idShipping = request.getParameter("idShipping");
        String fullname = request.getParameter("fullname");
        String mobile = request.getParameter("mobile");
        String pincode = request.getParameter("pincode");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        Connection con=null;
//        if (fullname.isEmpty() || address.isEmpty() || mobile.isEmpty() || pincode.isEmpty() || city.isEmpty() || state.isEmpty()) {
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            out.println("<font color=red>Please fill all the fields</font></bottom>");
//            rd.include(request, response);
//        } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");

                    String query1 = "insert into shipping (fullname,mobile,pincode,address,city,state) values(?,?,?,?,?,?)";

                    PreparedStatement ps = con.prepareStatement(query1);

//                ps.setInt(1, Integer.parseInt(idShipping));
                    ps.setString(1, fullname);
                    ps.setString(2, mobile);
                    ps.setString(3, pincode);
                    ps.setString(4, address);
                    ps.setString(5, city);
                    ps.setString(6, state);

                    ps.executeUpdate();
                    System.out.println("successfully inserted");

                    String query2 = "insert into details (id,name,phone,price) values(?,?,?,?);";
                    PreparedStatement ps1 = con.prepareStatement(query2);

                    CallableStatement cst = con.prepareCall("{CALL totalprice ()}");
                    ResultSet rs1 = cst.executeQuery();
                    int total = 0;
                    while(rs1.next()){
                        total=rs1.getInt(1);
                    }

                    ps1.setInt(1, id);
                    ps1.setString(2, fullname);
                    ps1.setString(3, mobile);
                    ps1.setInt(4,total);

                    ps1.executeUpdate();
                    System.out.println("success");
//                    String query2 = "ALTER TABLE shipping  add column idshipping int auto_increment primary key;";
//                    ps= con.prepareStatement(query2);
//                    ps.executeUpdate();
                    rs1.close();
                    cst.close();
                    ps1.close();
                    ps.close();
                    con.close();
                    if(s.equals("5")){
                        response.sendRedirect("order_placed");
                    }

//                    response.setHeader("Cache-Control","no-cache");
//                    response.setHeader("Cache-Control","no-store");
//                    response.setHeader("Pragma","no-cache");
//                    response.setDateHeader ("Expires", 0);

//                    PrintWriter pw = response.getWriter();
//                    pw.println("<html>" +
//                            "<body>" +
//                            "<br><b><center><h1> THANK YOU!!! </h1></center></b><br>"+
//                            "<center><h4> Visit Again. </h4></center><br>"+
//                            "<center>Soon you will receive your order.</center>"
//                            + "</body></html>");
                }catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
//            }

//            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
//            rd.forward(request, response);
        }
    }
}
