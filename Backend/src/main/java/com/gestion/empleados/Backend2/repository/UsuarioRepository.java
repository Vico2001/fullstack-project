package com.gestion.empleados.Backend2.repository;

import com.gestion.empleados.Backend2.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}