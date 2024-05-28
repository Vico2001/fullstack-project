package com.gestion.empleados.Backend2.controllers;

import com.gestion.empleados.Backend2.Application.UseCases.UsuarioService;
import com.gestion.empleados.Backend2.model.Persona;
import com.gestion.empleados.Backend2.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/")
@CrossOrigin(origins = "http://localhost:4200")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/usuarios/crear")
    public ResponseEntity<?> crearUsuario(@RequestBody Persona persona) {
        try {
            Persona nuevaPersona = usuarioService.crearUsuario(persona);
            return new ResponseEntity<>(nuevaPersona, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
