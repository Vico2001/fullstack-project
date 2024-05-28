package com.gestion.empleados.Backend2.Application.UseCases;

import com.gestion.empleados.Backend2.model.Persona;
import com.gestion.empleados.Backend2.repository.PersonaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonaService {

    private final PersonaRepository personaRepository;

    @Autowired
    public PersonaService(PersonaRepository personaRepository) {
        this.personaRepository = personaRepository;
    }

    public List<Persona> getAllPersonas() {
        return personaRepository.findAll();
    }

    public Optional<Persona> getPersonaById(int id) {
        return personaRepository.findById(id);
    }

    public Persona createPersona(Persona persona) {
        return personaRepository.save(persona);
    }

    public Persona updatePersona(int id, Persona personaDetails) {
        Optional<Persona> personaOptional = personaRepository.findById(id);
        if (personaOptional.isPresent()) {
            Persona persona = personaOptional.get();
            persona.setNombres(personaDetails.getNombres());
            persona.setApellidos(personaDetails.getApellidos());
            persona.setIdentificacion(personaDetails.getIdentificacion());
            persona.setFechaNacimiento(personaDetails.getFechaNacimiento());
            return personaRepository.save(persona);
        } else {
            // Manejar la excepción si la persona no se encuentra
            return null;
        }
    }

    public void deletePersona(int id) {
        personaRepository.deleteById(id);
    }
}
