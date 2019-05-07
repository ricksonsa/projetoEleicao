/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

/**
 *
 * @author Internet
 */
public class Votos {
    private int Id_Usuario;
    private int Id_Candidato;

    public int getId_Usuario() {
        return Id_Usuario;
    }

    public void setId_Usuario(int Id_Usuario) {
        this.Id_Usuario = Id_Usuario;
    }

    public int getId_Candidato() {
        return Id_Candidato;
    }

    public void setId_Candidato(int Id_Candidato) {
        this.Id_Candidato = Id_Candidato;
    }
}
