import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.lang.*;

@WebServlet("/cart")
public class cart extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String productPid=req.getParameter("pid");
        String s=null;
        s = req.getParameter("ele");
        System.out.println("HELLO"+s);
        Connection conn=null;
        Statement stmt=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
            String sql1="(select i.pid, i.name, e.price from item i, electronics e where i.pid=e.pid and i.pid='"+productPid+"') " +
                    "union (select i.pid, i.name, h.price from item i, home h where i.pid=h.pid and i.pid='"+productPid+"');";
            stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql1);
            String pname=null;
            int price=0;
            while (rs.next()){
                pname=rs.getString("name");
                price=rs.getInt("price");
            }
            String sql2="insert into cart(pid,name,price) values(?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql2);

            ps.setInt(1, Integer.parseInt(productPid));
            ps.setString(2,pname);
            ps.setInt(3, price);
            ps.executeUpdate();
            if(s.equals("5")) {
                res.sendRedirect("product.jsp");
            }
            else if(s.equals("10")){
                res.sendRedirect("home.jsp");
            }
        } catch (SQLException | ClassNotFoundException | NullPointerException e) {
            e.printStackTrace();
        }

    }

}
//
//class Item{
//    String pid;
//    String name;
//    String price;
//
//    public Item(String pid, String name, String price) {
//        this.pid = pid;
//        this.name = name;
//        this.price = price;
//    }
//}
