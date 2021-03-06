<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" import= "java.util.*" import="bean.Product"%>

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
Vector<Product> plist = (Vector<Product>)session.getAttribute("plist");
int sum = (int) session.getAttribute("sum");
String name = request.getParameter("name");
String address = request.getParameter("address");
String email = request.getParameter("email");
String list = "";
for(Product p : plist){
	list += p.getName() + ",";
}
String entry = (name + "," + address + "," + email + "," + list + sum);
try {
    FileWriter fw = new FileWriter("D:\\Naqeeb\\CS\\Eclipse Workspace\\GGSkins\\info.txt",true);
    fw.write(entry + "\n");
    System.out.println(entry);
    fw.close();
} catch(IOException e) {
   out.println(e.getMessage());
}


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
    <p>PURCHASE SUMMARY</p>
</div>
    

 <div class="productsdiv">  
    <div class="content">
				<ul> 
				<li> 
				<p><%=request.getParameter("name") %> your purchase was successful, here is your summary: </p>
				<p>Address: <%=request.getParameter("address") %></p>
				<p>Email: <%=request.getParameter("email") %></p>
				<%
				for (int i = 0; i < plist.size(); i++){
					out.print("<p>" + plist.get(i).getName() + ": AED " + plist.get(i).getPrice() + "</p>");
				}
				out.print("<p style=\"color: #4d4d4d;\"> Total cost: AED " + sum + "</p>");
				plist.clear();
				%>
				</li>
				<form>
				<button class="cartbutton" formaction="index.xhtml">HOME</button>
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