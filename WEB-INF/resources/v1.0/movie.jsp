<jsp:directive.include file="../../fragments/taglibs.jspf"/>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<c:choose>
 <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
 <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * FROM movie 
</sql:query>
 <c:set target="${requestScope.map}" property="d0" value="${result}"/>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${empty mtgReq.id and mtgReq.method eq 'POST'}">
 <sql:update var="result" dataSource="jdbc/mtgDataSource"> insert into movie (name,rating) values (? ,? ) 
<sql:param value="${mtgReq.params['name']}" />
<sql:param value="${mtgReq.params['rating']}" />
</sql:update>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'PUT'}">
 <sql:update var="result" dataSource="jdbc/mtgDataSource"> update movie set rating=? where id=? 
<sql:param value="${mtgReq.params['rating']}" />
<sql:param value="${mtgReq.id}"/>
</sql:update>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'DELETE'}">
 <sql:update var="result" dataSource="jdbc/mtgDataSource"> delete from movie where id=? 
<sql:param value="${mtgReq.id}"/>
</sql:update>
 <c:set target="${requestScope.map}" property="d1" value="${result}"/>
 <m:out value="${map}" tableName="movie"/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'POST'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:when test="${empty mtgReq.id and mtgReq.method eq 'PUT'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:when test="${empty mtgReq.id and mtgReq.method eq 'DELETE'}">
 <m:status value="404" message="Resource not found."/>
 </c:when>

 <c:otherwise>
 <m:status value="405" message="Method not defined"/>
 </c:otherwise>

</c:choose>
