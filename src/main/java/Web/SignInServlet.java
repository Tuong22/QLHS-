package Web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.signInDao;
import Model.signIn;

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
		signIn signInModel = new signIn();
		signInModel.setUsername(username);
		signInModel.setPassword(password);

		try {
			if (signInDao.validate(signInModel)) {
				response.sendRedirect("account.jsp");
			} else {
				HttpSession session = request.getSession();
				response.sendRedirect("signIn.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
