package com.gestion.empleados.Backend2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUsuario;

    private String userName;

    private String password;

    private String mail;

    private String sessionActive;

    public Usuario(Long idUsuario, String userName, String password, String mail, String sessionActive) {
        this.idUsuario = idUsuario;
        this.userName = userName;
        this.password = password;
        this.mail = mail;
        this.sessionActive = sessionActive;
    }

    public Usuario() {

    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getSessionActive() {
        return sessionActive;
    }

    public void setSessionActive(String sessionActive) {
        this.sessionActive = sessionActive;
    }
}
