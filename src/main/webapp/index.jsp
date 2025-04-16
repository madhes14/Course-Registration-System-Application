<%@ page contentType="text/html" %>
<html>
<head>
    <title>Course Registration System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            font-family: 'Poppins', sans-serif;
            text-align: center;
            padding-top: 100px;
        }

        h2 {
            color: #333;
            font-size: 2.2em;
            margin-bottom: 40px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        a {
            text-decoration: none;
        }

        button {
            background-color: #344955;
            color: white;
            padding: 15px 25px;
            border-radius: 10px;
            border: none;
            font-size: 1em;
            font-weight: bold;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        button:hover {
            background-color: #232f34;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h2> Course Registration System</h2>
    <div class="button-container">
        <a href="course?action=form"><button> Register a Course</button></a>
        <a href="course?action=list"><button> Available Courses</button></a>
        <a href="course?action=enrolled"><button> Enrolled Students</button></a>
    </div>
</body>
</html>
