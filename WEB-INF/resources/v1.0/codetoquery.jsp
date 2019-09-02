<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">
        <m:execute className="com.metamug.plugin.RequestExample" var="execRes" param="${mtgReq}"/>

        <sql:query var="result" dataSource="${datasource}">
              SELECT ? AS name
            <sql:param value="${execRes.name}"/>
        </sql:query>
        <c:set target="${output}" property="getResult" value="${result}" />
    </m:request>

</m:resource>
