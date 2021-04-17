package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


				//https://stackoverflow.com/questions/2422468/how-to-upload-files-to-server-using-jsp-servlet

@WebServlet(name = "MyAdminUpload", value = "/upload")
@MultipartConfig
public class MyAdminUpload extends HttpServlet {		

	  @Override
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
		    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
		    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
		    InputStream fileContent = filePart.getInputStream();
		    
		    
//		    	https://stackoverflow.com/questions/309424/how-do-i-read-convert-an-inputstream-into-a-string-in-java
		    String result = new BufferedReader(new InputStreamReader(fileContent))
		    		   .lines().collect(Collectors.joining("\n"));
		    
		    response.setContentType("text/plain");
		    PrintWriter out = response.getWriter();
		    out.println("<html>");
		    out.println("<body>");
		    out.println("<p>"+fileContent+"</p>");
		    out.println("</body>");
		    out.println("</html>");
		    
		}

	 
	}