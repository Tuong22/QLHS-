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

import Dao.InfoClassDao;
import Dao.SubjectDao;
import Dao.listStudentOfClassDao;
import Model.HocSinh;
import Model.Lop;
import Model.Mon;
import Model.LoaiHinhKiemTra;

@WebServlet("/listStudentOfClassServlet")
public class listStudentOfClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private listStudentOfClassDao listStudentOfClassDao;
	private InfoClassDao infoClassDao;
	private SubjectDao subjectDao;

	public listStudentOfClassServlet() {
		this.listStudentOfClassDao = new listStudentOfClassDao();
		this.infoClassDao = new InfoClassDao();
		this.subjectDao = new SubjectDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {

		case "/show":
			try {
				renderStudentOfClass(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/addStdNotClass":
			try {
				insertStdNotClassToClass(request, response);

			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			try {
				renderClass(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}	

	}
	
	private void renderClass(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<Lop> DSL = infoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listStudentOfClass.jsp");
		dispatcher.forward(request, response);
	}

	private void renderStudentOfClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
		String className = request.getParameter("search-lop");
		List<HocSinh> DSHS = listStudentOfClassDao.renderStudentOfClass(className);
		int SiSo = listStudentOfClassDao.selectSiSo(className);
		List<HocSinh> DSHSNotClass = listStudentOfClassDao.listStudenNotClass();
		List<Lop> DSL = infoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		request.setAttribute("DSHSNotClass", DSHSNotClass);
		request.setAttribute("HS", DSHS);
		request.setAttribute("siso", SiSo);
		request.setAttribute("searchClass", className);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listStudentOfClass.jsp");
		dispatcher.forward(request, response);
	}

	private void insertStdNotClassToClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
		String className = request.getParameter("className");
		String listEmailOfStdNotClass = request.getParameter("listStudentNotClass");
		String[] emailSplit = listStudentOfClassDao.splitStringByComma(listEmailOfStdNotClass);
		String[] stdIdList = listStudentOfClassDao.selectStdIDByEmail(emailSplit);
		List<Mon> DSMH = subjectDao.selectAllSubject();
		List<LoaiHinhKiemTra> DSLHKT = subjectDao.selectLHKT();
		
		boolean isvalid = listStudentOfClassDao.addStdNotClassToClass(stdIdList, className);
		listStudentOfClassDao.createTablePointEmpty(stdIdList, className, DSMH);
		listStudentOfClassDao.createCTTablePointEmpty(stdIdList, DSMH);
		listStudentOfClassDao.createCTLHKTEmpty(stdIdList, DSMH, DSLHKT);

		if (isvalid) {
			request.setAttribute("messageInfoInsertToClass", "Thêm học sinh vào lớp thành công.");
		} else {
			request.setAttribute("messageErrorInsertToClass",
					"Thêm học sinh thất bại.");
		}
		List<HocSinh> DSHS = listStudentOfClassDao.renderStudentOfClass(className);
		int SiSo = listStudentOfClassDao.selectSiSo(className);
		List<HocSinh> DSHSNotClass = listStudentOfClassDao.listStudenNotClass();
		List<Lop> DSL = infoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		request.setAttribute("DSHSNotClass", DSHSNotClass);
		request.setAttribute("HS", DSHS);
		request.setAttribute("siso", SiSo);
		request.setAttribute("searchClass", className);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listStudentOfClass.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}