package Tiw.Tesina3;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


	@WebServlet(name = "MyAdminUploadImg", value = "/uploadimg")
	@MultipartConfig
	public class MyAdminUploadImg extends HttpServlet {		
		private UserService userService;
		private DatastoreService ds;
		  
		  
		  public MyAdminUploadImg () {
				userService = UserServiceFactory.getUserService();
				ds = DatastoreServiceFactory.getDatastoreService();
			} 

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	  {
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		
		try {
			
			List<FileItem> multifiles = sf.parseRequest(request);
			
			for(FileItem item : multifiles)
			{
				String Nome=item.getName().replace(" ", "").replace(".", "").replace("png", "").replace("jpg", "");
				
				item.write(new File("/Users/darioferrari/git/Tesina-Questura4/Tesina3/src/main/webapp/Immagini/"+Nome+".png"));
				
			
			}
			}catch (Exception e){
				e.printStackTrace();
			}}
	}
