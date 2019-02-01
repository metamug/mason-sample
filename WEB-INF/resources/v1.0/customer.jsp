<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">

        <c:if test="${mtgReq.params['q'] eq 1}">
             <sql:query var="result" dataSource="${datasource}"> SELECT * from customer </sql:query>
             <c:set target="${masonOutput}" property="getReq1" value="${result}"/>
        </c:if>
        <c:if test="${mtgReq.params['q'] eq 2}">
             <sql:query var="result" dataSource="${datasource}"> SELECT 'HELLO WHEN!' </sql:query>
             <c:set target="${masonOutput}" property="getReq1" value="${result}"/>
        </c:if>

    </m:request>

    <m:request method="GET" item="true">
        <sql:query var="result" dataSource="${datasource}">
              SELECT * from customer where customer_id=?
        <sql:param value="${mtgReq.id}"/>
        </sql:query>
       <c:set target="${masonOutput}" property="getReq2"  value="${result}"/>
    </m:request>
</m:resource>
