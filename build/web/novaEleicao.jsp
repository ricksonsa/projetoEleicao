<%-- 
    Document   : protegida
    Created on : 15/05/2018, 10:11:12
    Author     : thiagograzianitraue
--%>

<%@page import="Entities.Eleicao"%>
<%@page import="DbContext.EleicaoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

   <%
            if (session.getAttribute("login") != null) {
                if ((Boolean) session.getAttribute("login")) {
                } else {
                    response.sendRedirect("index.html");
                }
            }else{
                response.sendRedirect("");
            }
        %>
           <%
            request.setCharacterEncoding("UTF-8");
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="eleicao" 
                     scope="page" 
                     class="Entities.Eleicao"/>

        <jsp:setProperty name="eleicao" 
                         property="nome" 
        value='<%=request.getParameter("nome")%>'/>


        <jsp:setProperty name="eleicao" 
                         property="descricao" 
        value='<%=request.getParameter("descricao")%>'/>

        <%
            if (session.getAttribute("login") != null) {
                if ((Boolean) session.getAttribute("login")) {

                } else {
                    response.sendRedirect("novaEleicao.html");
                }
            }
        %>

        <%
            EleicaoDAO dao = new EleicaoDAO();
            
            dao.addEleicao(eleicao);
        %>



    </body>
</html>
