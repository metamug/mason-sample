<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="mtg-mason.tld" prefix="mtg" %>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>
<mtg:header value="${header.accept}"/>
<c:choose>
 <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
 <sql:query var="result" dataSource="jdbc/mtgDataSource"> ${masonQuery['qry1']} 
</sql:query>
 <c:set target="${requestScope.map}" property="d0" value="${result}"/>
 <mtg:out value="${map}" type="${header.accept}" tableName="customer"/>
 </c:when>

 <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
 <mtg:status value="404" message="Resource not found."/>
 </c:when>

 <c:otherwise>
 <mtg:status value="405" message="Method not defined"/>
 </c:otherwise>
</c:choose>
