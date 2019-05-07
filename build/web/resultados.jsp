<%-- 
    Document   : resultados
    Created on : 30/04/2019, 20:22:54
    Author     : Internet
--%>

<%@page import="Entities.ResultadosDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="Entities.Candidato"%>
<%@page import="DbContext.EleicaoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Eleicao"%>
<%@page import="Entities.Usuario"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eleições</title>
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
        <h1>Resultados da eleição</h1>
        
        <h1>Selecione a eleição para ver os resultados: </h1>
        <br/>
        <form method="POST" action="resultados.jsp">
            <%
                List<Eleicao> listaEleicoes = new ArrayList<>();
                EleicaoDAO eDAO = new EleicaoDAO();
                listaEleicoes = eDAO.getEleicoesCombo();
                String flagSelect = "";

                if (!listaEleicoes.isEmpty()) {
                    out.print("<select name=\"idEleicao\">");
                    for (Eleicao e : listaEleicoes) {
                        if (request.getParameter("idEleicao") != null) {
                            if (Integer.parseInt(request.getParameter("idEleicao")) == e.getId()) {
                                flagSelect = "selected";
                            }
                        }
                        out.print("<option value=\"" + e.getId()+ "\"" + flagSelect + ">" + e.getNome()+ "</option>");
                        flagSelect = "";
                    }
                    out.print("</select>");
                } else {
                    out.print("Nenhuma eleição cadastrada!");
                }
            %>
            <input type="submit" value="Ver resultados..."/>
            <br/><br/>

            <div class="card">
                <div class="card-header">
                  Resultados da eleição
                </div>
                <div class="card-body">
                    <%
                    if (request.getParameter("idEleicao") != null) {
                        int idEleicao = (Integer.parseInt(request.getParameter("idEleicao")));
                        
                            out.print("<table class=\"table\">");
                            out.print("<thead class=\"thead-dark\">");
                            out.print("<tr>");
                            out.print("<th scope=\"col\">Nome da eleição</th>");
                            out.print("<th scope=\"col\">Candidato</th>");
                            out.print("<th scope=\"col\">Total de votos</th>");
                            out.print("</tr>");
                            out.print("<br>");
    
                        for(ResultadosDTO e: eDAO.resultadosEleicao(idEleicao)){
                           out.print("<tr>");
                           out.print("<td>" + e.getEleicao()+ "</td>");
                            out.print("<td>" + e.getCandidato()+ "</td>");
                             out.print("<td>" + e.getVotos() + "</td>");
                             out.print("</tr>");
                        }
                       out.print("</table>");
                        
    
                    }else{
                        out.print("<br/>É preciso selecionar uma eleição para ver os votos");
                    }
                        
                %>
                </div>
              </div>

            
    </body>
</html>
