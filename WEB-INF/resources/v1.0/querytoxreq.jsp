
<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="POST">
        <sql:query var="res" dataSource="${datasource}">
            SELECT * from movie WHERE id=?

            <sql:param value="${mtgReq.params['movie_id']}"/>
        </sql:query>
         <m:xrequest output="true" var="xreq" url="https://postman-echo.com/post" method="POST" >
            <m:header name="Content-Type" value="application/json"/>
            <m:xbody>
                {
                    "foo1": ${res.rows[0].name },
                    "foo2": ${res.rows[0].rating }"
                }
            </m:xbody>
      </m:xrequest>
    </m:request>

</m:resource>
