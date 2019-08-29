<jsp:directive.include file="../fragments/mason-init.jspf"/>
<m:resource>

    <m:request method="GET">
        <sql:query var="queryResult" dataSource="${datasource}">
            SELECT * from movie
        </sql:query>

        <m:execute className="com.metamug.plugin.ExtractExample" var="execRes" param="${mtgReq}" output="true">
    		    <m:arg name="foo1" value="${queryResult.rows[2].name}" />

    	  </m:execute>

    </m:request>

</m:resource>
