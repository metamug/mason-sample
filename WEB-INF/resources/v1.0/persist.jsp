<m:resource>

    <m:request method="GET">
        <m:xrequest var="testXReq" url="https://jsonplaceholder.typicode.com/todos/1"
                  method="GET" >
        </m:xrequest>

        <m:extract path="$[testXReq].body.title" />

        <m:execute className="com.metamug.plugin.RequestExample" var="execRes"
                   param="${mtgReq}" />

        <sql:query var="result" dataSource="${datasource}">
            SELECT ? AS 'xreqResult',? AS 'execr'
            <sql:param value="${extracted['[testXReq].body.title']}"/>
            <sql:param value="${MASON_BUS['execRes'].payload.name}"/>
        </sql:query>

        <c:set target="${masonOutput}" property="getResult" value="${result}"/>
    </m:request>

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

    <m:request method="POST">
        <sql:query var="result" dataSource="${datasource}">
            SELECT * from movie WHERE id=?

            <sql:param value="${mtgReq.params['movie_id']}"/>
        </sql:query>
        <c:set target="${MASON_BUS}" property="movie" value="${result}"/>

        <m:extract var="foo1"  path="$[movie][0].name" />
        <m:extract  var="foo2"  path="$[movie][0].rating" />
	       <m:xrequest output="true" var="xreq" url="https://postman-echo.com/post" method="POST" >
            <m:header name="Content-Type" value="application/json"/>
            <m:xbody>
                {
                    "foo1": ${extracted['foo1']},
                    "foo2": ${extracted['foo2']}"
                }
            </m:xbody>
    	</m:xrequest>
    </m:request>

</m:resource>
