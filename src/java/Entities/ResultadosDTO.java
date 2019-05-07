/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

/**
 *
 * @author ricks
 */
public class ResultadosDTO {
    private String Eleicao;
    private String Candidato;
    private int Votos;

    public String getEleicao() {
        return Eleicao;
    }

    public void setEleicao(String Eleicao) {
        this.Eleicao = Eleicao;
    }

    public String getCandidato() {
        return Candidato;
    }

    public void setCandidato(String Candidato) {
        this.Candidato = Candidato;
    }

    public int getVotos() {
        return Votos;
    }

    public void setVotos(int Votos) {
        this.Votos = Votos;
    }
}
