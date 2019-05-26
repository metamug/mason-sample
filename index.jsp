<!DOCTYPE html>
<html>
    <head>
        <title>Mason Sample</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Welcome</h1>
    	<hr/>
    	<h2>Examples</h2>
    	<hr/>
    	<%
    		java.io.File resources = new java.io.File(getServletContext().getResource("/WEB-INF/resources/v1.0/").toURI());
    		out.println("<ol>");
    		for(java.io.File file: resources.listFiles())
    			out.println("<li><a href='./v1.0/"+file.getName().replaceFirst("[.][^.]+$", "")+"'>"+file.getName()+"</a></li>");
    		out.println("</ol>");
    	 %>

    </body>
</html>
