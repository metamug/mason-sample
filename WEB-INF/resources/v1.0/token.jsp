<jsp:directive.include file="../fragments/mason-init.jspf"/>

<m:resource>

    <m:request method="POST" >  
       <sql:query var="authQuery" dataSource="${datasource}" output="false" >
            SELECT r.user_id AS sub, r.role_name AS aud
            FROM usr_role r INNER JOIN usr u ON r.user_id=u.user_id
            WHERE u.user_name=? AND u.pass_word= ?
            <sql:param value="${mtgReq.params['user']}"/>
            <sql:param value="${mtgReq.params['pass']}"/>
       </sql:query>
       <m:execute classname="com.metamug.mason.plugin.TokenGenerator">         
         <m:arg name="aud" value="${authQuery.rows[0].aud}" />  
         <m:arg name="sub" value="${authQuery.rows[0].sub}" />  
       </m:execute>
    </m:request>

</m:resource>

