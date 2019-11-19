import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

//@WebServlet("/checkout")
public class shipp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        Random generator=new Random();
        int id = generator.nextInt(1000);
        String fullname = null;
        String mobile = null;


        Connection con=null;
//        if (fullname.isEmpty() || address.isEmpty() || mobile.isEmpty() || pincode.isEmpty() || city.isEmpty() || state.isEmpty()) {
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            out.println("<font color=red>Please fill all the fields</font></bottom>");
//            rd.include(request, response);
//        } else {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
            String query1 = "select * from shipping;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query1);
            rs.last();
            fullname = rs.getString(2);
            mobile = rs.getString(3);
            System.out.println("Hello" +fullname+mobile);
            String query2 = "insert into details (id,name,phone,price) values(?,?,?,?);";

            PreparedStatement ps = con.prepareStatement(query2);
            CallableStatement cst = con.prepareCall("{CALL totalprice ()}");
            ResultSet rs1 = cst.executeQuery();
            int total = 0;
            while(rs1.next()){
                total=rs1.getInt(1);
            }


            ps.setInt(1, id);
            ps.setString(2, fullname);
            ps.setString(3, mobile);
            ps.setInt(4,total);

            ps.executeUpdate();
            System.out.println("successfully inserted");

//                    String query2 = "ALTER TABLE shipping  add column idshipping int auto_increment primary key;";
//                    ps= con.prepareStatement(query2);
//                    ps.executeUpdate();

            con.close();
            ps.close();
            con.close();

            response.sendRedirect("order_placed");


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

