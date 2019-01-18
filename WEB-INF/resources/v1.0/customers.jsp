<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="mtg-mason.tld" prefix="mtg" %>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<c:choose>
    <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
        <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer 
        </sql:query>
        <c:set target="${requestScope.map}" property="d0" value="${result}"/>
        
        <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer 
        </sql:query>
        <c:set target="${requestScope.map}" property="d1" value="${result}"/>
        
        <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer 
        </sql:query>
        <c:set target="${requestScope.map}" property="d2" value="${result}"/>
    
        <mtg:out value="${map}" tableName="customers"/>
    </c:when>

    <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
        <mtg:status value="404" message="Resource not found."/>
    </c:when>

    <c:otherwise>
        <mtg:status value="405" message="Method not defined"/>
    </c:otherwise>
 
</c:choose>
