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
import Model.TraCuuHocSinh;

@WebServlet("/InfoStudentsServlet")
public class InfoStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InfoStudentsDao infoStudentsDao;

	public InfoStudentsServlet() {
		this.infoStudentsDao = new InfoStudentsDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/insert":
			try {
				insertStudent(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;
		case "/searchByName":
			try {
				selectStudentByName(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			try {
				render(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
			
	}

	private void render(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<HocSinh> DSHS = infoStudentsDao.selectAllStudent();
		request.setAttribute("DSHS", DSHS);
		RequestDispatcher dispatcher = request.getRequestDispatcher("infoStudent.jsp");
		dispatcher.forward(request, response);
	}
	
	private void selectStudentByName(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String name = request.getParameter("search-student-name");
		List<TraCuuHocSinh> DSTCHS = infoStudentsDao.selectStudent(name);
		request.setAttribute("DSTCHS", DSTCHS);
		RequestDispatcher dispatcher = request.getRequestDispatcher("searchStudent.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertStudent(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String name = request.getParameter("studentName");
		String gender = request.getParameter("gender-group");
		String year = request.getParameter("studentYear");
		String address = request.getParameter("studentAddress");
		String email = request.getParameter("studentEmail");
		HocSinh hs = new HocSinh(null, name, gender, Integer.parseInt(year), address, email);
		infoStudentsDao.insertStudent(hs);
		response.sendRedirect(request.getContextPath() + "/InfoStudentsServlet");
	}
	
}
