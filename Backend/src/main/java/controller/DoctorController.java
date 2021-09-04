package controller;

import model.Doctor;


import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import service.DoctorService;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class DoctorController {

    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private DoctorService doctorService;

    public DoctorController(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    // Get all doctors
    @CrossOrigin
    @RequestMapping(path = "/doctors", method = RequestMethod.GET)
    public List<Doctor> getDoctor() {
        return doctorService.getAllDoctors();
    }

    // Get doctor by username of ADMIN
    @CrossOrigin
    @RequestMapping(path = "/doctors/{userName}", method = RequestMethod.GET)
    public List<Doctor> getDoctorbyUser(@PathVariable String userName) {
        return doctorService.getDoctorbyUser(userName);
    }

    // Create new doctor
    @CrossOrigin
    @RequestMapping(path = "/doctors", method = RequestMethod.POST)
    public int addDoctor(@RequestBody Doctor doctor) {
        return doctorService.addDoctor(doctor);
    }

    // Delete doctor by doctor id
    @CrossOrigin
    @RequestMapping(path = "/doctors/{id}", method = RequestMethod.DELETE)
    public void deleteDoctor(@PathVariable int id) {
        doctorService.deleteDoctor(id);
    }

    // Update doctor by doctor id
    @CrossOrigin
    @RequestMapping(path = "/doctors/{id}", method = RequestMethod.PUT)
    public void updateDoctor(@PathVariable int id, @RequestBody Doctor doctor) {
        doctorService.updateDoctor(id, doctor);
    }


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
