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
import javax.servlet.http.HttpSession;

import Dao.InfoClassDao;
import Dao.InfoStudentsDao;
import Dao.TablePointDao;
import Dao.signInDao;
import Model.HocSinh;
import Model.Lop;
import Model.QuaTrinh;
import Model.SignIn;
import Model.tablePointSubjectClass;


@WebServlet("/SignIn")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private signInDao signInDao; 
    private InfoStudentsDao infoStudentsDao;
    private InfoClassDao infoClassDao;
    private TablePointDao tablePointDao;

    public void init() {
    	signInDao = new signInDao();
    	infoStudentsDao = new InfoStudentsDao();
    	infoClassDao = new InfoClassDao();
    	tablePointDao = new TablePointDao();
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		SignIn acc;
		HocSinh hs;
		Lop l;
		tablePointSubjectClass p;
		QuaTrinh pAVG;
		try {
			acc = signInDao.Login(username, password);
			hs = infoStudentsDao.selectOneStudent(username);
			System.out.println("username: " + username);
			System.out.println("hoc sinh 1: " + hs);
			l = infoClassDao.selectOneClass(username);
			List<tablePointSubjectClass> listPointStudent = tablePointDao.selectPointOneStudent(username);
			pAVG = tablePointDao.selectAVGStudent(username);
			if (acc==null) {
				request.setAttribute("messageerror", "Sai tài khoản hoặc mật khẩu");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/signIn.jsp");
				dispatcher.forward(request, response);
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("account", acc);
				session.setAttribute("hs", hs);
				session.setAttribute("l", l);
				session.setAttribute("pAVG", pAVG);
				session.setAttribute("p", listPointStudent);
				request.getRequestDispatcher("/AccountServlet").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}	
}
