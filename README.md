Sample Java web application containing REST APIs developed using <a href="https://github.com/metamug/mason" target="_blank">Mason</a> REST API framework.

The JSPs representing the REST resources can be found inside the `WEB_INF/resources` directory separated by folders representing the version string. 

The URL endpoint for the REST API created by each resource JSP is `/{webappDirectoryName}/{version}/{resourceName}`. For example the endpoint for the resource file *WEB_INF/resources/v1.0/movies.jsp* shall be `/{webappDirectoryName}/v1.0/movies`.
