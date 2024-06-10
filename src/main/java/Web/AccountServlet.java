package Web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AccountDao;
import Model.SignIn;



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
		case "/updatePass":
            try {
            	updatePassword(request, response);
            } catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
                e.printStackTrace();
            }
            break;
        default:
        	try {
            	renderAccountRoleAdmin(request, response);
            } catch (ClassNotFoundException | ServletException | IOException e) {
                e.printStackTrace();
            }
            break;
		}
	}
	
	private void renderAccountRoleAdmin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<SignIn> DSTK = accountDao.renderAccountRoleAdmin();
		request.setAttribute("DSTK", DSTK);
		request.setAttribute("messageerror", "");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/account.jsp");
		dispatcher.forward(request, response);
	}
	
	
	public static final char SPACE = ' ';
    public static final char TAB = '\t';
    public static final char BREAK_LINE = '\n';
	public int countWords(String input) {
        if (input == null) {
            return -1;
        }
        int count = 0;
        int size = input.length();
        boolean notCounted = true;
        for (int i = 0; i < size; i++) {
            if (input.charAt(i) != SPACE && input.charAt(i) != TAB 
                    && input.charAt(i) != BREAK_LINE) {
                if(notCounted) {
                    count++;
                    notCounted = false;
                }
            } else {
                notCounted = true;
            }
        }
        return count;
    }
	
	private void updatePassword(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
        String newPass = request.getParameter("newPass");
        String cNewPass = request.getParameter("cNewPass");
        if (newPass == "" || newPass.length()<5) {
        	request.setAttribute("messageerror", "Thay đổi mật khẩu không thành công. Mật khẩu có độ dài phải lớn hơn 5");
            request.getRequestDispatcher("/account.jsp").forward(request, response);
        } else if (newPass.length()!=cNewPass.length()) {
        	request.setAttribute("messageerror", "Xác nhận mật khẩu không đúng.");
            request.getRequestDispatcher("/account.jsp").forward(request, response);
        } else {
        	accountDao.updatePassword(newPass);
        	request.setAttribute("messageinfo", "Thay đổi mật khẩu thành công.");
        	request.getRequestDispatcher("/account.jsp").forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
