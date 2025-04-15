package Service;


import Model.Course;
import Model.CourseRegistry;

import java.util.ArrayList;
import java.util.List;

public class CourseService {
    private static final List<Course> courseList = new ArrayList<>();
    private static final List<CourseRegistry> registryList = new ArrayList<>();

    static {
        courseList.add(new Course("C101", "Java Basics", "Alice", 6));
        courseList.add(new Course("C102", "Spring Boot", "Bob", 4));
        courseList.add(new Course("C103", "HTML & CSS", "Charlie", 2));
        registryList.add(new CourseRegistry("Madheswaran","92madheswaran@gmail.com","Java"));
    }

    public static List<Course> availableCourses() {
        return courseList;
    }

    public static List<CourseRegistry> enrolledStudents() {
        return registryList;
    }

    public static void enrollCourse(String name, String emailId, String courseName) {
        registryList.add(new CourseRegistry(name, emailId, courseName));
    }
    
}
