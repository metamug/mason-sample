<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="mtg-mason.tld" prefix="m" %>
<%@ page trimDirectiveWhitespaces="true" %>

<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<c:choose>
    <c:when test="${mtgReq.method eq 'GET'}">
        <c:choose>
            <c:when test="${not empty mtgReq.id}">
                <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer where customer_id=? 
                    <sql:param value="${mtgReq.id}"/>
  	         </sql:query>	     
            </c:when>    
    
	     <c:otherwise>
	         <sql:query var="result" dataSource="jdbc/mtgDataSource"> SELECT * from customer 
                </sql:query>
	     </c:otherwise>
        </c:choose>
  
        <c:set target="${requestScope.map}" property="d0" value="${result}"/>
     
        <m:out value="${map}" tableName="customer"/>
    </c:when>

    <c:otherwise>
        <m:status value="405" message="Method not defined"/>
    </c:otherwise>
 
</c:choose>
