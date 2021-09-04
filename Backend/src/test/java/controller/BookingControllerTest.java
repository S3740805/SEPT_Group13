package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Booking;
import model.Doctor;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import service.BookingService;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.mockito.BDDMockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class BookingControllerTest {
    private MockMvc mockMvc;

    @Mock
    private BookingService bookingService;

    @InjectMocks
    private BookingController bookingController;

    public static String asJsonString(final Object obj) {
        try {
            return new ObjectMapper().writeValueAsString(obj);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Before
    public void init() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(bookingController).build();
    }

    // Test GET all bookings
    @Test
    public void shouldReturnGetAll() throws Exception {
        List<Booking> bookings = new ArrayList();
        bookings.add(new Booking(1, 1, null, null));
        bookings.add(new Booking(2, 1, null, null));

        given(bookingService.getAllBooking()).willReturn(bookings);
        mockMvc.perform(get("/bookings"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].doctor_id", is(1)))
                .andExpect(jsonPath("$[0].patient_id", is(1)));
        verify(bookingService, times(1)).getAllBooking();
    }

    // Test GET bookings by username
    @Test
    public void shouldReturnGetBookingsbyUsername() throws Exception {
        Booking booking1 = new Booking(1, 1, null, null, "patient123");
        Booking booking2 = new Booking(1, 2, null, null, "patient123");
        List<Booking> bookings = new ArrayList();
        bookings.add(booking1);
        bookings.add(booking2);
        given(bookingService.getBookingbyUser(booking1.getUserName())).willReturn(bookings);
        mockMvc.perform(get("/bookings/" + booking1.getUserName()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].userName", is(booking2.getUserName())))
                .andExpect(jsonPath("$[1].userName", is(booking2.getUserName())));
        verify(bookingService, times(1)).getBookingbyUser("patient123");
    }

    // Test POST a booking
    @Test
    public void shouldMakeNewBooking() throws Exception {
        Booking booking = new Booking(1, 1, null, null);
        given(bookingService.addBooking(booking)).willReturn(booking.getId());
        mockMvc.perform(
                post("/bookings")
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .accept(MediaType.APPLICATION_JSON_UTF8)
                        .content(asJsonString(booking)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", is(booking.getId())));
        verify(bookingService, times(1)).addBooking(Mockito.any(Booking.class));
    }

    // Test DELETE booking by ID
    @Test
    public void shouldCancelBooking() throws Exception {
        Booking booking = new Booking(1, 1, null, null);
        given(bookingService.addBooking(booking)).willReturn(booking.getId());
        doNothing().when(bookingService).deleteBooking(booking.getId());
        mockMvc.perform(
                delete("/bookings/{id}", booking.getId()))
                .andExpect(status().isOk());
        verify(bookingService, times(1)).deleteBooking(booking.getId());
    }

    // Test PUT booking by ID
    @Test
    public void shouldUpdateBooking() throws Exception {
        Booking booking = new Booking(1, 1, null, null);
        given(bookingService.addBooking(booking)).willReturn(booking.getId());
        doNothing().when(bookingService).updateBooking(booking.getId(), booking);
        mockMvc.perform(
                put("/bookings/{id}", booking.getId())
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .accept(MediaType.APPLICATION_JSON_UTF8)
                        .content(asJsonString(booking)))
                .andExpect(status().isOk());
    }
}
