package Web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AccountDao;
import Model.Mon;
import Model.signIn;


@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AccountDao accountDao; 
    
    public AccountServlet() {
       this.accountDao = new AccountDao();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/update":
			try {
				updateAccount(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;
		default:
			break;
		}
	}

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		signIn acc = new signIn(username, pass);
		accountDao.updateAccount(acc, username);
		response.sendRedirect(request.getContextPath() + "/AccountServlet");
	}
}
