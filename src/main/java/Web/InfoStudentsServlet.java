package Web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.InfoStudentsDao;
import Model.HocSinh;

@WebServlet("/InfoStudentsServlet")
public class InfoStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InfoStudentsDao infoStudentsDao;

	public InfoStudentsServlet() {
		this.infoStudentsDao = new InfoStudentsDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			render(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void render(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<HocSinh> DSHS = infoStudentsDao.selectAllStudent();
		request.setAttribute("DSHS", DSHS);
		RequestDispatcher dispatcher = request.getRequestDispatcher("infoStudent.jsp");
		dispatcher.forward(request, response);
	}
}
