package Tiw.Tesina3;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


				//https://stackoverflow.com/questions/2422468/how-to-upload-files-to-server-using-jsp-servlet

@WebServlet(name = "MyAdminUpload", value = "/upload")
@MultipartConfig
public class MyAdminUpload extends HttpServlet {		
	private UserService userService;
	private DatastoreService ds;
	  
	  
	  public MyAdminUpload () {
			userService = UserServiceFactory.getUserService();
			ds = DatastoreServiceFactory.getDatastoreService();
		} 
	  
	  
	  
	        /*
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
		    */
	  
	  
	  
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	  {
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		
		try {
			
			List<FileItem> multifiles = sf.parseRequest(request);
			
			for(FileItem item : multifiles)
			{
				item.write(new File("C:\\Users\\basen\\git\\Tesina-Questura\\Tesina3\\src\\main\\webapp\\File_Creati"+item.getName()));
				
			
			BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\basen\\git\\Tesina-Questura\\Tesina3\\src\\main\\webapp\\File_Creati"+item.getName()));
			String line;
			
			int cont_fine=0;
			line = br.readLine(); System.out.println(line);
			line = br.readLine(); System.out.println(line);   // skip line 1 and 2
			while(true) {
				
				line=br.readLine();
				System.out.println(line);
				if(cont_fine>10) {System.out.println("Fine");break;}
				if(line.matches(".*[a-zA-Z].*")==false){cont_fine++;System.out.println("Vuota");continue;}
				if(line.matches(".*[a-zA-Z].*")==true){
					cont_fine=0;
					String[] e = line.toLowerCase().replaceAll("\"", "").split(";");
					String as = e[0].trim();
					String scuola = e[1].trim();
					String comune = e[2].trim();
					String via = e[3].trim();
					String grado= e[4].trim();
					String titolo = e[5].trim();
					String periodo_da = e[6].trim();
					String periodo_a = e[7].trim();
					String soggetto = e[8].trim();
					String n_ore = e[9].trim();
					String n_studenti = e[10].trim();
					String eta_da = e[11].trim();
					String eta_a = e[12].trim();
					String chiave = e[13].trim();
					
				
				//System.out.println(anno+";"+regione+";"+cod+";"+nome+";"+indirizzo+";"+comune+";"+provincia);
				
			
					Entity x = new Entity("EVENTI");
					x.setProperty("as", as);
					x.setProperty("scuola", scuola);
					x.setProperty("comune", comune);
					x.setProperty("via", via);
					x.setProperty("grado",grado );
					x.setProperty("titolo", titolo);
					x.setProperty("periodo_da", periodo_da);
					x.setProperty("periodo_a", periodo_a);
					x.setProperty("soggetto", soggetto);
					x.setProperty("n_ore", n_ore);
					x.setProperty("n_studenti", n_studenti);
					x.setProperty("eta_da", eta_da);
					x.setProperty("eta_a", eta_a);
					x.setProperty("chiave", chiave);
					ds.put(x);
					System.out.println("Piena");
					
			}}
			}	
		}catch (Exception e){
			e.printStackTrace();

		}
			
			System.out.println("file creato :D, Questo testo non verrà mai stampato!");
			
			
			
			
			
		
		
		
		  
		}

	 
	}