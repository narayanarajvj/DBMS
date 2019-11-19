import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/order_placed")
public class order_placed extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Connection conn=null;
        Statement stmt=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");
            String sql1="DELETE FROM cart;";
            stmt=conn.createStatement();
            int rs=stmt.executeUpdate(sql1);
            res.sendRedirect("order_placed.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

}