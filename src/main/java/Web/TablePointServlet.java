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

import Dao.TablePointDao;
import Model.BangDiem;

@WebServlet("/TablePointServlet")
public class TablePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TablePointDao tablePointDao;

	public TablePointServlet() {
		this.tablePointDao = new TablePointDao();
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
				selectPoint(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		}
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
		List<BangDiem> DSD = tablePointDao.selectPoint(tenLop, Integer.parseInt(hocKy), tenMon);
		request.setAttribute("DSD", DSD);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tablePoint.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}