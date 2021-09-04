package controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import model.Doctor;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import service.DoctorService;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertEquals;
import static org.mockito.BDDMockito.*;
import static org.hamcrest.core.Is.is;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class DoctorControllerTest {
    private MockMvc mockMvc;

    @Mock
    private DoctorService doctorService;

    @InjectMocks
    private DoctorController doctorController;

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
        mockMvc = MockMvcBuilders
                .standaloneSetup(doctorController)
                .build();
    }

    // Test GET all doctors
    @Test
    public void shouldReturnGetAll() throws Exception {
        List<Doctor> datas = new ArrayList();
        datas.add(new Doctor("linh1", null, null));
        datas.add(new Doctor("linh2", null, null));
        given(doctorService.getAllDoctors()).willReturn(datas);
        mockMvc.perform(get("/doctors"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].name", is("linh1")))
                .andExpect(jsonPath("$[1].name", is("linh2")));
        verify(doctorService, times(1)).getAllDoctors();
    }

    // Test POST a doctor
    @Test
    public void shouldAddNewDoctor() throws Exception {
        Doctor doctor = new Doctor("linh1", null, null);
        given(doctorService.addDoctor(doctor)).willReturn(doctor.getId());
        mockMvc.perform(
                post("/doctors")
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .accept(MediaType.APPLICATION_JSON_UTF8)
                        .content(asJsonString(doctor)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", is(doctor.getId())));
        verify(doctorService, times(1)).addDoctor(Mockito.any(Doctor.class));
    }

    // Test DELETE doctor by ID
    @Test
    public void shouldDeleteDoctor() throws Exception {
        Doctor doctor = new Doctor("linh1", null, null);
        given(doctorService.addDoctor(doctor)).willReturn(doctor.getId());
        doNothing().when(doctorService).deleteDoctor(doctor.getId());
        mockMvc.perform(
                delete("/doctors/{id}", doctor.getId()))
                .andExpect(status().isOk());
        verify(doctorService, times(1)).deleteDoctor(doctor.getId());
    }

    // Test PUT doctor by ID
    @Test
    public void shouldUpdateDoctor() throws Exception {
        Doctor doctor = new Doctor(1, "linh1", null, null);
        given(doctorService.addDoctor(doctor)).willReturn(doctor.getId());
        doNothing().when(doctorService).updateDoctor(doctor.getId(), doctor);
        mockMvc.perform(
                put("/doctors/{id}", doctor.getId())
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .accept(MediaType.APPLICATION_JSON_UTF8)
                        .content(asJsonString(doctor)))
                .andExpect(status().isOk());
    }

}
