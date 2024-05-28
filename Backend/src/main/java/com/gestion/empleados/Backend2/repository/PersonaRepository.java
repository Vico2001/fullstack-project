package com.gestion.empleados.Backend2.repository;

import com.gestion.empleados.Backend2.model.Persona;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonaRepository extends JpaRepository<Persona, Integer> {
}
