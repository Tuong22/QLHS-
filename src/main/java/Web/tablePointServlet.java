package Web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.infoClassDao;
import Dao.infoSubjectDao;
import Dao.tablePointDao;
import Model.Lop;
import Model.Mon;
import Model.TraCuuKhoi;
import Model.tablePointSubjectClass;

@WebServlet("/tablePointServlet")
public class tablePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private tablePointDao TablePointDao;
	private infoSubjectDao InfoSubjectDao;
	private infoClassDao InfoClassDao;
	@Resource(name="jdbc/student_management")
	private DataSource datasource;
       
	@Override
	public void init() throws ServletException {
		super.init();
		TablePointDao = new tablePointDao(datasource);
		InfoSubjectDao = new infoSubjectDao(datasource);
		InfoClassDao = new infoClassDao(datasource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/pointStudent":
			try {
				selectPoint(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			try {
				renderClassAndSubject(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				e.printStackTrace();
			}
			break;
		}
	}
	
	private void renderClassAndSubject(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<Lop> DSL = InfoClassDao.selectAllClass();
		List<Mon> DSMH = InfoSubjectDao.selectAllSubject();
		request.setAttribute("DSL", DSL);
		request.setAttribute("DSMH", DSMH);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tablePoint.jsp");
		dispatcher.forward(request, response);
	}
	
	private void selectPoint(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String tenLop = request.getParameter("search-lop");
		String hocKy = request.getParameter("search-hk");
		String tenMon = request.getParameter("search-mon");
		if(tenLop==null) {
			tenLop = "";
		}
		if(hocKy == null) {
			hocKy = "1";
		}
		if(tenMon == null) {
			tenMon = "";
		}	
		List<tablePointSubjectClass> DSD = TablePointDao.selectPoint(tenLop, Integer.parseInt(hocKy), tenMon);
		List<Lop> DSL = InfoClassDao.selectAllClass();
		List<Mon> DSMH = InfoSubjectDao.selectAllSubject();
		request.setAttribute("DSL", DSL);
		request.setAttribute("DSMH", DSMH);
		request.setAttribute("DSD", DSD);
		request.setAttribute("nameLop", tenLop);
		request.setAttribute("nameHocKy", hocKy);
		request.setAttribute("nameMon", tenMon);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tablePoint.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}