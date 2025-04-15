<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Course" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Available Courses</title>
     <style>
            td{
                background-color: aliceblue;
            }
    
            body{
                padding: 50px;
            }
             button {
                text-align: center;
                background-color: #595d5e;
                color: white;
                padding: 20px 20px;
                border-radius: 5px;
            }

            button:hover {
                background-color: #2f3031;
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