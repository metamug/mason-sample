<jsp:directive.include file="../../fragments/taglibs.jspf"/>
<jsp:useBean id="map" class="java.util.LinkedHashMap" scope="request"/>

<c:choose>
    <c:when test="${mtgReq.method eq 'GET'}">        

	<m:xrequest var="xreq" url="https://postman-echo.com/get?foo1=bar1&foo2=bar2"
                      method="GET" >		
            <m:xheader name="Accept" value="application/json" />                
    	</m:xrequest>
	
	<c:set target="${requestScope.map}" property="xreqvalue" value="${xreq}"/>
	<m:out value="${map}" tableName="customer"/>

    </c:when>

    <c:otherwise>
        <m:status value="405" message="Method not defined"/>
    </c:otherwise>
 
</c:choose>
