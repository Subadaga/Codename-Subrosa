package dao;

import java.io.FileNotFoundException;
import java.io.IOException;

public class PruebaDb {
    
    public static void main (String args[]) throws FileNotFoundException, IOException{
        
        DbConnection conn = new DbConnection();
        //CandidatoDao candidatoDao = new CandidatoDao(conn);
        //List<Candidato> gobernadores = candidatoDao.getGobernadorPorEstado(9);
        //List<Candidato> presidentes = candidatoDao.getPresidentePorEstado();
        conn.disconnect();
        /*
        for(Candidato candidato: gobernadores){
            System.out.println(candidato.getNombre());
        }
        for(Candidato candidato: presidentes){
            System.out.println(candidato.getNombre());
        }
        
        DbConnection conn = new DbConnection();
        VotanteDao votanteDao = new VotanteDao(conn);
        Votante votante = votanteDao.getUltima();
        conn.disconnect();
        
        System.out.println(votante.toString());*/
    }
}
