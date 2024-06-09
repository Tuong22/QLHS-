package Web;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Dao.signInDao;
import Model.signIn;

@WebServlet("/SignIn")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private signInDao SignInDao;  
    @Resource(name="jdbc/student_management")
	private DataSource datasource;

    @Override
    public void init() {
    	SignInDao = new signInDao(datasource);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		signIn acc;
		try {
			acc = SignInDao.Login(username, password);
			if (acc==null) {
				request.setAttribute("messageerror", "Sai tài khoản hoặc mật khẩu");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/signIn.jsp");
				dispatcher.forward(request, response);
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("account", acc);
				request.getRequestDispatcher("account.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
