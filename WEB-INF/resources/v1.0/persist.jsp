<jsp:directive.include file="../fragments/mason-init.jspf"/>

<jsp:useBean id="mtgPersist" class="java.util.LinkedHashMap" scope="request"/>

<m:resource>

    <%--<m:request method="GET">
        <m:xrequest var="testXReq" url="https://jsonplaceholder.typicode.com/todos/1"
                  method="GET" >
        </m:xrequest>

        <m:convert target="${mtgPersist}" property="xreq" value="${testXReq}" />

        <m:execute className="com.metamug.plugin.RequestExample" var="execRes"
                   param="${mtgReq}" persistParam="${mtgPersist}" />

        <c:set target="${mtgPersist}" property="execres" value="${execRes}" />

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'xreqResult',? AS 'execr'
            <sql:param value="${mtgPersist['xreq.body.title']}"/>
            <sql:param value="${mtgPersist['execres'].name}"/>
        </sql:query>

        <c:set target="${masonOutput}" property="getResult" value="${result}"/>
    </m:request>--%>

    <m:request method="GET" item="true">

        <sql:query var="result" dataSource="${datasource}">
            SELECT * from movie WHERE id=?

            <sql:param value="${mtgReq.id}"/>
        </sql:query>

        <c:set target="${MASON_BUS}" property="movie" value="${result}"/>

        <m:extract path="$[movie][0].name" />

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'movieName'
            <sql:param value="${extracted['[movie][0].name']}"  />
        </sql:query>

        <c:set target="${masonOutput}" property="getResult" value="${result}"/>

    </m:request>
<%--
    <m:request method="POST">
        <sql:query var="result" dataSource="${datasource}">
            SELECT * from customer WHERE customer_id=?

            <sql:param value="${mtgReq.params['customer_id']}"/>
        </sql:query>
        <m:convert target="${mtgPersist}" property="query1" value="${result}" />

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
    </m:request>--%>

</m:resource>
