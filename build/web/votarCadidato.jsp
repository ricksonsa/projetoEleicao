<%-- 
    Document   : votarCadidato
    Created on : 30/04/2019, 22:26:03
    Author     : Internet
--%>

<%@page import="Entities.Candidato"%>
<%@page import="Entities.Usuario"%>
<%@page import="DbContext.VotosDAO"%>
<%@page import="DbContext.CandidatoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <%
            if (session.getAttribute("login") != null) {
                if ((Boolean) session.getAttribute("login")) {
                } else {
                    response.sendRedirect("index.html");
                }
            }else{
                response.sendRedirect("");
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
        
            VotosDAO dao = new VotosDAO();
            
            Usuario user = dao.getUsuarioByNome((String)session.getAttribute("usuario"));
            
            Candidato cand = dao.getCandidatoById(id);
            
            String resultado = dao.addVoto(user, cand);
            

        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%out.print(resultado);%></h1>
    </body>
</html>
