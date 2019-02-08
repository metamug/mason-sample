<jsp:directive.include file="../fragments/mason-init.jspf"/>

<jsp:useBean id="mtgPersist" class="java.util.LinkedHashMap" scope="request"/>

<m:resource>

    <m:request method="GET" item="true">

        <sql:query var="result" dataSource="${datasource}">
            SELECT * from customer WHERE customer_id=?

            <sql:param value="${mtgReq.id}"/>
        </sql:query>
        <c:set target="${mtgPersist}" property="query1" value="${result}"/>

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'resultName'
            <sql:param value="${mtgPersist['query1']}"/>
        </sql:query>

        <c:set target="${masonOutput}" property="getResult" value="${result}"/>

    </m:request>

</m:resource>
