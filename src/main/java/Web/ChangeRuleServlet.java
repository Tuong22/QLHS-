package Web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.changeRuleDao;
import Dao.infoSubjectDao;
import Model.ChangeRule;
import Model.Mon;

@WebServlet("/ChangeRule")
public class ChangeRuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private changeRuleDao ChangeRuleDao;
    
    @Resource(name="jdbc/student_management")
	private DataSource datasource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		ChangeRuleDao = new changeRuleDao(datasource);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "/update":
            try {
            	updateTuoi(request, response);
            } catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
                e.printStackTrace();
            }
            break;
		
		}
	}
		
	private void updateTuoi(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		int tuoiToiDa = Integer.parseInt(request.getParameter("tuoiHSToiDa"));
        int tuoiToiThieu = Integer.parseInt(request.getParameter("tuoiHSToiThieu"));
		ChangeRuleDao.updateTuoiToiThieuToiDa(tuoiToiThieu, tuoiToiDa);
		response.sendRedirect(request.getContextPath() + "/changeRule.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
