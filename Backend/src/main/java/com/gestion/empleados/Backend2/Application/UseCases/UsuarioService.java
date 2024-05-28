package com.gestion.empleados.Backend2.Application.UseCases;

import com.gestion.empleados.Backend2.model.Persona;
import com.gestion.empleados.Backend2.model.Usuario;
import com.gestion.empleados.Backend2.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public Persona crearUsuario(Persona persona) {
        String mail = generarCorreoElectronicoUnico(persona.getNombres(), persona.getApellidos());

        // Crear un nuevo usuario y establecer el correo generado
        Usuario usuario = new Usuario();
        usuario.setMail(mail);

        // Guardar el usuario en la base de datos
        usuarioRepository.save(usuario);

        return persona;
    }

    private String generarCorreoElectronicoUnico(String nombres, String apellidos) {
        // Convertir nombres y apellidos a minúsculas y eliminar espacios en blanco
        String nombresSinEspacios = nombres.toLowerCase().replaceAll("\\s+", "");
        String apellidosSinEspacios = apellidos.toLowerCase().replaceAll("\\s+", "");

        // Concatenar nombres y apellidos para formar parte del correo
        String correoBase = nombresSinEspacios + "." + apellidosSinEspacios;
        String correo = correoBase;
        int contador = 1;
        while (correoElectronicoExiste(correo)) {
            correo = correoBase + contador;
            contador++;
        }

        return correo + "@mail.com";
    }

    private boolean correoElectronicoExiste(String correo) {

        return false;
    }


    public boolean validarContraseña(String contraseña) {

        return contraseña.length() >= 8 && contieneLetraMayúscula(contraseña) && contieneNumero(contraseña) && contieneSigno(contraseña);
    }

    private boolean contieneLetraMayúscula(String contraseña) {
        return !contraseña.equals(contraseña.toLowerCase());
    }

    private boolean contieneNumero(String contraseña) {
        return contraseña.matches(".*\\d.*");
    }

    private boolean contieneSigno(String contraseña) {

        return contraseña.matches(".*[!@#$%^&*()-+=].*");
    }

}
