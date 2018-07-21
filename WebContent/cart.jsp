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
int clear = 0;
int remove = 0;
int sum = 0;
Vector<Product> plist = (Vector<Product>)session.getAttribute("plist");

if (request.getParameter("clear") != null){
	plist.clear();
}

if(request.getParameter("remove") != null){
	remove = Integer.parseInt(request.getParameter("remove"));
	plist.remove(remove);
}

for (int i = 0; i < plist.size(); i++){
	sum += plist.get(i).getPrice();
}
session.setAttribute("sum", sum);
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
    <p style="margin-left: 47px;">CART</p>
</div>
    

 <div class="productsdiv">  
    <div class="content">
				<ul> 
				<li> 
				<%
				
				if (request.getParameter("clear") != null){
					out.print("<p>The cart has been emptied.</p>");
				}
				for (int i = 0; i < plist.size(); i++){
					out.print("<p>" + plist.get(i).getName() + ": AED " + plist.get(i).getPrice() + "<a style=\"text-decoration:none; color:#96281B; padding-left: 15px;\" href=\"cart.jsp?remove=" + i + "\">x</a>" + "</p>");
				}
				if(plist.size() != 0){
					out.print("<p style=\"color: #4d4d4d;\"> Total cost: AED " + sum + "</p>");
				}
				%>
				<form>
				<button class="cartbutton" type= "submit" name="clear" formaction="cart.jsp" formmethod="post" value="1">EMPTY CART</button>
				</form>
				<form method="post">
				<p style="margin-top: 50px; color: #4d4d4d; font-size: 1em;">DETAILS</p>
				<p><input type="text" name="name" value="" placeholder="Name" required></p>
      			<p><input type="text" name="address" value="" placeholder="Delivery Address" required></p>
      			<p><input type="email" name="email" value="" placeholder="Email" required></p>
				<%	
				if(plist.size() != 0){
					out.print("<button class=\"cartbutton\" type= \"submit\" formaction=\"checkout.jsp\">CHECKOUT</button>");
				} 
				%>
				</form>
				</li>
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