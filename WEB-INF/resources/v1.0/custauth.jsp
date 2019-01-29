<jsp:directive.include file="../../fragments/taglibs.jspf"/>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<m:resource auth="supplier">


    <m:request method="GET">
        <sql:query var="result" dataSource="${datasource}"> SELECT * from customer 
        </sql:query>

        <c:set target="${requestScope.map}" property="d0" value="${result}"/>
        
    </m:request>

        
</m:resource>
