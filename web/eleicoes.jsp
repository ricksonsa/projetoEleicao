<%-- 
    Document   : eleicoes
    Created on : 30/04/2019, 21:22:14
    Author     : Internet
--%>

<%@page import="java.util.List"%>
<%@page import="Entities.Eleicao"%>
<%@page import="Entities.Eleicao"%>
<%@page import="DbContext.EleicaoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prova AV1</title>
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
     
           <%
            if (session.getAttribute("login") != null) {
                if ((Boolean) session.getAttribute("login")) {
                } else {
                    out.print("Você não pode estar aqui!");
                    response.sendRedirect("index.html");
                }
            }else{
                response.sendRedirect("index.html");
            }
        %>

 <%
        EleicaoDAO dao = new EleicaoDAO();
        List<Eleicao> eleicoes = dao.getEleicoesCombo();
%>
        
        
        <button type="button" onClick="redirect()" class="btn btn-link">Nova Eleição</button>
        <ul class="list-group list-group-flush" style="width: 100%;">
              <div class="card-header">
                Eleições
              </div>
            <%
            for(Eleicao x: eleicoes){
                out.print("<li class=\"list-group-item\">" + x.getNome()+"   -   " + x.getDescricao());
                out.print("<a style=\"float:right;\" href='votar.jsp?id="+x.getId()+"'>  Votar nesta eleição</a></li>");
            }
            %>
            
        </ul>
            <br>
            <div>
                
                <div class="card">
                <h5 class="card-header">Candidatos</h5>
                <div class="card-body">
            
                     <form action="novoCandidato.jsp" method="post">
                    
                    <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-default">Nome do candidato</span>
                    </div>
                    <input type="text" name="nome" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                  </div>
                    
                    
                    <div class="input-group">
                         <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Eleições</label>
                    </div>
  
                    <select name="id_eleicao" class="custom-select" id="inputGroupSelect01" placeholder="Selecione uma eleição">
                        <%
                             for(Eleicao x: dao.getEleicoesCombo()){
                                out.print("<option value='"+x.getId()+"'>" + x.getNome()+"</option>");
                            }
                        %>
                    </select>
                        
                    
                    <div class="input-group-append">
                      <button class="btn btn-secondary" type="submit">Adicionar candidato</button>
                    </div>
                  </div>
                    
                  </div>
                    
                </form>
                    
                </div>
              </div>
                
               
              <button type="button" onClick="resultados()" class="btn btn-link">Ver resultados da eleição</button>
                    
                
            </div>
        
                    
    </body>
    
       <SCRIPT LANGUAGE="JavaScript">
        <!--
        function redirect() {
            window.location.replace("novaEleicao.html");
        }
        
        function resultados() {
             window.location.replace("resultados.jsp");
        }

        function button1()
        {
            form1.submit();
        } 
        // --> 
         </SCRIPT>
</html>
