/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbContext;

import Entities.Candidato;
import Entities.Eleicao;
import Entities.ResultadosDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Internet
 */
public class EleicaoDAO {

    private static String urlBD = "jdbc:mysql://localhost:3306/eleicao";
    Connection conn = null;
    private static Statement stm = null;

    public void addEleicao(Eleicao eleicao) throws ClassNotFoundException, SQLException {
        //INSERT INTO eleicao.tb_eleicao (`nomeEleicao`, descricao) VALUES ('Prefeitura de SP', 'Eleição para o bandido que vai comandar essa merda')

        String query = "INSERT INTO eleicao.tb_eleicao (`nomeEleicao`, descricao) VALUES ('" + eleicao.getNome() + "', '" + eleicao.getDescricao() + "')";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement();
        stm.execute(query);
    }
    
    public List<Eleicao> getEleicoes() throws ClassNotFoundException, SQLException {
        String query = "SELECT DISTINCT nomeEleicao,descricao FROM tb_eleicao";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        List<Eleicao> lista = new ArrayList<>();

        while (resultados.next()) {
            Eleicao eleicao = new Eleicao();
            //eleicao.setId(resultados.getInt("idEleicao"));
            eleicao.setNome(resultados.getString("nomeEleicao"));
            eleicao.setDescricao(resultados.getString("descricao"));

            lista.add(eleicao);
        }
        conn.close();
        return lista;
    }
    
    public List<Eleicao> getEleicoesCombo() throws ClassNotFoundException, SQLException {
        String query = "SELECT idEleicao,nomeEleicao,descricao FROM tb_eleicao";

        Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        List<Eleicao> lista = new ArrayList<>();

        while (resultados.next()) {
            Eleicao eleicao = new Eleicao();
            eleicao.setId(resultados.getInt("idEleicao"));
            eleicao.setNome(resultados.getString("nomeEleicao"));
            eleicao.setDescricao(resultados.getString("descricao"));

            lista.add(eleicao);
        }
        conn.close();
        return lista;
    } 
    
    public List<Eleicao> getResultadosEleicao(int idEleicao) throws ClassNotFoundException, SQLException {
        String query = "SELECT e.nomeEleicao, e.descricao, tb_candidato.nome" +
                    "FROM tb_eleicao as e" +
                    "INNER JOIN tb_candidato on e.idEleicao = tb_candidato.idEleicao" +
                    "WHERE e.idEleicao = " + idEleicao;
        
         Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int votos = 0;

        List<Eleicao> lista = new ArrayList<>();

        while (resultados.next()) {
           Eleicao eleicao = new Eleicao();
           eleicao.setId(resultados.getInt("idEleicao"));
           eleicao.setNome(resultados.getString("nomeEleicao"));
          eleicao.setDescricao(resultados.getString("descricao"));
          lista.add(eleicao);
        }
        conn.close();
        return lista;
    }
    
    public List<ResultadosDTO> resultadosEleicao(int idEleicao) throws ClassNotFoundException, SQLException{
        
        String simpleProc = "{ call LISTA_VOTOS("+idEleicao+") }";
         Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

       // Step-3: prepare the callable statement
        CallableStatement cs = conn.prepareCall(simpleProc);
        // Step-5: execute the stored procedures: proc3
        ResultSet resultados = cs.executeQuery();

        List<ResultadosDTO> lista = new ArrayList<>();

        while (resultados.next()) {
           ResultadosDTO results = new ResultadosDTO();
           results.setEleicao(resultados.getString("Eleicao"));
           results.setCandidato(resultados.getString("Nome"));
           results.setVotos(resultados.getInt("votos"));
           
           lista.add(results);
        }
        conn.close();
        return lista;
    }
}
