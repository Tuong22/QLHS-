package Web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Dao.InfoStudentsDao;
import Model.HocSinh;
import Model.TraCuuHocSinh;

@WebServlet("/InfoStudentsServlet")
public class InfoStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InfoStudentsDao infoStudentsDao;
	@Resource(name="jdbc/student_management")
	private DataSource datasource;
	
	
	@Override
	public void init() throws ServletException {
		super.init();
		infoStudentsDao = new InfoStudentsDao(datasource);
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
				e.printStackTrace();
			} 
			break;
		case "/searchByName":
			try {
				selectStudentByName(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			try {
				render(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				e.printStackTrace();
			}
			break;
		}
		
	}

	private void render(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<HocSinh> DSHS = infoStudentsDao.selectAllStudent();
		request.setAttribute("DSHS", DSHS);
		request.setAttribute("messageerror", "");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/infoStudent.jsp");
		dispatcher.forward(request, response);
	}
	
	private void selectStudentByName(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String name = request.getParameter("search-student-name");
		String nameClass = request.getParameter("search-student-class");
		List<TraCuuHocSinh> DSTCHS = infoStudentsDao.selectStudent(name, nameClass);
		request.setAttribute("DSTCHS", DSTCHS);
		request.setAttribute("searchStudentName", name);
		request.setAttribute("searchStudentClass", nameClass);
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
		
		boolean isvalid = infoStudentsDao.checkAge(hs);
		if (isvalid) {
			infoStudentsDao.insertStudent(hs);
			response.sendRedirect(request.getContextPath() + "/InfoStudentsServlet");
		}
		else {
			request.setAttribute("messageerror", "Tuổi không hợp lệ.");
			request.getRequestDispatcher("/infoStudent.jsp").forward(request, response);
		}
	}
}
