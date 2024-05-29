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

import com.google.gson.Gson;

import Dao.InfoClassDao;
import Model.HocSinh;
import Model.Lop;
import Model.TraCuuKhoi;

@WebServlet("/InfoClassServlet")
public class InfoClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private InfoClassDao infoClassDao;

	public InfoClassServlet() {
		this.infoClassDao = new InfoClassDao();
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
				// TODO Auto-generated catch block
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
		List<Lop> DSL = infoClassDao.selectAllClass();
		request.setAttribute("DSL", DSL);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/class.jsp");
		dispatcher.forward(request, response);
	}

	private void insertClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
		String nameClass = request.getParameter("newClassName");
		String num = request.getParameter("newNumber");
		Lop m = new Lop(null, nameClass, Integer.parseInt(num), null, null);
		infoClassDao.insertClass(m);
		response.sendRedirect(request.getContextPath() + "/InfoClassServlet");
	}

	private void selectKhoi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String tenKhoi = request.getParameter("search-khoi");
		List<TraCuuKhoi> DSK = infoClassDao.selectKhoi(tenKhoi);
		request.setAttribute("DSTCK", DSK);
		RequestDispatcher dispatcher = request.getRequestDispatcher("class.jsp");
		dispatcher.forward(request, response);
	}

	private void updateClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
		String nameClassOld = request.getParameter("nameOld");
		String nameClass = request.getParameter("name");
		int numberOfStudent = Integer.parseInt(request.getParameter("number"));
		Lop lop = new Lop(null, nameClass, numberOfStudent, null, null);
		infoClassDao.updateClass(lop, nameClassOld);
		response.sendRedirect(request.getContextPath() + "/InfoClassServlet");
	}

	private void deleteClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
		String nameClass = request.getParameter("nameRemove");
		boolean isvalid = infoClassDao.checkDeleteClass(nameClass);

		if (isvalid) {
			infoClassDao.deleteClass(nameClass);
			response.sendRedirect(request.getContextPath() + "/InfoClassServlet");
		} else {
			request.setAttribute("messageerror", "Không thể xóa lớp đang học.");
			request.getRequestDispatcher("/class.jsp").forward(request, response);
		}
	}
}
