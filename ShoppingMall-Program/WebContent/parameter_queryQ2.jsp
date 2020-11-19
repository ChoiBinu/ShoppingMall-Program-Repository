<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border = "1">
<tr>
    <td>제품이름</td>
    <td>제품가격</td>
    <td>제품재고</td>
    <td>제품설명</td>
    <td>제품원산지</td>
</tr>
<%
String price = request.getParameter("product_price");
String stock = request.getParameter("product_stock");
String price_InequalitySign = request.getParameter("price_InequalitySign");
String stock_InequalitySign = request.getParameter("stock_InequalitySign");

String More = "이상";
String less = "이하";

try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    String query = " SELECT "
    			  +" NAME,PRICE,STOCK,DESCRIPTION,ORIGIN "
            	  +" FROM " 
            	  +" PRODUCT ";
    
    if(price != null) {
    	if(price_InequalitySign.equals(More)){
    		query += " WHERE PRICE >= " + price;
    	} else if(price_InequalitySign.equals(less)){
    		query += " WHERE PRICE <= " + price;
    	}
    }
   	
    if(stock != null) {
    	if(stock_InequalitySign.equals(More)){
    		query += " AND STOCK >= " + stock;
    	} else if(stock_InequalitySign.equals(less)){
    		query += " AND STOCK <= " + stock;
    	}
    }
    
    %> <%=query%> <%

    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
        %><tr><%
            %><td><%=rs.getString("NAME")%></td><%
            %><td><%=rs.getInt("PRICE")%></td><%
            %><td><%=rs.getInt("STOCK")%></td><%
            %><td><%=rs.getString("DESCRIPTION")%></td><%
            %><td><%=rs.getString("ORIGIN")%></td><%
        %><tr><%
    }

    con.commit();
    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%>
</table>

<p>가격</p>
<input type="text" id="price">
<p>이상,이하</p>
<input type="text" id="price_InequalitySign">
<p>재고</p>
<input type="text" id="stock">
<p>이상,이하</p>
<input type="text" id="stock_InequalitySign">
<input type="button" onclick="click_search()" VALUE="SEARCH">
<script>
    function click_search() {
        const product_price = document.getElementById("price").value;
        const price_InequalitySign = document.getElementById("price_InequalitySign").value;
        const product_stock = document.getElementById("stock").value;
        const stock_InequalitySign = document.getElementById("stock_InequalitySign").value;

        redirect_with_get_params(product_price,price_InequalitySign,product_stock,stock_InequalitySign);
    }
    
    function redirect_with_get_params(product_price,price_InequalitySign,product_stock,stock_InequalitySign) {
        window.location.href = 'parameter_queryQ2.jsp?product_price=' + product_price + '&price_InequalitySign=' + price_InequalitySign + '&product_stock=' + product_stock + '&stock_InequalitySign=' + stock_InequalitySign
    }
</script>
</body>
</html>