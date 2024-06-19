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


import Dao.InfoClassDao;
import Dao.SubjectDao;
import Dao.tablePointAllSubjectDao;
import Dao.TablePointDao;
import Model.Lop;
import Model.PointAllSubject;
import Model.tablePointSubjectClass;

@WebServlet("/TablePointAllSubjectServlet")
public class TablePointAllSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubjectDao subjectDao;  
	private InfoClassDao infoClassDao;
	private tablePointAllSubjectDao tablePointAllSubjectDao;
	
	public TablePointAllSubjectServlet() {
		this.tablePointAllSubjectDao = new tablePointAllSubjectDao();
		this.infoClassDao = new InfoClassDao();
		this.subjectDao = new SubjectDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/pointAllSubject":
			try {
				selectPointAllSubject(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/filter":
			try {
				filterTypeStudents(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			try {
				renderClass(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				e.printStackTrace();
			}
			break;
		}
	}
	
	private void selectPointAllSubject(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String tenLop = request.getParameter("search-lop");
		String hocKy = request.getParameter("search-hk");
		if(tenLop==null) {
			tenLop = "";
		}
		if(hocKy == null) {
			hocKy = "1";
		}
		List<PointAllSubject> DSD = tablePointAllSubjectDao.selectPointAllSubject(tenLop, Integer.parseInt(hocKy));
		List<Lop> DSL = infoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		request.setAttribute("DSD", DSD);
		request.setAttribute("nameLop", tenLop);
		request.setAttribute("nameHocKy", hocKy);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tablePointAllSubject.jsp");
		dispatcher.forward(request, response);
	}
	
	private void renderClass(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<Lop> DSL = infoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tablePointAllSubject.jsp");
		dispatcher.forward(request, response);
	}
	
	private void filterTypeStudents(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, NumberFormatException, SQLException {
		String lop = request.getParameter("search-lop");
		String phanLoai = request.getParameter("search-loaiHS");
		System.out.println(lop);
		List<PointAllSubject> type = tablePointAllSubjectDao.renderTypeStudent(phanLoai);
		request.setAttribute("DSD", type);
		request.setAttribute("loaiHS", phanLoai);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tablePointAllSubject.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}