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

import Dao.ReportDao;
import Dao.infoClassDao;
import Dao.infoSubjectDao;
import Model.Mon;
import Model.TraCuuBaoCao;


@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReportDao reportDao;
	private infoSubjectDao InfoSubjectDao;

	@Resource(name="jdbc/student_management")
	private DataSource datasource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		reportDao = new ReportDao(datasource);
		InfoSubjectDao = new infoSubjectDao(datasource);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/searchReport":
			try {
				selectReport(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			try {
				renderSubject(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				e.printStackTrace();
			}
			break;
		}
	}
	
	private void renderSubject(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<Mon> DSMH = InfoSubjectDao.selectAllSubject();
		request.setAttribute("DSMH", DSMH);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/report.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void selectReport(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String reportType = request.getParameter("report-type");
		String tenMon = request.getParameter("search-subject");
		String tenHK1 = request.getParameter("search-semester1");
		String tenHK2 = request.getParameter("search-semester2");
		String HK;
		if (reportType == null) {
			reportType = "";
		}
		if (!(tenHK1 == "")) {
			HK = tenHK1;
		} else {
			HK = tenHK2;
		}
		List<TraCuuBaoCao> DSTCBC = reportDao.selectReport(reportType, tenMon, HK);
		List<Mon> DSMH = InfoSubjectDao.selectAllSubject();
		request.setAttribute("DSMH", DSMH);
		request.setAttribute("DSTCBC", DSTCBC);
		request.setAttribute("typeReport", reportType);
		request.setAttribute("nameMon", tenMon);
		request.setAttribute("hocKy1", tenHK1);
		request.setAttribute("hocKy2", tenHK2);
		RequestDispatcher dispatcher = request.getRequestDispatcher("report.jsp");
		dispatcher.forward(request, response);
	}
}
