<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">
        <m:execute className="com.metamug.plugin.RequestExample" var="execRes" param="${mtgReq}"/>

        <m:xrequest output="true" var="xreq" url="https://postman-echo.com/post" method="POST" >
           <m:header name="Content-Type" value="application/json"/>
           <m:xbody>
               {
                   "foo1": "Hello",
                   "foo2": ${bus['execRes'].name}"
               }
           </m:xbody>
        </m:xrequest>

    </m:request>

</m:resource>
