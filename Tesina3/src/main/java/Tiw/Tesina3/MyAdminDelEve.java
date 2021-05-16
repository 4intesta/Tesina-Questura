package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MyAdminDelEve", value = "/deleteEve")

public class MyAdminDelEve  extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws IOException {
		  
		  MyAdmin myAdm = new MyAdmin ();
		  String dati = request.getParameter("evento");
		  System.out.println(dati);
		  String evento = dati.substring(0, dati.lastIndexOf("(")-1);
		  String as = dati.substring(dati.indexOf("(")+1, dati.length()-1);
		  System.out.println(evento);
		  System.out.println(as);
		  myAdm.deleteEventi(evento, as);
		  
		  response.sendRedirect("/index.jsp");
	  }

	  
	}