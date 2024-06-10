package Web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.signInDao;
import Model.SignIn;


@WebServlet("/SignIn")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private signInDao signInDao;  

    public void init() {
    	signInDao = new signInDao();
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		SignIn acc;
		try {
			acc = signInDao.Login(username, password);
			if (acc==null) {
				request.setAttribute("messageerror", "Sai tài khoản hoặc mật khẩu");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/signIn.jsp");
				dispatcher.forward(request, response);
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("account", acc);
				request.getRequestDispatcher("/AccountServlet").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}
