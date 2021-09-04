package controller;

import model.Patient;

import java.sql.Time;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import service.PatientService;


import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class PatientController {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private PatientService patientService;

    public PatientController(PatientService patientService) {
        this.patientService = patientService;
    }

    // Get all patient
    @CrossOrigin
    @RequestMapping(path = "/patients", method = RequestMethod.GET)
    public List<Patient> getPatients() {
        return patientService.getPatients();
    }

    // Create new patient
    @CrossOrigin
    @RequestMapping(path = "/patients", method = RequestMethod.POST)
    public int add(@RequestBody Patient patient) {
        return patientService.addPatient(patient);
    }

    // Delete patient by patient id
    @CrossOrigin
    @RequestMapping(path = "/patients/{id}", method = RequestMethod.DELETE)
    public void deletePatient(@PathVariable int id) {
        patientService.deletePatient(id);
    }

    // Update patient by patient username
    @CrossOrigin
    @RequestMapping(path = "/patients/{username}", method = RequestMethod.PUT)
    public void updatePatientbyUser(@PathVariable String username, @RequestBody Patient patient) {
        patientService.updatePatientbyUser(username, patient);
    }

    // Get patient by patient username
    @CrossOrigin
    @RequestMapping(path = "/patients/{username}", method = RequestMethod.GET)
    public Patient getPatientbyUser(@PathVariable String username) {
        return patientService.getPatientbyUser(username);
    }


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
