<jsp:directive.include file="../../fragments/taglibs.jspf"/>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>
<m:resource auth="supplier">
    <m:request method="GET">
       <sql:query var="result" dataSource="${datasource}"> SELECT * from customer </sql:query>
       <c:set target="${map}" property="getReq1" value="${result}"/>

    </m:request>
    <m:request method="GET" item="true">
        <sql:query var="result" dataSource="${datasource}">
              SELECT * from customer where customer_id=?
        <sql:param value="${mtgReq.id}"/>
        </sql:query>
       <c:set target="${map}" property="getReq2"  value="${result}"/>
    </m:request>
</m:resource>