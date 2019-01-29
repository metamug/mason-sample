<jsp:directive.include file="../../fragments/taglibs.jspf"/>

<m:resource auth="supplier">

    <m:request method="GET">
        <sql:query var="result" dataSource="${datasource}"> SELECT * from customer
        </sql:query>

        <c:set target="${masonOutput}" property="d0" value="${result}"/>

    </m:request>

</m:resource>
