package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Valoracion {
    int id, idPaciente, idEvaluacionPaciente, idCuidador, idTratamiento, idRecursos, idFamilia;
    int idEconomia, idServicioMedico, idMaltrato, idVivienda, idDiagnostico, idAbordaje;
    String fecha, abordaje;
    
    final String DISPLAY = "dd/MM/yyyy";
    final String DATABASE = "yyyy/MM/dd";

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public int getIdEvaluacionPaciente() {
        return idEvaluacionPaciente;
    }

    public void setIdEvaluacionPaciente(int idEvaluacionPaciente) {
        this.idEvaluacionPaciente = idEvaluacionPaciente;
    }

    public int getIdCuidador() {
        return idCuidador;
    }

    public void setIdCuidador(int idCuidador) {
        this.idCuidador = idCuidador;
    }

    public int getIdTratamiento() {
        return idTratamiento;
    }

    public void setIdTratamiento(int idTratamiento) {
        this.idTratamiento = idTratamiento;
    }

    public int getIdRecursos() {
        return idRecursos;
    }

    public void setIdRecursos(int idRecursos) {
        this.idRecursos = idRecursos;
    }

    public int getIdFamilia() {
        return idFamilia;
    }

    public void setIdFamilia(int idFamilia) {
        this.idFamilia = idFamilia;
    }

    public int getIdEconomia() {
        return idEconomia;
    }

    public void setIdEconomia(int idEconomia) {
        this.idEconomia = idEconomia;
    }

    public int getIdServicioMedico() {
        return idServicioMedico;
    }

    public void setIdServicioMedico(int idServicioMedico) {
        this.idServicioMedico = idServicioMedico;
    }

    public int getIdMaltrato() {
        return idMaltrato;
    }

    public void setIdMaltrato(int idMaltrato) {
        this.idMaltrato = idMaltrato;
    }

    public int getIdVivienda() {
        return idVivienda;
    }

    public void setIdVivienda(int idVivienda) {
        this.idVivienda = idVivienda;
    }

    public int getIdDiagnostico() {
        return idDiagnostico;
    }

    public void setIdDiagnostico(int idDiagnostico) {
        this.idDiagnostico = idDiagnostico;
    }

    public int getIdAbordaje() {
        return idAbordaje;
    }

    public void setIdAbordaje(int idAbordaje) {
        this.idAbordaje = idAbordaje;
    }
    
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        fecha = fecha.replace("-", "/");
        if(fecha.length()>1){
            fecha = fecha.substring(0,10);
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(DATABASE);
                Date d = sdf.parse(fecha);
                sdf.applyPattern(DISPLAY);
                fecha = sdf.format(d);
                this.fecha = fecha;
            } catch (ParseException ex) {
                Logger.getLogger(Cuidador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.fecha = fecha;
    }

    public String getAbordaje() {
        return abordaje;
    }

    public void setAbordaje(String abordaje) {
        this.abordaje = abordaje;
    }
    
    
}
