<jsp:directive.include file="../fragments/mason-init.jspf"/>
<m:resource>

    <m:request method="GET">
	<m:xrequest var="xreq" url="https://postman-echo.com/get?foo1=bar1&foo2=bar2"
                      method="GET" >
            <m:xheader name="Accept" value="application/json" />
    	</m:xrequest>
	<c:set target="${masonOutput}" property="xreqvalue" value="${xreq}"/>
    </m:request>
    
    <m:request method="POST">
	<m:xrequest var="xreq" url="https://postman-echo.com/post" method="POST" >
            <m:xheader name="Content-Type" value="application/json"/>
            <m:xbody>
                {
                    "foo1": "${mtgReq.params['foo1']}",
                    "foo2": ${mtgReq.params['foo2']}
                }
            </m:xbody>
    	</m:xrequest>
	<c:set target="${masonOutput}" property="xreqvalue" value="${xreq}"/>
    </m:request>

</m:resource>
