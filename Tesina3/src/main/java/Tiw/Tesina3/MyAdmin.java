package Tiw.Tesina3;

import java.io.BufferedReader;
import java.io.FileReader;
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
	
	
	public void load() {
		try {
			BufferedReader br = new BufferedReader(new FileReader("/Users/darioferrari/git/Tesina-Questura3/Tesina3/src/main/webapp/File_Creati/Dati.csv"));
			String line;
			
			int cont_fine=0;
			br.readLine();
			br.readLine();// skip line 1 and 2
			while(true) {
				line=br.readLine();
				if(cont_fine>10)break;
				if(!line.contains("[a-zA-Z]+")) {cont_fine++;continue;}
				if(!line.contains("[a-zA-Z]+"))cont_fine=0;
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
				String età_da = e[11].trim();
				String età_a = e[12].trim();
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
				x.setProperty("età_da", età_da);
				x.setProperty("età_a", età_a);
				x.setProperty("chiave", chiave);
				ds.put(x);
				
			}
			br.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
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
