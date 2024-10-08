package Web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Dao.ChangeRuleDao;
import Model.ChangeRule;


@WebServlet("/ChangeRuleServlet")
public class ChangeRuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ChangeRuleDao changeRuleDao;
    
 
    public ChangeRuleServlet() {
		this.changeRuleDao = new ChangeRuleDao();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/updateTuoi":
            try {
            	updateTuoi(request, response);
            } catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
                e.printStackTrace();
            }
            break;
            
		case "/updateSiSo":
            try {
            	updateSiSo(request, response);
            } catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
                e.printStackTrace();
            }
            break;
            
		case "/updateDiemDat":
            try {
            	updateDiemDat(request, response);
            } catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
                e.printStackTrace();
            }
            break;
		case "/updateDiem":
            try {
            	updateDiem(request, response);
            } catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
                e.printStackTrace();
            }
            break;
		default:
			try {
				renderThamSo(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		}
	}
	
	private void renderThamSo(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException, ClassNotFoundException, SQLException {
		ChangeRule cr = changeRuleDao.renderThamSo();
		request.setAttribute("CR", cr);
	    request.getRequestDispatcher("/changeRule.jsp").forward(request, response);
	}
		
	private void updateTuoi(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		int tuoiToiDa = Integer.parseInt(request.getParameter("tuoiHSToiDa"));
        int tuoiToiThieu = Integer.parseInt(request.getParameter("tuoiHSToiThieu"));
        boolean isvalid = changeRuleDao.updateTuoiToiThieuToiDa(tuoiToiThieu, tuoiToiDa);
        
		if (isvalid) {
			request.setAttribute("messageInfoUpdateAge", "Thay đổi giới hạn tuổi thành công.");
		} else {
			request.setAttribute("messageErrorUpdateAge",
					"Thay đổi thất bại.");
		}
		ChangeRule cr = changeRuleDao.renderThamSo();
		request.setAttribute("CR", cr);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/changeRule.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateSiSo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		int siSoToiDa = Integer.parseInt(request.getParameter("siSoToiDa"));
		boolean isvalid = changeRuleDao.updateSiSoToiDa(siSoToiDa);
		if (isvalid) {
			request.setAttribute("messageInfoUpdateSiSo", "Thay đổi giới hạn sĩ số thành công.");
		} else {
			request.setAttribute("messageErrorUpdateSiSo",
					"Thay đổi thất bại.");
		}
		ChangeRule cr = changeRuleDao.renderThamSo();
		request.setAttribute("CR", cr);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/changeRule.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateDiemDat(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		int diemDat = Integer.parseInt(request.getParameter("pointPass"));
		boolean isvalid = changeRuleDao.updateDiemDat(diemDat);
		if (isvalid) {
			request.setAttribute("messageInfoUpdateDiemDat", "Thay đổi giới hạn điểm đạt thành công.");
		} else {
			request.setAttribute("messageErrorUpdateDiemDat",
					"Thay đổi thất bại.");
		}
		ChangeRule cr = changeRuleDao.renderThamSo();
		request.setAttribute("CR", cr);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/changeRule.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateDiem(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		int diemToiDa = Integer.parseInt(request.getParameter("maxPoint"));
        int diemToiThieu = Integer.parseInt(request.getParameter("minPoint"));
        boolean isvalid = changeRuleDao.updateDiem(diemToiThieu, diemToiDa);
        if (isvalid) {
			request.setAttribute("messageInfoUpdateDiem", "Thay đổi giới hạn điểm tối thiểu, tối đa thành công.");
		} else {
			request.setAttribute("messageErrorUpdateDiem",
					"Thay đổi thất bại.");
		}
        ChangeRule cr = changeRuleDao.renderThamSo();
		request.setAttribute("CR", cr);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/changeRule.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
