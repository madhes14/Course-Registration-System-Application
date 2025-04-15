package Controller;



import Model.*;

import Service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/course")
public class CourseServlet extends HttpServlet {


	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if (action == null || action.equals("list")) {
            List<Course> courses = CourseService.availableCourses();
            req.setAttribute("courses", courses);
            req.getRequestDispatcher("/jsp/listCourses.jsp").forward(req, resp);

        } 
        else if (action.equals("enrolled")) {
            List<CourseRegistry> students = CourseService.enrolledStudents();
            req.setAttribute("students", students);
            req.getRequestDispatcher("/jsp/enrolled.jsp").forward(req, resp);

        } 
        else if (action.equals("form")) {
        	List<Course> courses = CourseService.availableCourses();
            req.setAttribute("courses", courses);
            req.getRequestDispatcher("/jsp/enroll.jsp").forward(req, resp);
        }
        else if (action.equals("index")) {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
//        else {
//        	 String name = req.getParameter("name");
//             String email = req.getParameter("emailId");
//             String courseName = req.getParameter("courseName");
//
//             CourseService.enrollCourse(name, email, courseName);
//
//             req.setAttribute("message", "Congratulations " + name + "! Enrollment successful for " + courseName + ".");
//             req.getRequestDispatcher("/jsp/success.jsp").forward(req, resp);
//        	
//        }
        
    }

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("emailId");
        String courseName = req.getParameter("courseName");

        CourseService.enrollCourse(name, email, courseName);

        req.setAttribute("message", "Congratulations " + name + "! Enrollment successful for " + courseName + ".");
        req.getRequestDispatcher("/jsp/success.jsp").forward(req, resp);
    }
}

