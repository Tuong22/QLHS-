package Web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.json.JSONObject;

import com.google.gson.JsonObject;


@WebServlet("/ValidateCodeServlet")
@MultipartConfig
public class ValidateCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/student_management")
	private DataSource datasource;
	
	@Override
	public void init() throws ServletException {
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part codeFilePart = request.getPart("codeFile");

        StringBuilder codeBuilder = new StringBuilder();
        try (InputStream inputStream = codeFilePart.getInputStream();
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                codeBuilder.append(line).append("\n");
            }
        }

        String code = codeBuilder.toString();

        // Kiểm tra tính đúng đắn của code bằng cách gọi API của GPT
        boolean isCodeCorrect = checkCodeCorrectnessWithGPT(code);

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("isCodeCorrect", isCodeCorrect);

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
	}
	
	@SuppressWarnings("deprecation")
	private boolean checkCodeCorrectnessWithGPT(String code) {
		String prompt = "Check the correctness of the following code. The code should print 'hello world':\n\n" + code;
        String apiKey = "YOUR_OPENAI_API_KEY";
        
        try {
            URL url = new URL("https://api.openai.com/v1/engines/davinci-codex/completions");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + apiKey);
            conn.setRequestProperty("Content-Type", "application/json");

            conn.setDoOutput(true);
            String inputJson = new JSONObject()
                .put("prompt", prompt)
                .put("max_tokens", 100)
                .put("temperature", 0.5)
                .toString();
            
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = inputJson.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            try (BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }

                // Phân tích kết quả trả về từ GPT
                String responseBody = response.toString();
                JSONObject jsonResponse = new JSONObject(responseBody);
                String completion = jsonResponse.getJSONArray("choices").getJSONObject(0).getString("text").trim();

                boolean isCorrect = completion.toLowerCase().contains("hello world");
                return isCorrect;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
