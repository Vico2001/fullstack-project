package com.gestion.empleados.Backend2.Application.UseCases;

import com.gestion.empleados.Backend2.excepciones.ResourceNotFoundException;
import com.gestion.empleados.Backend2.model.Rol;
import com.gestion.empleados.Backend2.repository.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RolService {

    @Autowired
    private RolRepository rolRepository;

    public List<Rol> getAllRoles() {
        return rolRepository.findAll();
    }

    public Rol createRol(Rol rol) {
        return rolRepository.save(rol);
    }

    public Optional<Rol> getRolById(Integer id) {
        return rolRepository.findById(id);
    }

    public Rol updateRol(Integer id, Rol rolDetails) {
        Optional<Rol> optionalRol = rolRepository.findById(id);
        if (optionalRol.isPresent()) {
            Rol existingRol = optionalRol.get();
            existingRol.setRolName(rolDetails.getRolName());
            return rolRepository.save(existingRol);
        } else {
            throw new ResourceNotFoundException("Rol not found with id: " + id);
        }
    }

    public void deleteRol(Integer id) {
        Optional<Rol> optionalRol = rolRepository.findById(id);
        if (optionalRol.isPresent()) {
            rolRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("Rol not found with id: " + id);
        }
    }


}