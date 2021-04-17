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
		  
		  myAdm.createAccount();
		  
		  response.sendRedirect("/index.jsp");
	  }

	 
	}