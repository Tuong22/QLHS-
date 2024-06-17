package Web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;


import Dao.ReportDao;
import Dao.SubjectDao;
import Model.Mon;
import Model.TraCuuBaoCao;


@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReportDao reportDao;
	private SubjectDao subjectDao;

	public ReportServlet() {
		this.reportDao = new ReportDao();
		this.subjectDao = new SubjectDao();
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
				selectReport(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				e.printStackTrace();
			}
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"report.pdf\"");
        OutputStream out = response.getOutputStream();

        String tableDataJson = request.getParameter("tableData");
        String titleReport = request.getParameter("titleReport");
        if(titleReport.equals("report-subject")) {
        	titleReport = "Báo cáo tổng kết môn";
        } else if(titleReport.equals("report-semester")) {
        	titleReport = "Báo cáo tổng kết học kỳ";
        }
        Gson gson = new Gson();
        List<Map<String, String>> tableData = gson.fromJson(tableDataJson, List.class);

        Document document = new Document();
        try {
            PdfWriter.getInstance(document, out);
            document.open();

            // Load the Vietnamese font
            String fontPath = getServletContext().getRealPath("WEB-INF/fonts/Roboto-Regular.ttf");
            BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(bf, 12);
            Font titleFont = new Font(bf, 18, Font.BOLD);

            // Add a title
            Paragraph title = new Paragraph(titleReport, titleFont);
            title.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(title);

            // Add some space after the title
            document.add(new Paragraph("\n\n"));

            PdfPTable table = new PdfPTable(tableData.get(0).size());
            // Add table headers
            for (String header : tableData.get(0).keySet()) {
                table.addCell(new Paragraph(header, font));
            }
            // Add table data
            for (Map<String, String> row : tableData) {
                for (String cell : row.values()) {
                    table.addCell(new Paragraph(cell, font));
                }
            }

            document.add(table);
        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
        } finally {
            document.close();
        }
        out.flush();
        out.close();
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
		List<Mon> DSMH = subjectDao.selectAllSubject();
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
