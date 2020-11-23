<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<%
int category_id = Integer.parseInt(request.getParameter("category_id"));
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
int stock = Integer.parseInt(request.getParameter("stock"));
String description = request.getParameter("description");
String origin = request.getParameter("origin");


String query = "INSERT INTO PRODUCT(ID, CATEGORY_ID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN) " +
			   "VALUES(SEQ_PRODUCT.NEXTVAL, %d, '%s', %d, %d, '%s', '%s')";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  

	stmt.executeQuery(String.format(query, category_id, name, price, stock, description, origin));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>