<jsp:directive.include file="../../fragments/taglibs.jspf"/>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<c:choose>
    <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
        <sql:query var="result" dataSource="jdbc/mason"> SELECT * from customer
        </sql:query>
        <c:set target="${requestScope.map}" property="d0" value="${result}"/>

        <sql:query var="result" dataSource="jdbc/mason"> SELECT * from customer
        </sql:query>
        <c:set target="${requestScope.map}" property="d1" value="${result}"/>

        <sql:query var="result" dataSource="jdbc/mason"> SELECT * from customer 
        </sql:query>
        <c:set target="${requestScope.map}" property="d2" value="${result}"/>

        <m:out value="${map}" tableName="customers"/>
    </c:when>

    <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
        <m:status value="404" message="Resource not found."/>
    </c:when>

    <c:otherwise>
        <m:status value="405" message="Method not defined"/>
    </c:otherwise>

</c:choose>
