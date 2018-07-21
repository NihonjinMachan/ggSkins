<%@ page language="java" import= "java.util.*" import="bean.Product" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" class="products">
<head>
    <meta charset="utf-8" />
	<title>Premium Skins</title>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:200" rel="stylesheet"/> 
</head>
<body>
<%
String pname = request.getParameter("product");
int price = Integer.parseInt(request.getParameter("price"));
Vector<Product> plist;
if(session.getAttribute("plist") == null){
	session.setAttribute("plist", new Vector<Product>());
}
plist = (Vector<Product>)session.getAttribute("plist");
Product pro = new Product(pname, price);
plist.addElement(pro);
session.setAttribute("plist", plist);

%>

<div class="navbar">
            <div class="logo"><a href="index.xhtml"><img width="65" height="55" alt="logo" src="images/logo.png"></img></a></div>
			<ul class ="list1">
				<li><a href ="products.xhtml">Products</a></li>
				<li><a href=""> Contact Us </a></li>
				<li><a href=""> Blog </a></li>
                <li><a href=""> Log In </a></li>
				<li><a href="cart.jsp"> Cart </a></li>
			</ul>
</div>

<div class="text">
    <p><%out.print(pname.toUpperCase()); %></p>
</div>
    

 <div class="productsdiv">  
    <div class="content">
				<ul> 
				<li> 
				<% 
				out.print("You have successfully added "+ pname + " for AED " + price + " to the cart.");
				%>
				</li>
				<form>
				<button class="cartbutton" type="submit" formaction="products.xhtml">CONTINUE SHOPPING</button>
				<button class="cartbutton" formaction="cart.jsp">GO TO CART</button>
				</form>
				</ul>
                
    </div>

    
    <div class="footer1">
        <ul>
		<li><a href="legal.html">Legal</a></li>
		<li><a href="">Site Map</a></li>
        <li><a href="">Careers</a></li>
        <li><a href="">Social Media</a></li>
		</ul>
    </div>
    
</div> 
</body>
</html>