<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">
        <m:script file="test.groovy" var="script" />
        <sql:query var="result" dataSource="${datasource}">
              SELECT ? AS name
            <sql:param value="${script.message}"/>
        </sql:query>
        <c:set target="${output}" property="getResult" value="${result}" />
    </m:request>

</m:resource>
