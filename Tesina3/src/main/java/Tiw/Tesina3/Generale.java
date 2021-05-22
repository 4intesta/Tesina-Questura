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

	public static HashMap<String,ArrayList<String>> chiaviCord(){
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


}
