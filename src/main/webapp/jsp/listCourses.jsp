<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Course" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Available Courses</title>
     <title>Available Courses</title>
    <style>
        body {
            padding: 50px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 16px;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #ecf0f1;
        }

        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        tr:hover {
            background-color: #dfe6e9;
            transition: background-color 0.3s ease;
        }

        button {
            background-color: #34495e;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        button:hover {
            background-color: #2c3e50;
        }

        .centered {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<h1>Available Courses</h1>
<div style="text-align: center;">
    <table border="2" style="margin: auto;">
    <tr>
        <th>Course ID</th>
        <th>Course Name</th>
        <th>Trainer</th>
        <th>Duration (Weeks)</th>
    </tr>
    <%
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        if (courses != null) {
            for (Course course : courses) {
    %>
    <tr>
        <td><%= course.getCourseId() %></td>
        <td><%= course.getCourseName() %></td>
        <td><%= course.getTrainer() %></td>
        <td><%= course.getDurationInWeeks() %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="4">No courses available.</td>
    </tr>
    <%
        }
    %>
</table>
</div>
<div style="text-align: center; margin-top: 20px;">
        <a href="course?action=index"><button>Back To Index</button></a>
    </div>
</body>
</html>