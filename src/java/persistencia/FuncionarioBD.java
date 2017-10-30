package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Funcionario;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

public class FuncionarioBD {
    private static ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
    private static String caminho = "C:\\Users\\le_gu\\Desktop\\";
    
    public static void inserir(Funcionario novoFuncionario){
        lerXml();
        lista.add(novoFuncionario);
        salvarXml();
    }
        
    public static void alterar(Funcionario funcionarioAlterado){
        excluir(funcionarioAlterado.getCodigo());
        inserir(funcionarioAlterado);
    }
    
    public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Funcionario cadaFuncionario = lista.get(i);
            if (cadaFuncionario.getCodigo() == codigo){
                lista.remove(i);
                break;
            }
        }
        salvarXml();
    }
    
    public static ArrayList<Funcionario> listar(){
        lerXml();
        return lista;
    }
        
    //pega o que está no XML e coloca na lista 
    public static void lerXml(){
        File arquivo=new File(caminho + "funcionarios.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("funcionario",Funcionario.class);
            lista = (ArrayList<Funcionario>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Funcionario>();
        }
    }
    
    //pega o que está na lista e salva no XML
    public static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("funcionario",Funcionario.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "funcionarios.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }   
    }
    
    public static Funcionario procurarPorLoginSenha(String login, String senha){
        lerXml();
        Funcionario funcionarioEncontrado = null;
        for(int i=0; i < lista.size(); i++){
            Funcionario funcionario = lista.get(i);
            if (funcionario.getLogin().equals(login) && funcionario.getSenha().equals(senha)){
                funcionarioEncontrado = funcionario;
                break;
            }
        }
        return funcionarioEncontrado;
    }
}
