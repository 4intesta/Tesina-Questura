package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MyAdminCreScu", value = "/myadmincreatescu")

public class MyAdminCreScu  extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws IOException {
		  
		  MyAdmin myAdm = new MyAdmin ();
		  
		  String nome = request.getParameter("nome");
		  String tipo = request.getParameter("tipo");
		  String longitudine = request.getParameter("longitudine");
		  String latitudine = request.getParameter("latitudine");
		 
		  
		  myAdm.createScuola(nome, tipo, longitudine, latitudine);
		  
		  response.sendRedirect("/index.jsp");
	  }

	 
	}