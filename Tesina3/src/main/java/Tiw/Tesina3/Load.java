package Tiw.Tesina3;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Load", value = "/load")
public class Load extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws IOException {
      
	MyAdmin myAdm = new MyAdmin ();
    myAdm.load();
    response.sendRedirect("/index.jsp");

  }
}