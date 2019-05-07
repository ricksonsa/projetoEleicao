/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbContext;

import Entities.Candidato;
import Entities.Eleicao;
import Entities.Usuario;
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
public class VotosDAO {

    private static String urlBD = "jdbc:mysql://localhost:3306/eleicao";
    private static Connection conn = null;
    private static Statement stm = null;

    public String addVoto(Usuario usuario, Candidato candidato) throws ClassNotFoundException, SQLException {
        //INSERT INTO eleicao.tb_eleicao (`nomeEleicao`, descricao) VALUES ('Prefeitura de SP', 'Eleição para o bandido que vai comandar essa merda')
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);

        String query = "SELECT * FROM tb_votos as votos, tb_candidato as candidatos WHERE votos.idUsuario = "+ usuario.getId() + " and candidatos.idCandidato = votos.idCandidato and candidatos.idEleicao = " + candidato.getIdEleicao();

        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        while (resultados.last()) {
            linhas = resultados.getRow();
            if(linhas>0)
                return "Erro - Você já votou nesta eleição!";
        }
        
        query = "INSERT INTO eleicao.tb_votos (`IDUSUARIO`, IDCANDIDATO) VALUES ('" + usuario.getId() + "', '" + candidato.getId() + "')";

        conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);
        stm = conn.createStatement();
        stm.execute(query);

        return "Voto contabilizado!!!";
    }

    public Candidato getCandidatoById(int id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);

        String query = "SELECT * FROM tb_candidato where idCandidato = " + id;

        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        Candidato user = new Candidato();
        while (resultados.next()) {
            user.setId(resultados.getInt("idCandidato"));
            user.setNome(resultados.getString("nome"));
            user.setIdEleicao(resultados.getInt("idEleicao"));
        }
        return user;
    }

    public Usuario getUsuarioByNome(String nome) throws ClassNotFoundException, SQLException {
        //INSERT INTO eleicao.tb_eleicao (`nomeEleicao`, descricao) VALUES ('Prefeitura de SP', 'Eleição para o bandido que vai comandar essa merda')
        Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(urlBD, Config.Constantes.userDb, Config.Constantes.passDb);

        String query = "SELECT * FROM usuario WHERE usuario = '" + nome + "'";

        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        //conta o número de linhas retornadas
        int linhas = 0;

        Usuario user = new Usuario();
        while (resultados.next()) {
            user.setId(resultados.getInt("idUsuario"));
            user.setUsuario(resultados.getString("usuario"));
        }
        return user;
    }

    //String sql = "INSERT INTO UNINOVE.\"tb_votos\" (IDUSUARIO, IDCANDIDATO) VALUES (" + idUsuario + " , " + idCandidato + ")";
}
