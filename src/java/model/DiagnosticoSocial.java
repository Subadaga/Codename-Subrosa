package model;

public class DiagnosticoSocial {
    
    int id;
    boolean patologia, conflictoHistorico, conflictoActual, comunicacion, redFamiliar, redExtrafamiliar, redInstitucional, deteccionMaltrato, riesgosArquitectonicos;
    String familia, desgasteEmocional, redCuidados, supervision, colapsoCuidador, nivelSocioeconomico, observacion;
    String[] desapegosTerapeuticos, clasificacionesMaltrato, quejas;

    public DiagnosticoSocial(int id) {
        this.id = id;
    }
    
    public DiagnosticoSocial() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public boolean isPatologia() {
        return patologia;
    }

    public void setPatologia(boolean patologia) {
        this.patologia = patologia;
    }

    public boolean isConflictoHistorico() {
        return conflictoHistorico;
    }

    public void setConflictoHistorico(boolean conflictoHistorico) {
        this.conflictoHistorico = conflictoHistorico;
    }

    public boolean isConflictoActual() {
        return conflictoActual;
    }

    public void setConflictoActual(boolean conflictoActual) {
        this.conflictoActual = conflictoActual;
    }

    public boolean isComunicacion() {
        return comunicacion;
    }

    public void setComunicacion(boolean comunicacion) {
        this.comunicacion = comunicacion;
    }

    public boolean isRedFamiliar() {
        return redFamiliar;
    }

    public void setRedFamiliar(boolean redFamiliar) {
        this.redFamiliar = redFamiliar;
    }

    public boolean isRedExtrafamiliar() {
        return redExtrafamiliar;
    }

    public void setRedExtrafamiliar(boolean redExtrafamiliar) {
        this.redExtrafamiliar = redExtrafamiliar;
    }

    public boolean isRedInstitucional() {
        return redInstitucional;
    }

    public void setRedInstitucional(boolean redInstitucional) {
        this.redInstitucional = redInstitucional;
    }

    public boolean isDeteccionMaltrato() {
        return deteccionMaltrato;
    }

    public void setDeteccionMaltrato(boolean deteccionMaltrato) {
        this.deteccionMaltrato = deteccionMaltrato;
    }

    public boolean isRiesgosArquitectonicos() {
        return riesgosArquitectonicos;
    }

    public void setRiesgosArquitectonicos(boolean riesgosArquitectonicos) {
        this.riesgosArquitectonicos = riesgosArquitectonicos;
    }

    public String getFamilia() {
        return familia;
    }

    public void setFamilia(String familia) {
        this.familia = familia;
    }

    public String getDesgasteEmocional() {
        return desgasteEmocional;
    }

    public void setDesgasteEmocional(String desgasteEmocional) {
        this.desgasteEmocional = desgasteEmocional;
    }

    public String getRedCuidados() {
        return redCuidados;
    }

    public void setRedCuidados(String redCuidados) {
        this.redCuidados = redCuidados;
    }

    public String getSupervision() {
        return supervision;
    }

    public void setSupervision(String supervision) {
        this.supervision = supervision;
    }

    public String getColapsoCuidador() {
        return colapsoCuidador;
    }

    public void setColapsoCuidador(String colapsoCuidador) {
        this.colapsoCuidador = colapsoCuidador;
    }

    public String getNivelSocioeconomico() {
        return nivelSocioeconomico;
    }

    public void setNivelSocioeconomico(String nivelSocioeconomico) {
        this.nivelSocioeconomico = nivelSocioeconomico;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String[] getDesapegosTerapeuticos() {
        return desapegosTerapeuticos;
    }

    public void setDesapegosTerapeuticos(String[] desapegosTerapeuticos) {
        this.desapegosTerapeuticos = desapegosTerapeuticos;
    }

    public String[] getQuejas() {
        return quejas;
    }

    public String[] getClasificacionesMaltrato() {
        return clasificacionesMaltrato;
    }

    public void setClasificacionesMaltrato(String[] clasificacionesMaltrato) {
        this.clasificacionesMaltrato = clasificacionesMaltrato;
    }
    
    public void setQuejas(String[] quejas) {
        this.quejas = quejas;
    }
    
}
