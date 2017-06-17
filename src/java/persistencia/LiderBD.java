/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Lider;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

/**
 *
 * @author le_gu
 */
public class LiderBD {
    private static ArrayList<Lider> lista = new ArrayList<Lider>();
    private static String caminho = "C:\\Users\\leandro\\Desktop\\";
    
    public static void inserir(Lider novoLider){
        lerXml();
        lista.add(novoLider);
        salvarXml();
    }
        
    public static void alterar(Lider liderAlterado){
        excluir(liderAlterado.getCpf());
        inserir(liderAlterado);
    }
    
    public static void excluir(String cpf){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Lider cadaLider = lista.get(i);
            if (cadaLider.getCpf().equals(cpf)){
                lista.remove(i);
                break;
            }
        }
        salvarXml();
    }
    
    public static ArrayList<Lider> listar(){
        lerXml();
        return lista;
    }
    
    //pega o que está no XML e coloca na lista 
    public static void lerXml(){
        File arquivo=new File(caminho + "lideres.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("lider",Lider.class);
            lista = (ArrayList<Lider>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Lider>();
        }
    }
    
    //pega o que está na lista e salva no XML
    public static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("lider",Lider.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "lideres.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }   
    }
         
}
