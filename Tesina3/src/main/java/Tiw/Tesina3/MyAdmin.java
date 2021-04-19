package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.*;
import com.google.appengine.api.users.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
	
	
	public void createScuola(String nome, String tipo, String longitudine, String latitudine) {
		Entity e = new Entity ("SCUOLE CREATE");
		e.setProperty("nome", nome);
		e.setProperty("tipo", tipo);
		e.setProperty("longitudine", longitudine);
		e.setProperty("latitudine", latitudine);
		ds.put(e);
	}
		

	public static ArrayList<String> queryScuole() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		List<Filter> filters = new ArrayList<Filter>();
		Filter f = new FilterPredicate("nome",FilterOperator.NOT_EQUAL,"ZZZ");
		q.setFilter(f);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		ArrayList<String> a = new ArrayList<String> (); 
		for (Entity e : list) {
			a.add(e.getProperty("nome").toString());
		}
		return a;
	}
	
	
	
	
	public void createAccount(int num) {
		
		for(int i = 0; i<num; i++) {
		
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
