<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="mtg-mason.tld" prefix="m" %>
<%@ page trimDirectiveWhitespaces="true" %>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<mtg:group value="supplier"/>

<c:choose>
    <c:when test="${empty mtgReq.id and mtgReq.method eq 'GET'}">
        <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer 
        </sql:query>
        
        <c:set target="${requestScope.map}" property="d0" value="${result}"/>
        <m:out value="${map}" tableName="custauth"/>
    </c:when>

    <c:when test="${not empty mtgReq.id and mtgReq.method eq 'GET'}">
        <m:status value="404" message="Resource not found."/>
    </c:when>

    <c:otherwise>
        <m:status value="405" message="Method not defined"/>
    </c:otherwise>
</c:choose>
