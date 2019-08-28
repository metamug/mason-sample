<jsp:directive.include file="../fragments/mason-init.jspf"/>
<m:resource>

    <m:request method="GET">
        <sql:query var="result" dataSource="${datasource}">
            SELECT * from movie

        </sql:query>

        <c:set target="${bus}" property="movie" value="${result}"/>

        <m:extract path="$[movie][2].name" />

        <m:execute className="com.metamug.plugin.ExtractExample" var="execRes" param="${mtgReq}" output="true">
    		    <m:arg name="foo1" value="${extract['[movie][2].name']}" />

    	  </m:execute>

    </m:request>

</m:resource>
