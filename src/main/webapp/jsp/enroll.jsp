<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Course" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Course Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #1e3c72, #2a5298);
            font-family: 'Roboto', sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #ffdd57;
            font-size: 2.5em;
            margin-top: 40px;
        }

        form {
            background: #ffffff;
            color: #333;
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            margin: 40px auto;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #4CAF50;
            color: white;
            font-size: 1em;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #367c39;
        }

        .secondary-btn {
            background: #444;
            margin-top: 10px;
        }

        .secondary-btn:hover {
            background: #222;
        }
    </style>
</head>
<body>
<h1>🚀 Kickstart Your Learning Journey!</h1>

<form action="course" method="post">
    <label>Enter your name:</label>
    <input type="text" name="name" required>

    <label>Enter your email ID:</label>
    <input type="email" name="emailId" required>

    <label>Choose a Course:</label>
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

    <button type="submit">🎓 Submit</button>
    <button type="button" class="secondary-btn" onclick="window.location.href='course?action=index'">⬅️ Back To Index</button>
</form>
</body>
</html>
