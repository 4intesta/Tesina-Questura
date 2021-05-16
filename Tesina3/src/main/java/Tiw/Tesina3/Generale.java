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
	
	public static ArrayList<String> longScuole() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		List<Filter> filters = new ArrayList<Filter>();
		Filter f = new FilterPredicate("longitudine",FilterOperator.NOT_EQUAL,"ZZZ");
		q.setFilter(f);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		ArrayList<String> a = new ArrayList<String> (); 
		for (Entity e : list) {
			a.add(e.getProperty("longitudine").toString());
			System.out.println(e.getProperty("longitudine"));
		}
		return a;
	
}
	public static ArrayList<String> latScuole() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("SCUOLE CREATE");
		List<Filter> filters = new ArrayList<Filter>();
		Filter f = new FilterPredicate("latitudine",FilterOperator.NOT_EQUAL,"ZZZ");
		q.setFilter(f);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(300));
		
		StringBuffer sb = new StringBuffer();
		ArrayList<String> a = new ArrayList<String> (); 
		for (Entity e : list) {
			a.add(e.getProperty("latitudine").toString());
			System.out.println(e.getProperty("latitudine"));
		}
		return a;
	
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
					ev.put(e.getProperty("titolo").toString()+"ç"+e.getProperty("chiave").toString(), a);
				}
			}
			
		}

		return ev;
	}
}
