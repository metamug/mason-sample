<jsp:directive.include file="../../fragments/taglibs.jspf"/>
<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<c:choose>
 <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
 <sql:query var="result" dataSource="${datasource}">SELECT * FROM movie
</sql:query>
 <c:set target="${requestScope.map}" property="d0" value="${result}"/>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${empty mtgReq.id and mtgReq.method eq 'POST'}">
 <m:upload/>
 <sql:update var="result" dataSource="${datasource}">INSERT INTO movie (name,rating) values ('test',1.0);
</sql:update>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${empty mtgReq.id and mtgReq.method eq 'DELETE'}">
 <sql:update var="result" dataSource="${datasource}">TRUNCATE TABLE movie
</sql:update>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'POST'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'DELETE'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:otherwise>
 <m:status value="405" message="Method not defined"/>
 </c:otherwise>
</c:choose>
