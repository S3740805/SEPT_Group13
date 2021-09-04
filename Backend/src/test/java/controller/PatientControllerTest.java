package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Patient;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.match.ContentRequestMatchers;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import service.PatientService;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertEquals;
import static org.mockito.BDDMockito.*;
import static org.hamcrest.core.Is.is;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class PatientControllerTest {
    private MockMvc mockMvc;

    @Mock
    private PatientService patientService;

    @InjectMocks
    private PatientController patientController;

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
                .standaloneSetup(patientController)
                .build();
    }

    // Test GET all patients
    @Test
    public void shouldReturnGetAll() throws Exception {
        List<Patient> datas = new ArrayList();
        datas.add(new Patient("cuong1", null, null, null, null, null, null, null, null, null, null, null));
        datas.add(new Patient("cuong2", null, null, null, null, null, null, null, null, null, null, null));
        given(patientService.getPatients()).willReturn(datas);
        mockMvc.perform(get("/patients"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].name", is("cuong1")))
                .andExpect(jsonPath("$[1].name", is("cuong2")));
        verify(patientService, times(1)).getPatients();
    }

    // Test POST a patient
    @Test
    public void shouldAddNewPatient() throws Exception {
        Patient patient = new Patient("cuong1", null, null, null, null, null, null, null, null, null, null, null);
        given(patientService.addPatient(patient)).willReturn(patient.getId());
        mockMvc.perform(
                post("/patients")
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .accept(MediaType.APPLICATION_JSON_UTF8)
                        .content(asJsonString(patient)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", is(patient.getId())));
        verify(patientService, times(1)).addPatient(Mockito.any(Patient.class));

    }

    // Test DELETE patient by ID
    @Test
    public void shouldDeletePatient() throws Exception {
        Patient patient = new Patient("cuong1", null, null, null, null, null, null, null, null, null, null, null);
        given(patientService.addPatient(patient)).willReturn(patient.getId());
        mockMvc.perform(
                delete("/patients/{id}", patient.getId()))
                .andExpect(status().isOk());
        verify(patientService, times(1)).deletePatient(patient.getId());

    }

    // Test PUT patient by username
    @Test
    public void shouldUpdatePatient() throws Exception {
        Patient patient = new Patient("cuong", "cuong1", null, null, null, null, null, null, null, null, null, null, null);
        given(patientService.getPatientbyUser(patient.getUsername())).willReturn(patient);
        doNothing().when(patientService).updatePatientbyUser(patient.getUsername(), patient);
        mockMvc.perform(
                put("/patients/{username}", patient.getUsername())
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .accept(MediaType.APPLICATION_JSON_UTF8)
                        .content(asJsonString(patient)))
                .andExpect(status().isOk());

    }


}
