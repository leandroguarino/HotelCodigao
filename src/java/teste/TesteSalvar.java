/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import dominio.Lider;
import persistencia.LiderBD;

/**
 *
 * @author le_gu
 */
public class TesteSalvar {
    public static void main(String[] args) {
        
        Lider lider = new Lider();
        lider.setNome("Vai curintia");
        lider.setCpf("123");
        LiderBD.inserir(lider);
        
        System.out.println("Cadastrado com sucesso");
        
    }
}
