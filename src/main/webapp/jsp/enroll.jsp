<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Course" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Register a course</title>
    <style>
        body { background-color: black; text-align: center; }
        form { margin: auto; padding: 20px; width: 400px; background-color: #fff; }
        input, select, button { width: 90%; padding: 10px; margin: 10px; }
        button { background-color: #4CAF50; color: white; font-weight: bold; font-size: medium; cursor: pointer; }
        button:hover { background-color: #104212; }
    </style>
</head>
<body>
<h1 style="color: yellow;">Kick start with an exciting course</h1>

<form action="course" method="post">
    <label>Enter your name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Enter your emailId:</label><br>
    <input type="email" name="emailId" required><br><br>

    <label>Choose a Course:</label><br>
    <select name="courseName" required>
        <%
            List<Course> courses = (List<Course>) request.getAttribute("courses");
            if (courses != null) {
                for (Course course : courses) {
        %>
            <option value="<%= course.getCourseName() %>"><%= course.getCourseName() %></option>
        <%
                }
            }
        %>
    </select>

    <br><br>
    <button type="submit">Submit</button>

    <div style="text-align: center; margin-top: 20px;">
        <button type="button" onclick="window.location.href='course?action=index'">Back To Index</button>
    </div>
</form>
</body>
</html>
