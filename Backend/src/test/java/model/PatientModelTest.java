package model;

import model.Patient;
import org.junit.Test;

import java.sql.Date;

import static org.junit.Assert.*;


public class PatientModelTest {


    //private Patient doc = new Patient("Cuong","Truong","Male","2020-07-28","O","phucuong200297@gmail.com",349305195,"NVL","No","No","Not good");
    private Patient doc = new Patient("Cuong", "Cuong", "Truong", new Date(2020, 8, 6), "Male", "NVL", "phucuong200297@gmail.com", 349305195, "No", "O", "Not good", "No");


    public PatientModelTest() {


    }

    @Test
    public void testGetFistName() {
        System.out.println("Get First Name");
        String expect = "Cuong";
        String actual = doc.getFname();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetFirstName() {
        System.out.println("Set First Name");
        String newFName = "new Cuong";
        doc.setFname(newFName);
        System.out.println(doc);
    }

    @Test
    public void testGetLastName() {
        System.out.println("Get Last Name");
        String expect = "Truong";
        String actual = doc.getLname();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetLastName() {
        System.out.println("Set Last Name");
        String newLName = "new Truong";
        doc.setLname(newLName);
        System.out.println(doc);
    }

    @Test
    public void testGetGender() {
        System.out.println("Get Gender");
        String expect = "Male";
        String actual = doc.getGender();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetGender() {
        System.out.println("Set Gender");
        String newGender = "Male";
        doc.setGender(newGender);
        System.out.println(doc);
    }

    @Test
    public void testGetDoB() {
        System.out.println("Get Date Of Birth");
        Date expect = new Date(2020, 8, 6);
        Date actual = doc.getDob();
        assertEquals(expect, actual);
    }

    @Test
    public void testSetDoB() {
        System.out.println("Set Date Of Birth");
        Date newDoB = new Date(1997, 2, 20);
        doc.setDob(newDoB);
        System.out.println(doc);
    }

    @Test
    public void testGetBloodType() {
        System.out.println("Get Blood Type");
        String expect = "O";
        String actual = doc.getBloodType();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetBloodType() {
        System.out.println("Set Blood Type");
        String newBloodType = "AB";
        doc.setBloodType(newBloodType);
        System.out.println(doc);
    }

    @Test
    public void testGetEmail() {
        System.out.println("Get Email");
        String expect = "phucuong200297@gmail.com";
        String actual = doc.getEmail();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetEmail() {
        System.out.println("Set Email");
        String newEmail = "s3713026@rmit.edu.vn";
        doc.setEmail(newEmail);
        System.out.println(doc);
    }

    @Test
    public void testGetPhone() {
        System.out.println("Get Phone");
        Number expect = 349305195;
        Number actual = doc.getPhone();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetPhone() {
        System.out.println("Set Phone");
        Number newPhone = 93651763;
        doc.setPhone(newPhone);
        System.out.println(doc);
    }

    @Test
    public void testGetAddress() {
        System.out.println("Get Address");
        String expect = "NVL";
        String actual = doc.getAddress();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetAddress() {
        System.out.println("Set Address");
        String newAddress = "D4";
        doc.setAddress(newAddress);
        System.out.println(doc);
    }

    @Test
    public void testGetAllergies() {
        System.out.println("Get Allergies");
        String expect = "No";
        String actual = doc.getAllergies();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetAllergies() {
        System.out.println("Set Allergies");
        String newAllergies = "Yes";
        doc.setAllergies(newAllergies);
        System.out.println(doc);
    }

    @Test
    public void testGetMedicalHistory() {
        System.out.println("Get Medical History");
        String expect = "No";
        String actual = doc.getMedicalHistory();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetMedicalHistory() {
        System.out.println("Set MedicalHistory");
        String newMedicalHistory = "Used to use cocaine";
        doc.setMedicalHistory(newMedicalHistory);
        System.out.println(doc);
    }

    @Test
    public void testGetHealthStatus() {
        System.out.println("Get Health Status");
        String expect = "Not good";
        String actual = doc.getHealthStatus();
        assertEquals(expect, actual);

    }

    @Test
    public void testSetHealthStatus() {
        System.out.println("Set Health Status");
        String newHealthStatus = "Good";
        doc.setHealthStatus(newHealthStatus);
        System.out.println(doc);
    }
}

