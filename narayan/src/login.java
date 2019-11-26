import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/lo")
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String un = request.getParameter("username");
        String pw = request.getParameter("password");
        Connection con=null;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:MySQL://localhost/emart", "root", "Narayan@123");

            PreparedStatement ps = con.prepareStatement("select username,password from login where username=? and password=?");
            ps.setString(1, un);
            ps.setString(2, pw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username",un);
                response.sendRedirect("managerpage.jsp");
                return;
            }
//            response.sendRedirect("login.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            out.println("<center><font color=red>Sorry! Username or Password is wrong</font></center>");
            rd.include(request, response);
            return;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

}