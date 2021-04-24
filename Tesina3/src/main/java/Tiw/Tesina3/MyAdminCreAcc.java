package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MyAdminCreAcc", value = "/myadmincreate")

public class MyAdminCreAcc  extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws IOException {
		  
		  MyAdmin myAdm = new MyAdmin ();
		  
		  int num = Integer.parseInt(request.getParameter("accDaGenerare"));
		  String scuola = request.getParameter("scuola");
		  String user = request.getParameter("username");
		  String pass = request.getParameter("password");
		  
	
		  
		  
		  myAdm.createAccount(num, scuola);
		  
		  response.sendRedirect("/index.jsp");
		  System.out.println(scuola+" "+user+" "+pass);
	  }

	  
	}