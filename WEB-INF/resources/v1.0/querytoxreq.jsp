<jsp:directive.include file="../fragments/mason-init.jspf"/>

<jsp:useBean id="mtgPersist" class="java.util.LinkedHashMap" scope="request"/>

<m:resource>

    <m:request method="POST">
        <sql:query var="result" dataSource="${datasource}">
            SELECT * from movie WHERE id=?

            <sql:param value="${mtgReq.params['movie_id']}"/>
        </sql:query>
        <c:set target="${bus}" property="movie" value="${result}"/>

        <m:extract var="foo1"  path="$[movie][0].name" />
        <m:extract  var="foo2"  path="$[movie][0].rating" />
         <m:xrequest output="true" var="xreq" url="https://postman-echo.com/post" method="POST" >
            <m:header name="Content-Type" value="application/json"/>
            <m:xbody>
                {
                    "foo1": ${extract['foo1']},
                    "foo2": ${extract['foo2']}"
                }
            </m:xbody>
      </m:xrequest>
    </m:request>

</m:resource>
