<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">
        <m:script file="test.groovy" var="res" />
        <sql:query var="result" dataSource="${datasource}">
              SELECT ? AS name
            <sql:param value="${res['message']}"/>
        </sql:query>
        <c:set target="${output}" property="getResult" value="${result}" />
    </m:request>

</m:resource>
