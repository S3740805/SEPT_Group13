package service;

import model.Doctor;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
@Service
public class DoctorService {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Get all doctor
    public List<Doctor> getAllDoctors() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Doctor");
        return query.list();
    }

    // Get doctor by username of admin
    public List<Doctor> getDoctorbyUser(String userName) {
        Query query = this.sessionFactory.getCurrentSession()
                .createQuery("from Doctor where userName=:userName");
        query.setString("userName", userName);
        return query.list();
    }

    // Create new doctor
    public int addDoctor(Doctor doctor) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(doctor);
        return doctor.getId();
    }

    // Delete doctor by doctor id
    public void deleteDoctor(int id) {
        Query query = this.sessionFactory.getCurrentSession()
                .createQuery("from Doctor where id=:id");
        query.setInteger("id", id);
        Doctor doctor = (Doctor) query.uniqueResult();
        this.sessionFactory.getCurrentSession().delete(doctor);
    }

    // Update doctor by doctor id
    public void updateDoctor(int id, Doctor doctor) {
        Query query = this.sessionFactory.getCurrentSession().createQuery("from Doctor where id=:id");
        //query.setInteger("id", id);
        doctor.setId(id);
        this.sessionFactory.getCurrentSession().update(doctor);
    }

}
