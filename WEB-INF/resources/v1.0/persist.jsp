<jsp:directive.include file="../fragments/mason-init.jspf"/>

<jsp:useBean id="mtgPersist" class="java.util.LinkedHashMap" scope="request"/>

<m:resource>
    
    <m:request method="GET">
        <m:xrequest var="testXReq" url="https://jsonplaceholder.typicode.com/todos/1"
                  method="GET" >
        </m:xrequest>
        
        <m:convert target="${mtgPersist}" property="xreq" result="${testXReq}" />
       
        <m:execute className="com.metamug.plugin.ParamExample" var="execRes"
                   param="${mtgReq}" persistParam="${mtgPersist}" />
        
        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'resultName'
            <sql:param value="${mtgPersist['xreq.body.title']}"/>
        </sql:query>
            
        <c:set target="${masonOutput}" property="getResult" value="${result}"/>
    </m:request>

    <m:request method="GET" item="true">

        <sql:query var="result" dataSource="${datasource}">
            SELECT * from customer WHERE customer_id=?

            <sql:param value="${mtgReq.id}"/>
        </sql:query>
            
        <m:convert target="${mtgPersist}" property="query1" result="${result}" />

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'resultName'
            <sql:param value="${mtgPersist['query1.customer_name']}"/>
        </sql:query>

        <c:set target="${masonOutput}" property="getResult" value="${result}"/>

    </m:request>
            
    <m:request method="POST">
        <sql:query var="result" dataSource="${datasource}">
            SELECT * from customer WHERE customer_id=?

            <sql:param value="${mtgReq.params['customer_id']}"/>
        </sql:query>
        <m:convert target="${mtgPersist}" property="query1" result="${result}" />
	<m:xrequest var="xreq" url="https://postman-echo.com/post" method="POST" >
            <m:xheader name="Content-Type" value="application/json"/>
            <m:xbody>
                {
                    "foo1": ${mtgPersist['query1.customer_id']},
                    "foo2": "${mtgPersist['query1.customer_name']}"
                }
            </m:xbody>
    	</m:xrequest>
	<c:set target="${masonOutput}" property="xreqvalue" value="${xreq}"/>
    </m:request>

</m:resource>