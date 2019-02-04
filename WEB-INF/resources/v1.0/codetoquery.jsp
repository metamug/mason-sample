<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">
        <m:execute className="com.metamug.plugin.RequestExample" var="execRes" param="${mtgReq}"/>

        <sql:query var="result" dataSource="${datasource}">
            SELECT * from customer WHERE customer_id=?

            <sql:param value="${execRes.id}"/>
        </sql:query>
        <c:set target="${masonOutput}" property="getResult" value="${result}" />
    </m:request>

</m:resource>
