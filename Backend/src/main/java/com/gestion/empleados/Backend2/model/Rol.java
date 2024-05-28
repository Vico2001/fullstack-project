package com.gestion.empleados.Backend2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Rol")
public class Rol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Rol")
    private Integer idRol;

    @Column(name = "RolName")
    private String rolName;

    public Rol(Integer idRol, String rolName) {
        this.idRol = idRol;
        this.rolName = rolName;
    }

    public Integer getIdRol() {
        return idRol;
    }

    public void setIdRol(Integer idRol) {
        this.idRol = idRol;
    }

    public String getRolName() {
        return rolName;
    }

    public void setRolName(String rolName) {
        this.rolName = rolName;
    }
}
