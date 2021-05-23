package Tiw.Tesina3;

import com.google.appengine.api.utils.SystemProperty;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MyAdminModEve", value = "/modifyEve")

public class MyAdminModEve  extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws IOException {
		  
		  MyAdmin myAdm = new MyAdmin ();
		  
		  String titolo = request.getParameter("titolo").trim();
		  String as = request.getParameter("as").trim();
		  String scuola = request.getParameter("scuola").trim();
		  String comune = request.getParameter("comune").trim();
		  String via = request.getParameter("via").trim();
		  String grado = request.getParameter("grado").trim();
		  String periodo_da = request.getParameter("periodo_da").trim();
		  String periodo_a = request.getParameter("periodo_a").trim();
		  String soggetto = request.getParameter("soggetto").trim();
		  String n_ore = request.getParameter("n_ore").trim();
		  String n_studenti = request.getParameter("n_studenti").trim();
		  String eta_da = request.getParameter("eta_da").trim();
		  String eta_a = request.getParameter("eta_a").trim();
		  String keywords = request.getParameter("keywords").trim();
		  
		  
		  myAdm.modifyEventi(titolo, as, scuola, comune, via, grado,periodo_da, periodo_a, 
				  soggetto, n_ore, n_studenti, eta_da, eta_a, keywords);
		  
		  response.sendRedirect("/index.jsp");
	  }

	  
	}