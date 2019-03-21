### Deploy

Download [tomcat](https://tomcat.apache.org/download-90.cgi) and place the folder `mason-sample` in the `/webapps` directory.

Sample Java web application containing REST APIs developed using <a href="https://github.com/metamug/mason" target="_blank">Mason</a> REST API framework.

The JSPs representing the REST resources can be found inside the `WEB_INF/resources` directory separated by folders representing the version string. 

The URL endpoint for the REST API created by each resource JSP is `/{webappDirectoryName}/{version}/{resourceName}`. 

### Example

For example, the endpoint for the resource file *WEB_INF/resources/v1.0/customer.jsp* shall be `/{webappDirectoryName}/v1.0/customer`.
Assuming you deploy this webapp on [Tomcat](http://tomcat.apache.org/), you can make API request at 

```
http://localhost:8080/mason-sample/v1.0/customer
```

You can create more resources in the same manner.

### Database Connection

You can find the database connection in `META-INF/context.xml` file. This project uses <a href="https://github.com/brettwooldridge/HikariCP" target="_blank">HikariCP</a>.
You can checkout [Tomcat's guide on DBCP configuration with MySQL or other databases.](https://tomcat.apache.org/tomcat-9.0-doc/jndi-datasource-examples-howto.html#MySQL_DBCP_2_Example)
