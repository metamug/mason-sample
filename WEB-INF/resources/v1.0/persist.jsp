<jsp:directive.include file="../fragments/mason-init.jspf"/>

<jsp:useBean id="mtgPersist" class="java.util.LinkedHashMap" scope="request"/>

<m:resource>
    
    <m:request method="GET">
        <m:xrequest var="testXReq" url="https://jsonplaceholder.typicode.com/todos/1"
                  method="GET" >
        </m:xrequest>
        <c:set target="${masonOutput}" property="getResult" value="${testXReq}"/>
    </m:request>

    <m:request method="GET" item="true">

        <sql:query var="result" dataSource="${datasource}">
            SELECT * from customer WHERE customer_id=?

            <sql:param value="${mtgReq.id}"/>
        </sql:query>
        <m:convert target="${mtgPersist}" result="${result}" />

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'resultName'
            <sql:param value="${mtgPersist['customer_name']}"/>
        </sql:query>

        <c:set target="${masonOutput}" property="getResult" value="${result}"/>

    </m:request>

</m:resource>
