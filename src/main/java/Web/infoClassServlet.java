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

import Dao.infoClassDao;
import Model.HocSinh;
import Model.Lop;
import Model.Mon;
import Model.TraCuuHocSinh;
import Model.TraCuuKhoi;
import Model.updateLop;

@WebServlet("/infoClassServlet")
public class infoClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private infoClassDao InfoClassDao;
	@Resource(name="jdbc/student_management")
	private DataSource datasource;
       
	@Override
	public void init() throws ServletException {
		super.init();
		InfoClassDao = new infoClassDao(datasource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/searchByKhoi":
			try {
				selectKhoi(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
			
		case "/insert":
			try {
				insertClass(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				e.printStackTrace();
			} 
			break;
			
		case "/update":
            try {
                updateClass(request, response);
            } catch (ClassNotFoundException | ServletException | IOException e) {
                e.printStackTrace();
            }
            break;
            
		case "/delete":
			try {
				deleteClass(request, response);
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
	
	private void render(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		List<Lop> DSL = InfoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/class.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertClass(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String nameClass = request.getParameter("newClassName");
		String num = request.getParameter("newNumber");
		Lop m = new Lop(null, nameClass, Integer.parseInt(num), null, null);
		InfoClassDao.insertClass(m);
		response.sendRedirect(request.getContextPath() + "/infoClassServlet");
	}
	
	private void selectKhoi(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String tenKhoi = request.getParameter("search-khoi");
		List<TraCuuKhoi> DSK = InfoClassDao.selectKhoi(tenKhoi);
		request.setAttribute("DSTCK", DSK);
		request.setAttribute("nameKhoi", tenKhoi);
		RequestDispatcher dispatcher = request.getRequestDispatcher("class.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateClass(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String nameClassOld = request.getParameter("nameOld");
		String nameClass = request.getParameter("name");
		int numberOfStudent =Integer.parseInt(request.getParameter("number"));
		Lop lop = new Lop(null, nameClass, numberOfStudent, null, null);
		InfoClassDao.updateClass(lop, nameClassOld);
		response.sendRedirect(request.getContextPath() + "/infoClassServlet");
	}
	
	private void deleteClass(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException {
		String nameClass = request.getParameter("nameRemove");
		boolean isvalid = InfoClassDao.checkDeleteClass(nameClass);
		
		if (isvalid) {
			InfoClassDao.deleteClass(nameClass);
	        response.sendRedirect(request.getContextPath() + "/infoClassServlet");
	    } else {
	        request.setAttribute("messageerror", "Không thể xóa lớp đang học.");
	        request.getRequestDispatcher("/class.jsp").forward(request, response);
	    }
	}
}
