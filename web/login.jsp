<%-- 
    Document   : login
    Created on : 15/05/2018, 08:58:49
    Author     : thiagograzianitraue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="Security" 
                     scope="page" 
                     class="DbContext.Security"/>

        <jsp:setProperty name="Security" 
                         property="usuario" 
                         value='<%=request.getParameter("usuario")%>'/>

        
        <jsp:setProperty name="Security" 
                         property="senha" 
                          value='<%=request.getParameter("senha")%>'/>
                    
                    

        <%

            String idUsuario = Security.autenticar();
            if (idUsuario == null) {
                out.print("Usuário ou senha incorretos");
                session.setAttribute("login", false);
            } else {
                
                session.setAttribute("login", true);
                session.setAttribute("usuario", request.getParameter("usuario"));
                response.sendRedirect("eleicoes.jsp");
            }

        %>
    </body>
</html>

