package controller;

import model.Booking;

import model.Doctor;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import service.BookingService;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class BookingController {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private BookingService bookingService;

    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    // get all booking
    @CrossOrigin
    @RequestMapping(path = {"/", "/bookings"}, method = RequestMethod.GET)
    public List<Booking> getBooking() {
        return bookingService.getAllBooking();
    }

    // Create new booking
    @CrossOrigin
    @RequestMapping(path = "/bookings", method = RequestMethod.POST)
    public int addBooking(@RequestBody Booking booking) {
        return bookingService.addBooking(booking);
    }

    // Delete booking by booking id
    @CrossOrigin
    @RequestMapping(path = "/bookings/{id}", method = RequestMethod.DELETE)
    public void deleteBooking(@PathVariable int id) {
        bookingService.deleteBooking(id);
    }

    // Get bookings by username of PATIENT
    @CrossOrigin
    @RequestMapping(path = "/bookings/{userName}", method = RequestMethod.GET)
    public List<Booking> getBookingbyUser(@PathVariable String userName) {
        return bookingService.getBookingbyUser(userName);
    }

    //Update booking by booking Id
    @CrossOrigin
    @RequestMapping(path = "/bookings/{id}", method = RequestMethod.PUT)
    public void updateBooking(@PathVariable int id, @RequestBody Booking booking) {
        bookingService.updateBooking(id, booking);
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
