/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;


/**
 *
 * @author alumno
 */
public class EntidadBancaria implements Serializable {

    private int idEntidadBancaria;
    private List<SucursalBancaria> sucursalesBancarias = new ArrayList<>();
    
    @Size(min = 3, max = 20)
    @NotBlank
    private String codigoEntidadBancaria;
    @Size(min = 2, max = 30)
    private String nombre;
    private String cif;
    private TipoEntidadBancaria tipoEntidadBancaria;

    //Constructor Vacio
    public EntidadBancaria() {
    }

    //Constructor Sobrecargado
    public EntidadBancaria(int idEntidad, String codigoEntidad, String nombre, String cif/*, TipoEntidadBancaria tipoEntidadBancaria*/) {
        this.idEntidadBancaria = idEntidad;
        this.codigoEntidadBancaria = codigoEntidad;
        this.nombre = nombre;
        this.cif = cif;
      //  this.tipoEntidadBancaria = tipoEntidadBancaria;
    }

    public List<SucursalBancaria> getSucursalesBancarias() {
        return sucursalesBancarias;
    }

    public void setSucursalesBancarias(List<SucursalBancaria> sucursalesBancarias) {
        this.sucursalesBancarias = sucursalesBancarias;
    }

    public int getIdEntidadBancaria() {
        return idEntidadBancaria;
    }

    public void setIdEntidadBancaria(int idEntidad) {
        this.idEntidadBancaria = idEntidad;
    }

    public String getCodigoEntidadBancaria() {
        return codigoEntidadBancaria;
    }

    public void setCodigoEntidadBancaria(String codigoEntidadBancaria) {
        this.codigoEntidadBancaria = codigoEntidadBancaria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif;
    }

    public TipoEntidadBancaria getTipoEntidadBancaria() {
        return tipoEntidadBancaria;
    }

    public void setTipoEntidadBancaria(TipoEntidadBancaria tipoEntidadBancaria) {
        this.tipoEntidadBancaria = tipoEntidadBancaria;
    }
}
