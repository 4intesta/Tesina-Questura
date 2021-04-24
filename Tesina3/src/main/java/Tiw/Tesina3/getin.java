package Tiw.Tesina3;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@WebServlet(name = "getin", value = "/getin")
public class getin extends HttpServlet {
	
	MyAdmin myadm= new MyAdmin();

public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	String user = request.getParameter("username").toString();
	String pass = request.getParameter("password").toString();
	
	HashMap<String,String> logCred = myadm.getLoginCred();
	
	if(logCred.containsKey(user)) {
		System.out.println("ESISTE LO USER");
		
		if(logCred.get(user).trim().equals(pass.trim())) {     //HashMap.get(CHIAVEUSER) = PASSWORD
			response.sendRedirect("/home.jsp");
			System.out.println("E LA PASSWORD E' CORRETTA");
		}
		else {
			System.out.println("MA LA PASSWORD NON COINCIDE. Hai inserito "+pass+" dovevi inserire "+logCred.get(user));
		}	
	}
	else {
		System.out.println("LO USER NON ESISTE");
	}
	
}


public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
doGet(request,response);
}
}


