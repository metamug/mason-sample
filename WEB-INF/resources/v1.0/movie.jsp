<jsp:directive.include file="../../fragments/taglibs.jspf"/>

<m:resource>

    <m:request method="GET">
       <sql:query var="result" dataSource="${datasource}">SELECT * FROM movie
       </sql:query>
       <c:set target="${masonOutput}" property="getResult" value="${result}"/>
    </m:request>

    <m:request method='POST'>
       <sql:update var="result" dataSource="${datasource}">
            INSERT INTO movie (name,rating) values (?,?);

            <sql:param value="${mtgReq.params['name']}"/>
            <sql:param value="${mtgReq.params['rating']}"/>
       </sql:update>
       <c:set target="${masonOutput}" property="postResult" value="${result}"/>
    </m:request>

    <m:request method='DELETE' item="true">
        <sql:update var="result" dataSource="${datasource}">
            DELETE FROM movie WHERE id=?

            <sql:param value="${mtgReq.id}"/>
        </sql:update>
        <c:set target="${masonOutput}" property="deleteResult" value="${result}"/>
    </m:request>

</m:resource>
