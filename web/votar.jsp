<%-- 
    Document   : votar
    Created on : 30/04/2019, 21:33:39
    Author     : Internet
--%>

<%@page import="DbContext.CandidatoDAO"%>
<%@page import="Entities.Candidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

   <%
            if (session.getAttribute("login") != null) {
                if ((Boolean) session.getAttribute("login")) {
                } else {
                    response.sendRedirect("");
                }
            }else{
                response.sendRedirect("");
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            
                
            CandidatoDAO dao = new CandidatoDAO();
        

        %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
<style>
    body{
        margin: 20px 10% 20px 10%;
    }
</style>

    </head>
    <body>
            <ul class="list-group list-group-flush" style="width: 100%;">
              <div class="card-header">
                Candidatos
              </div>
            <%
            for(Candidato x: dao.getCandidatosByEleicao(id)){
                out.print("<li class=\"list-group-item\"><a href='votarCadidato.jsp?id="+x.getId()+"'>Votar em "+x.getNome()+"</a></li>");
            }
            %>
        </ul>
    </body>
</html>
