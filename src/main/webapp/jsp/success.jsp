<%@ page contentType="text/html" %>
<html>
<head>
    <title>Enrollment Success</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #d3ffe8, #a8ffe3);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            color: #067a00;
            font-size: 28px;
            margin-bottom: 30px;
            animation: slideDown 0.8s ease-out;
        }

        button {
            background-color: #067a00;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #045d00;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideDown {
            from { transform: translateY(-30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
    <h2>${message}</h2>
    <a href="course?action=index">
        <button>Back To Index</button>
    </a>
</body>
</html>
