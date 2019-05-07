<%-- 
    Document   : protegida
    Created on : 15/05/2018, 10:11:12
    Author     : thiagograzianitraue
--%>

<%@page import="Entities.Candidato"%>
<%@page import="DbContext.CandidatoDAO"%>
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
    
               <jsp:useBean id="candidato" 
                     scope="page" 
                     class="Entities.Candidato"/>

        <jsp:setProperty name="candidato" 
                         property="nome" 
        value='<%=request.getParameter("nome")%>'/>
        
         <jsp:setProperty name="candidato" 
                         property='idEleicao'
         value='<%=Integer.parseInt(request.getParameter("id_eleicao"))%>'/>
    
                 <%
            if (session.getAttribute("login") != null) {
                if ((Boolean) session.getAttribute("login")) {

                } else {
                    response.sendRedirect("index.html");
                }
            }
        %>

        <%
            boolean resultado = true;
            CandidatoDAO dao = new CandidatoDAO();
            if(candidato.getNome() == null || candidato.getNome() == "")
                out.print("Não foi possível cadastrar o candidato nome era nulo!");
            else
                resultado = dao.addCandidasto(candidato);
        %>
         
    </head>
    
    <body>
        <h2>
            <%
            if(!resultado)
                out.print("Candidato cadastrado!!!");
            else
                out.print("Não foi possível cadastrar o candidato!");
            %>
        </h2>

    </body>
</html>
