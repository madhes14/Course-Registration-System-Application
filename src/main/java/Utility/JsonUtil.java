package Utility;


import Model.Course;
import Model.CourseRegistry;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class JsonUtil {
    private static final String COURSE_FILE_PATH = "C:\\Users\\madhes-pt7933\\eclipse-workspace\\CourseRegistrationSystem\\Resources\\courses.json"; // Path to your courses JSON file
    private static final String REGISTRY_FILE_PATH = "C:\\Users\\madhes-pt7933\\eclipse-workspace\\CourseRegistrationSystem\\Resources\\registry.json"; // Path to your registry JSON file

    public static void writeCoursesToJson(List<Course> courseList) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(COURSE_FILE_PATH))) {
            writer.write("[\n");
            for (int i = 0; i < courseList.size(); i++) {
                Course course = courseList.get(i);
                writer.write("  {\n");
                writer.write("    \"courseId\": \"" + course.getCourseId() + "\",\n");
                writer.write("    \"courseName\": \"" + course.getCourseName() + "\",\n");
                writer.write("    \"trainer\": \"" + course.getTrainer() + "\",\n");
                writer.write("    \"durationInWeeks\": " + course.getDurationInWeeks() + "\n");
                writer.write("  }" + (i < courseList.size() - 1 ? "," : "") + "\n");
            }
            writer.write("]");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Course> readCoursesFromJson() {
        List<Course> courseList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(COURSE_FILE_PATH))) {
            String line;
            StringBuilder jsonBuilder = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
            String json = jsonBuilder.toString();
            json = json.substring(1, json.length() - 1); // Remove brackets
            String[] courseEntries = json.split("\\},\\s*\\{");
            for (String entry : courseEntries) {
                entry = entry.replaceAll("[{}]", ""); // Remove braces
                String[] fields = entry.split(",\\s*");
                String courseId = fields[0].split(":")[1].replaceAll("\"", "").trim();
                String courseName = fields[1].split(":")[1].replaceAll("\"", "").trim();
                String trainer = fields[2].split(":")[1].replaceAll("\"", "").trim();
                int duration = Integer.parseInt(fields[3].split(":")[1].trim());
                courseList.add(new Course(courseId, courseName, trainer, duration));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courseList;
    }

    public static void writeRegistryToJson(List<CourseRegistry> registryList) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(REGISTRY_FILE_PATH))) {
            writer.write("[\n");
            for (int i = 0; i < registryList.size(); i++) {
                CourseRegistry registry = registryList.get(i);
                writer.write("  {\n");
                writer.write("    \"name\": \"" + registry.getName() + "\",\n");
                writer.write("    \"emailId\": \"" + registry.getEmailId() + "\",\n");
                writer.write("    \"courseName\": \"" + registry.getCourseName() + "\"\n");
                writer.write("  }" + (i < registryList.size() - 1 ? "," : "") + "\n");
            }
            writer.write("]");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<CourseRegistry> readRegistryFromJson() {
        List<CourseRegistry> registryList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(REGISTRY_FILE_PATH))) {
            String line;
            StringBuilder jsonBuilder = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
            String json = jsonBuilder.toString();
            json = json.substring(1, json.length() - 1); // Remove brackets
            String[] registryEntries = json.split("\\},\\s*\\{");
            for (String entry : registryEntries) {
                entry = entry.replaceAll("[{}]", ""); // Remove braces
                String[] fields = entry.split(",\\s*");
                String name = fields[0].split(":")[1].replaceAll("\"", "").trim();
                String emailId = fields[1].split(":")[1].replaceAll("\"", "").trim();
                String courseName = fields[2].split(":")[1].replaceAll("\"", "").trim();
                registryList.add(new CourseRegistry(name, emailId, courseName));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return registryList;
    }
}