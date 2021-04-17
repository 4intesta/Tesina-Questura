package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.*;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MyAdmin", value = "/myadmin")
public class MyAdmin{

	private UserService userService;
	private DatastoreService ds;
	
	
	
	
	public MyAdmin () {
		userService = UserServiceFactory.getUserService();
		ds = DatastoreServiceFactory.getDatastoreService();
	}
	
	
	
	
	
	public String getLoginUrl() {
		return userService.createLoginURL("/inedx.jsp");
	}
	
	
	
	
	
	public void createAccount() {
		Entity e = new Entity ("ACCOUNT CREATI");
		
		String uChar1 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar2 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar3 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar4 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar5 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar6 = String.valueOf((int) Math.floor(Math.random()*10));
		String usernameGenerato = uChar1+uChar2+uChar3+uChar4+uChar5+uChar6;
		
		String pChar1 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar2 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar3 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar4 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar5 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar6 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar7 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar8 = String.valueOf((int) Math.floor(Math.random()*10));
		
		String passwordGenerata = pChar1+pChar2+pChar3+pChar4+pChar5+pChar6+pChar7+pChar8;
		
		e.setProperty("username", usernameGenerato);
		e.setProperty("password", passwordGenerata);
		
		ds.put(e);
		
	}
	
	
	public void LeggiFileExcel (String file) {
		Entity e = new Entity ("ACCOUNT CREATI");
		
		String uChar1 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar2 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar3 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar4 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar5 = String.valueOf((int) Math.floor(Math.random()*10));
		String uChar6 = String.valueOf((int) Math.floor(Math.random()*10));
		String usernameGenerato = uChar1+uChar2+uChar3+uChar4+uChar5+uChar6;
		
		String pChar1 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar2 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar3 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar4 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar5 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar6 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar7 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar8 = String.valueOf((int) Math.floor(Math.random()*10));
		
		String passwordGenerata = pChar1+pChar2+pChar3+pChar4+pChar5+pChar6+pChar7+pChar8;
		
		e.setProperty("username", usernameGenerato);
		e.setProperty("password", passwordGenerata);
		
		ds.put(e);
		
	}
	
	
	
	
 
}
