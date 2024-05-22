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

import Dao.SubjectDao;
import Model.Mon;

@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private SubjectDao subjectDao;

	public SubjectServlet() {
		this.subjectDao = new SubjectDao();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/insert":
			try {
				insertSubject(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;
		case "/update":
			try {
				updateSubject(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void render(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<Mon> DSMon = subjectDao.selectAllSubject();
		request.setAttribute("DSMon", DSMon);
		RequestDispatcher dispatcher = request.getRequestDispatcher("subject.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertSubject(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String name = request.getParameter("newSubjectName");
		String number = request.getParameter("numberSubject");

		Mon mon = new Mon(null, name, Integer.parseInt(number));
		subjectDao.insertSubject(mon);
		response.sendRedirect(request.getContextPath() + "/SubjectServlet");
	}
	
	private void updateSubject(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String nameSubjectOld = request.getParameter("nameOld");
		String nameSubject = request.getParameter("name");
		int numberSubject =Integer.parseInt(request.getParameter("number"));
		Mon mon = new Mon(null, nameSubject,numberSubject);
		subjectDao.updateSubject(mon, nameSubjectOld);
		response.sendRedirect(request.getContextPath() + "/SubjectServlet");
	}
}
