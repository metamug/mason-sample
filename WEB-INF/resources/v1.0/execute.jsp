<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="GET">
        <m:execute className="com.metamug.plugin.RequestExample" var="execRes" param="${mtgReq}"/>

        <c:set target="${masonOutput}" property="getResult" value="${execRes}" />
    </m:request>

</m:resource>
