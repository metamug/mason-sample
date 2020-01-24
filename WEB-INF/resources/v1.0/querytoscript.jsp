<jsp:directive.include file="../fragments/mason-init.jspf"/>
<m:resource>

    <m:request method="GET">
        <sql:query var="q" dataSource="${datasource}">
            SELECT * from movie
        </sql:query>
        <c:set target="${output}" property="query" value="${q}"/>
        <m:script file="qtos.groovy" var="scriptOut" />
        <c:set target="${output}" property="sout" value="${scriptOut}"/>
    </m:request>

</m:resource>
