package model;

import model.Booking;
import org.junit.Assert;
import org.junit.Test;

import java.sql.Time;
import java.sql.Date;


public class BookingModelTest {

    Booking booking = new Booking(1, 1, 1,
            new Time(9, 30, 0),
            new Date(2020, 8, 6));

    @Test
    public void bookingModelTest() {
    }

    @Test
    public void testGetId() {
        int expected = 1;
        int actual = booking.getId();
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void testGetPatientId() {
        int expected = 1;
        int actual = booking.getPatient_id();
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void testGetDoctorId() {
        int expected = 1;
        int actual = booking.getDoctor_id();
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void testTime() {
        Time expected = new Time(9, 30, 0);
        Time actual = booking.getTime();
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void testDate() {
        Date expected = new Date(2020, 8, 6);
        Date actual = booking.getDate();
        Assert.assertEquals(expected, actual);
    }
}
