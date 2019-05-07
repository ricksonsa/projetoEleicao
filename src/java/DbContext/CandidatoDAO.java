/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbContext;

import Config.Constantes;
import Entities.Candidato;
import Entities.Eleicao;
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
public class CandidatoDAO {
    private String idUsuario;
    private String usuario;
    private String senha;
    
    private static String urlBD = "jdbc:mysql://localhost:3306/eleicao";
    private static Connection conn = null;
    private static Statement stm = null;
    
    public List<Candidato> getCandidatosCombo() throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM tb_candidato";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        List<Candidato> lista = new ArrayList<>();

        while (resultados.next()) {
            Candidato candidato = new Candidato();
            candidato.setId(resultados.getInt("idCandidato"));
            candidato.setNome(resultados.getString("nome"));

            lista.add(candidato);
        }
        conn.close();
        return lista;
    }
    
    public boolean addCandidasto(Candidato candidato) throws ClassNotFoundException, SQLException {
        if(candidato.getNome() == null)
            return true;
        
        String query = "INSERT INTO tb_candidato(nome,idEleicao) VALUES('"+ candidato.getNome() +"',"+candidato.getIdEleicao()+")";
        
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(urlBD, Constantes.userDb, Constantes.passDb);
        stm = conn.createStatement();
        boolean result = stm.execute(query);
        conn.close();
        return result;        
    }
    
     public List<Candidato> getCandidatosByEleicao(int idEleicao) throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM tb_candidato Where idEleicao = "+ idEleicao;

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        List<Candidato> lista = new ArrayList<>();

        while (resultados.next()) {
            Candidato candidato = new Candidato();
            candidato.setId(resultados.getInt("idCandidato"));
            candidato.setNome(resultados.getString("nome"));

            lista.add(candidato);
        }
        conn.close();
        return lista;
    }
    
}
