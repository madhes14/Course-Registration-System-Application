package Service;


//import Model.Course;
//import Model.CourseRegistry;
//
//import java.util.ArrayList;
//import java.util.List;
//
//public class CourseService {
//    private static final List<Course> courseList = new ArrayList<>();
//    private static final List<CourseRegistry> registryList = new ArrayList<>();
//
//    static {
//        courseList.add(new Course("C101", "Java Basics", "Alice", 6));
//        courseList.add(new Course("C102", "Spring Boot", "Bob", 4));
//        courseList.add(new Course("C103", "HTML & CSS", "Charlie", 2));
//        registryList.add(new CourseRegistry("Madheswaran","92madheswaran@gmail.com","Java"));
//    }
//
//    public static List<Course> availableCourses() {
//        return courseList;
//    }
//
//    public static List<CourseRegistry> enrolledStudents() {
//        return registryList;
//    }
//
//    public static void enrollCourse(String name, String emailId, String courseName) {
//        registryList.add(new CourseRegistry(name, emailId, courseName));
//    }
//    
//}



import Model.Course;
import Model.CourseRegistry;
import Utility.JsonUtil;

import java.util.ArrayList;
import java.util.List;

public class CourseService {
    private static List<Course> courseList = new ArrayList<>();
    private static List<CourseRegistry> registryList = new ArrayList<>();

    static {
        // Load existing courses from JSON file
        courseList = Utility.JsonUtil.readCoursesFromJson();
        if (courseList.isEmpty()) {
            // Initialize with default courses if file is empty or not found
            courseList.add(new Course("C101", "Java Basics", "Alice", 6));
            courseList.add(new Course("C102", "Spring Boot", "Bob", 4));
            courseList.add(new Course("C103", "HTML & CSS", "Charlie", 2));
            JsonUtil.writeCoursesToJson(courseList); // Save default courses to JSON
        }

        // Load existing registry from JSON file
        registryList = JsonUtil.readRegistryFromJson();
    }

    public static List<Course> availableCourses() {
        return courseList;
    }

    public static List<CourseRegistry> enrolledStudents() {
        return registryList;
    }

    public static String enrollCourse(String name, String emailId, String courseName) {
        // Validate input parameters
        if (name == null || name.isEmpty() || emailId == null || emailId.isEmpty() || courseName == null || courseName.isEmpty()) {
            return "Enrollment failed: All fields are required.";
        }

        // Check if the course exists
        boolean courseExists = courseList.stream().anyMatch(course -> course.getCourseName().equals(courseName));
        if (!courseExists) {
            return "Enrollment failed: Course not found.";
        }

        // Proceed with enrollment
        CourseRegistry newRegistry = new CourseRegistry(name, emailId, courseName);
        registryList.add(newRegistry);
        
        // Write updated registry list to JSON file
        JsonUtil.writeRegistryToJson(registryList);
        
        return "Congratulations " + name + "! Enrollment successful for " + courseName + ".";
    }
}
