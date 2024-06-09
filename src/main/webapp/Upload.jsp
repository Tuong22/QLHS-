<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý học sinh</title>
</head>
<body>
	<h1>Upload Answer File, Student File, and Source Code</h1>
    <form action="<%=request.getContextPath()%>/CompareFilesServlet" method="post" enctype="multipart/form-data">
        <label for="answerFile">Answer File:</label>
        <input type="file" name="answerFile" id="answerFile"><br><br>
        <label for="studentFile">Student File:</label>
        <input type="file" name="studentFile" id="studentFile"><br><br>
        <input type="submit" value="Submit Answer and Student Files">
    </form>
    
</body>
</html>