package Tiw.Tesina3;

import java.util.ArrayList;
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
		}
		return a;
	
}
}
