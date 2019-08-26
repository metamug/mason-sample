<jsp:directive.include file="../fragments/mason-init.jspf"/>
<m:resource>
    <m:request method="GET">
        <m:execute className="com.metamug.plugin.sftp.FileDownload" var="execRes" param="${mtgReq}" output="true" 
        	onerror="android.com" >
    		<m:xparam name="host" value="your.host.net" />
            <m:xparam name="user" value="server" />
            <m:xparam name="password" value="password" />
            <m:xparam name="dir" value="/home/user/projects/files" />
    	</m:execute>
        <c:set target="${masonOutput}" property="getResult" value="${execRes}" />
    </m:request>
</m:resource>
