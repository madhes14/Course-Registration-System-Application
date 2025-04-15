<%@ page contentType="text/html" %>
<html>
<head>
    <title>Course Registration System</title>
    <style>
        button { background-color: #595d5e; color: white; padding: 20px 20px; border-radius: 5px; }
        button:hover { background-color: #2f3031; }
        body { font-family: Arial, sans-serif; background-color: #f0f0f0; text-align: center; margin-top: 70px; }
    </style>
</head>
<body>
    <h2>Course Registration System</h2>
    <a href="course?action=form"><button>Register a course</button></a>
    <a href="course?action=list"><button>Available Courses</button></a>
    <a href="course?action=enrolled"><button>Enrolled Students</button></a>
</body>
</html>
