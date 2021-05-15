package Tiw.Tesina3;

import java.awt.RenderingHints.Key;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

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
	
/*

	public void createAdmin () {
		Entity e = new Entity ("ADMIN CREATI");String uChar1 = String.valueOf((int) Math.floor(Math.random()*10));
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
		String pChar9 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar10 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar11 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar12 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar13 = String.valueOf((int) Math.floor(Math.random()*10));
		String pChar14= String.valueOf((int) Math.floor(Math.random()*10));
		String pChar15= String.valueOf((int) Math.floor(Math.random()*10));
		String pChar16= String.valueOf((int) Math.floor(Math.random()*10));
		
		String passwordGenerata = pChar1+pChar2+pChar3+pChar4+pChar5+pChar6+pChar7+pChar8+pChar9+pChar10+pChar11+pChar12+pChar13+pChar14+pChar15+pChar16;
		
		e.setProperty("adminname", usernameGenerato);
		e.setProperty("password", passwordGenerata);
		
		ds.put(e);
	}
	
	*/
	
	public void createAccount(int num, String scuola) {
		
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
			e.setProperty("scuola", scuola);
			
			ds.put(e);
			
			
		}
	}
  String infoAccEl = "";
	
	public void deleteAccount(String user) {
		Query q = new Query("ACCOUNT CREATI");
		q.addFilter("username", FilterOperator.EQUAL, user.trim());
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(1));
		//System.out.println(list);
		if(list.size()>0) {
			com.google.appengine.api.datastore.Key azz = list.get(0).getKey();
			System.out.println(azz.toString());
			ds.delete(azz);
			infoAccEl = "L'ultimo account eliminato è: "+list.get(0).getProperty("username")+" ("+list.get(0).getProperty("scuola")+")";
		}
		else {
			System.out.println("L'account cercato non esiste");
			infoAccEl = "";
		}
		
	}
	
	public String infoEliminati() {
		String info = "";
		if(infoAccEl != "") {
			info = infoAccEl;
		}
		else {
			info = "L'account cercato non esiste";
		}
		return info;
	}
	
	
	public HashMap<String, String> getLoginAdminCred (){
		HashMap<String, String> logCred = new HashMap<String, String> ();
		Query q = new Query("ADMIN CREATI");
		FilterPredicate p = new FilterPredicate("password",FilterOperator.NOT_EQUAL,"");
		q.setFilter(p);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(999999));
		for(int i = 0; i<list.size();i++) {
			String user = list.get(i).getProperty("adminname").toString();
			String psw = list.get(i).getProperty("password").toString();
			logCred.put(user, psw);
		}
		return logCred;
	}
	
	
	public HashMap<String, String> getLoginCred (){
		HashMap<String, String> logCred = new HashMap<String, String> ();
		Query q = new Query("ACCOUNT CREATI");
		FilterPredicate p = new FilterPredicate("password",FilterOperator.NOT_EQUAL,"");
		q.setFilter(p);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(999999));
		for(int i = 0; i<list.size();i++) {
			String user = list.get(i).getProperty("username").toString();
			String psw = list.get(i).getProperty("password").toString();
			logCred.put(user, psw);
		}
		return logCred;
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
