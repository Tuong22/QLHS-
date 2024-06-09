package Web;

import com.google.gson.JsonObject;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;
import org.apache.commons.io.output.UnsynchronizedByteArrayOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/CompareFilesServlet")
@MultipartConfig
public class CompareFilesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name = "jdbc/student_management")
	private DataSource datasource;
	
	@Override
	public void init() throws ServletException {
		super.init();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part answerFilePart = request.getPart("answerFile");
        Part studentFilePart = request.getPart("studentFile");

        Map<Integer, String> answerMap = readExcelFile(answerFilePart);
        Map<Integer, String> studentMap = readExcelFile(studentFilePart);

        int correctCount = 0;
        int totalQuestions = answerMap.size();

        for (Map.Entry<Integer, String> entry : answerMap.entrySet()) {
            Integer questionNumber = entry.getKey();
            String correctAnswer = entry.getValue();
            String studentAnswer = studentMap.get(questionNumber);

            if (correctAnswer.equals(studentAnswer)) {
                correctCount++;
            }
        }

        double score = ((double) correctCount / totalQuestions) * 100;

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("correct_answers", correctCount);
        jsonResponse.addProperty("total_questions", totalQuestions);
        jsonResponse.addProperty("score", score);

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
	}
	
	private Map<Integer, String> readExcelFile(Part filePart) throws IOException {
        Map<Integer, String> map = new HashMap<>();
        try (InputStream inputStream = filePart.getInputStream();
             Workbook workbook = new XSSFWorkbook(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);
            for (Row row : sheet) {
                Cell questionCell = row.getCell(0);
                Cell answerCell = row.getCell(1);
                if (questionCell != null && answerCell != null) {
                    int questionNumber = (int) questionCell.getNumericCellValue();
                    String answer = answerCell.getStringCellValue();
                    map.put(questionNumber, answer);
                }
            }
        }
        return map;
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
