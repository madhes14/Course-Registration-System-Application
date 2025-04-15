<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.CourseRegistry" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Enrolled Students</title>
    
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
<h1>Enrolled Students</h1>
<div style="text-align: center;">
    <table border="2" style="margin: auto;">
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
</div>
</body>
</html>