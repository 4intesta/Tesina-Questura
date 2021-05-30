package Tiw.Tesina3;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

public class Generale {

	private UserService userService;
	private DatastoreService ds;
	
	public Generale () {
		userService = UserServiceFactory.getUserService();
		ds = DatastoreServiceFactory.getDatastoreService();
	}
	
	public static HashMap<String,ArrayList<String>> CordScuole() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		
		HashMap<String, ArrayList<String>> sc=new HashMap<String, ArrayList<String>>();
		
		for (Entity e : list) {
			ArrayList<String> a = new ArrayList<String> (); 		
			a.add(e.getProperty("latitudine").toString());
			a.add(e.getProperty("longitudine").toString());
			sc.put(e.getProperty("nome").toString(), a);
		}
		return sc;
	
}

	public static HashMap<String,ArrayList<String>> chiaviCordfattemalino(){
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		Query q1 = new Query("EVENTI");
		PreparedQuery pq1 = ds.prepare(q1);
		List<Entity> list1 = pq1.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		HashMap<String, ArrayList<String>> ev=new HashMap<String, ArrayList<String>>();
		for(Entity e:list1) {
			ArrayList<String> a = new ArrayList<String> ();

			for(Entity o:list) {
				if(e.getProperty("scuola").equals(o.getProperty("nome"))) {
					
					a.add(o.getProperty("latitudine").toString());
					a.add(o.getProperty("longitudine").toString());
					ev.put(e.getProperty("titolo").toString()+"ç"+e.getProperty("chiave").toString()+"ç"+e.getProperty("as").toString(), a);
				}
			}
			
		}

		return ev;
	}
	public static HashMap<String,ArrayList<ArrayList<String>>> chiaviCord(){
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		Query q1 = new Query("EVENTI");
		PreparedQuery pq1 = ds.prepare(q1);
		List<Entity> list1 = pq1.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		HashMap<String, ArrayList<ArrayList<String>>> ev=new HashMap<String, ArrayList<	ArrayList<String>>>();
		ArrayList<String> chiavi=new ArrayList<String>();
		for(Entity e:list1) {
			if(!chiavi.contains(e.getProperty("chiave").toString()))chiavi.add(e.getProperty("chiave").toString());
			
		}
		
		for(int i=0;i<chiavi.size();i++) {
		ArrayList<ArrayList<String>> coordinate  = new ArrayList<ArrayList<String>> ();
		for(Entity e:list1) {
			if(chiavi.get(i).equals(e.getProperty("chiave").toString())) {
			ArrayList<String>coordinata=new ArrayList<String>();
			for(Entity o:list) {
				if(e.getProperty("scuola").equals(o.getProperty("nome"))) {
					coordinata.add(o.getProperty("latitudine").toString());
					coordinata.add(o.getProperty("longitudine").toString());
					if(!coordinate.contains(coordinata))coordinate.add(coordinata);
				}
			}	
			System.out.println(coordinate);
		}
		}
		ev.put(chiavi.get(i), coordinate);
		}
 System.out.println(ev);
 
		return ev;
	}	
	
	
	public static HashMap<String,ArrayList<String>> ScuoleEv(){
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		Query q1 = new Query("EVENTI");
		PreparedQuery pq1 = ds.prepare(q1);
		List<Entity> list1 = pq1.asList(FetchOptions.Builder.withLimit(300));
		
		HashMap<String, ArrayList<String>> Sev=new HashMap<String, ArrayList<String>>();
		for(Entity a:list) {
			ArrayList<String> ar = new ArrayList<String> ();

			for(Entity b:list1) {
				if(a.getProperty("nome").equals(b.getProperty("scuola"))) {
					ar.add(b.getProperty("chiave").toString());
				}
			}
			Sev.put(a.getProperty("nome").toString(), ar);
		}
		return Sev;
	}


	public static HashMap<String,ArrayList<ArrayList<String>>> dateEv(){
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q1 = new Query("EVENTI");
		PreparedQuery pq1 = ds.prepare(q1);
		List<Entity> list1 = pq1.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		HashMap<String, ArrayList<ArrayList<String>>> ev=new HashMap<String, ArrayList<	ArrayList<String>>>();
		ArrayList<String> chiavi=new ArrayList<String>();
		for(Entity e:list1) {
			if(!chiavi.contains(e.getProperty("chiave").toString()))chiavi.add(e.getProperty("chiave").toString());
			
		}
		
		for(int i=0;i<chiavi.size();i++) {
		ArrayList<ArrayList<String>> date  = new ArrayList<ArrayList<String>> ();
		for(Entity e:list1) {
			if(chiavi.get(i).equals(e.getProperty("chiave").toString())&&!e.getProperty("periodo_da").toString().isEmpty()) {
			ArrayList<String>data=new ArrayList<String>();
			data.add(e.getProperty("periodo_da").toString());
			data.add(e.getProperty("periodo_a").toString());
			date.add(data);
		}
		}
		ev.put(chiavi.get(i), date);
		}
 System.out.println(ev);
 
		return ev;
	}	
}



