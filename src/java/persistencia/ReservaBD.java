/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import dominio.Reserva;
import java.util.ArrayList;

/**
 *
 * @author le_gu
 */
public class ReservaBD {
    private static ArrayList<Reserva> lista = new ArrayList<Reserva>();
    
    public static void inserir(Reserva novaReserva){
        lista.add(novaReserva);
    }
        
    public static void alterar(Reserva romariaAlterada){
        excluir(romariaAlterada.getCodigo());
        inserir(romariaAlterada);
    }
    
    public static void excluir(int codigo){
        for(int i=0; i < lista.size(); i++){
            Reserva cadaReserva = lista.get(i);
            if (cadaReserva.getCodigo() == codigo){
                lista.remove(i);
                break;
            }
        }
    }
    
    public static ArrayList<Reserva> listar(){
        return lista;
    }
}
