<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.CourseRegistry" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Enrolled Students</title>
    
    <style>
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
        </style>
</head>
<body>
<h1>Enrolled Students</h1>
<div style="text-align: center;">
    <table border="1" style="margin: auto;">
    <tr>
        <th>Name</th>
        <th>Email ID</th>
        <th>Course Name</th>
    </tr>
    <%
        List<CourseRegistry> students = (List<CourseRegistry>) request.getAttribute("students");
        if (students != null) {
            for (CourseRegistry student : students) {
    %>
    <tr>
        <td><%= student.getName() %></td>
        <td><%= student.getEmailId() %></td>
        <td><%= student.getCourseName() %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="3">No students enrolled.</td>
    </tr>
    <%
        }
    %>
</table>
</div>
<div style="text-align: center; margin-top: 20px;">
        <a href="course?action=index"><button>Back To Index</button></a>
        <a href="course?action=form"><button>Register A Course</button></a>
</div>
</body>
</html>