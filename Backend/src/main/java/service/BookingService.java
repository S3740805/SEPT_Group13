package service;

import model.Booking;

import model.Doctor;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class BookingService {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Get all booking
    public List<Booking> getAllBooking() {
        return this.sessionFactory.getCurrentSession().createQuery("from Booking").list();
    }

    // Create new booking
    public int addBooking(Booking booking) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(booking);
        return booking.getId();
    }

    // Delete booking by booking id
    public void deleteBooking(int id) {
        Query query = this.sessionFactory.getCurrentSession()
                .createQuery("from Booking where id=:id");
        query.setInteger("id", id);
        Booking booking = (Booking) query.uniqueResult();
        this.sessionFactory.getCurrentSession().delete(booking);
    }

    // Get bookings by username of PATIENT
    public List<Booking> getBookingbyUser(String userName) {
        Query query = this.sessionFactory.getCurrentSession()
                .createQuery("from Booking where userName=:userName");
        query.setString("userName", userName);
        return query.list();
    }

    // Update booking by booking id
    public void updateBooking(int id, Booking booking) {
        Query query = this.sessionFactory.getCurrentSession().createQuery("from Booking where id=:id");
        //query.setInteger("id", id);
        booking.setId(id);
        this.sessionFactory.getCurrentSession().update(booking);
    }

}
