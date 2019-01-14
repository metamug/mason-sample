<jsp:directive.include file="../../fragments/taglibs.jspf"/>
<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>
<mtg:header value="${header.accept}"/>
<mtg:group value="supplier"/>
<c:choose>
 <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
 <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer 
</sql:query>
 <c:set target="${requestScope.map}" property="d0" value="${result}"/>
 <mtg:out value="${map}" type="${header.accept}" tableName="custauth"/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
 <mtg:status value="404" message="Resource not found."/>
 </c:when>

 <c:otherwise>
 <mtg:status value="405" message="Method not defined"/>
 </c:otherwise>
</c:choose>
