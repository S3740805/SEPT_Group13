package service;

import model.Patient;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class PatientService {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Get all patient
    public List<Patient> getPatients() {
        return this.sessionFactory.getCurrentSession().createQuery("from Patient").list();
    }

    // Create new patient
    public int addPatient(Patient patient) {
        this.sessionFactory.getCurrentSession().save(patient);
        return patient.getId();
    }

    // Delete patient by patient id
    public void deletePatient(int id) {
        Query query = this.sessionFactory.getCurrentSession()
                .createQuery("from Patient where id=:id");
        query.setInteger("id", id);
        Patient patient = (Patient) query.uniqueResult();
        this.sessionFactory.getCurrentSession().delete(patient);
    }

    // Update patient by patient username
    public void updatePatientbyUser(String username, Patient patient) {
        Query query = this.sessionFactory.getCurrentSession().createQuery("from Patient where username=:username");
        patient.setUsername(username);
        this.sessionFactory.getCurrentSession().update(patient);
    }

    // Get patient by patient username
    public Patient getPatientbyUser(String username) {
        Query query = this.sessionFactory.getCurrentSession()
                .createQuery("from Patient where username=:username");
        query.setString("username", username);
        Patient patient = (Patient) query.uniqueResult();
        return patient;
    }

}
