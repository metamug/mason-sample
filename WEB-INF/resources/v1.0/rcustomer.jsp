<jsp:directive.include file="../../fragments/taglibs.jspf"/>
<m:resource>
    <m:request method="GET">
       <sql:query var="result" dataSource="jdbc/mason"> SELECT * from customer </sql:query>
       <c:set target="${masonOutput}" value="${result}"/> <!-- Mason output object is implicit here -->
    </m:request>
    <m:request method="GET" item="true">
        <sql:query var="result" dataSource="${datasource}"> 
              SELECT * from customer where customer_id=?
        <sql:param value="${mtgReq.id}"/>
        </sql:query>
       <c:set target="${masonOutput}" value="${result}"/> <!-- It will internally add to linked list-->
    </m:request> <!-- m:out value="${map}" tableName="customer"/ -->
</m:resource> <!-- m:status value="405" message="Method not defined"/ -->
