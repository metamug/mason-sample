<jsp:directive.include file="../fragments/mason-init.jspf"/>
<m:resource>

    <m:request method="GET">
    	  <m:xrequest var="xreq" url="https://postman-echo.com/get?foo1=Hello&foo2=World"
                          method="GET" >
            <m:header name="Accept" value="application/json" />
        </m:xrequest>


        <m:extract path="$[xreq].body.args.foo1" />

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'foo1'
            <sql:param value="${extract['[xreq].body.args.foo1']}"/>
        </sql:query>

        <c:set target="${output}" property="qryResult" value="${result}"/>

    </m:request>

</m:resource>
