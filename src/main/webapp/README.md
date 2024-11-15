# Web Application for Data Management

## Overview
This web application allows users to manage data related to students. It uses Java Servlets, JSP, and XML for data processing and storage. The application supports adding, updating, deleting, sorting, and filtering data entries.

## Features
- **Add Entry**: Collects and stores user data in an XML file.
- **Update Entry**: Updates existing data entries.
- **Delete Entry**: Deletes data entries.
- **Search Entry**: Searches for data entries by email.
- **Sort and Filter**: Sorts and filters data entries by age.

## Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9 or higher
- An IDE like IntelliJ IDEA, Eclipse, or NetBeans
- Maven (if using Maven for project management)

## Project Structure
FormWebAssignment/ ├── src/ │ └── main/ │ └── java/ │ └── com/ │ └── userservelet/ │ └── formwebassignment/ │ └── controllers/ │ ├── FormServlet.java │ ├── UpdateServlet.java │ ├── DeleteServlet.java │ ├── SearchServlet.java │ └── SortFilterServlet.java │ └── model/ │ ├── DataManager.java │ └── Entry.java ├── web/ │ └── WEB-INF/ │ └── web.xml │ ├── form.jsp │ ├── update.jsp │ ├── delete.jsp │ ├── search.jsp │ ├── sortFilter.jsp │ ├── sortedFilteredResults.jsp │ └── navigationBar.jsp └── data.xml


## Deployment Instructions
1. **Clone the Repository**: Clone the project repository to your local machine.
   ```sh
   git clone <repository-url>
Open the Project: Open the project in your preferred IDE.

Configure Tomcat: Ensure that Apache Tomcat is configured in your IDE.

Build the Project: If using Maven, build the project using the following command:

mvn clean install
Deploy the Application: Deploy the application to the Tomcat server. In most IDEs, you can right-click the project and select "Run on Server".

Access the Application: Open a web browser and navigate to:

http://localhost:8080/FormWebAssignment_war_exploded/

Usage Instructions
Add Entry:

Navigate to the "Add Entry" page using the navigation bar.
Fill out the form with the required details (Name, Age, Email).
Click "Submit" to save the entry.
Update Entry:

Navigate to the "Update Entry" page using the navigation bar.
Enter the ID of the entry you want to update.
Fill out the new details (Name, Age, Email).
Click "Update" to save the changes.
Delete Entry:

Navigate to the "Delete Entry" page using the navigation bar.
Enter the ID of the entry you want to delete.
Click "Delete" to remove the entry.
Search Entry:

Navigate to the "Search Entry" page using the navigation bar.
Enter the email of the entry you want to search for.
Click "Search" to find the entry.
Sort and Filter:

Navigate to the "Sort and Filter" page using the navigation bar.
Select the sorting order (Ascending/Descending) and enter the age range.
Click "Apply" to view the sorted and filtered results.
Troubleshooting
404 Error: Ensure that the URL is correct and matches the servlet mappings in web.xml.
500 Error: Check the server logs for detailed error messages and stack traces.
Form Validation Errors: Ensure all required fields are filled out correctly.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
For any questions or issues, please contact [Your Name] at [your-email@example.com].