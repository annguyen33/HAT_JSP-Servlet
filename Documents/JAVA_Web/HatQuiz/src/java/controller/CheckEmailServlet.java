package controller;
import DAO.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class CheckEmailServlet extends HttpServlet {
    UserDAO usersDAO = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (usersDAO.checkEmail(request.getParameter("email"))) {
            response.getWriter().write("<img src=\"images/not-available.png\" />");
        } else {
            response.getWriter().write("<img src=\"images/available.png\" />");
        }
    }
}
