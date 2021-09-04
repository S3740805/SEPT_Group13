package model;

import model.Doctor;
import org.junit.Test;

import static org.junit.Assert.*;


public class DoctorModelTest {
    private Doctor doc = new Doctor("Linh", "Linh@gmail.com", "abc");

    public DoctorModelTest() {
    }


    @Test
    public void testGetName() {
        System.out.println("Get Name");
        String expect = "Linh";
        String actual = doc.getName();
        assertEquals(expect, actual);
    }

    @Test
    public void testSetName() {
        System.out.println("Set Name");
        String newName = "new Linh";
        doc.setName(newName);
        System.out.println(doc);
    }

    @Test
    public void testGetEmail() {
        System.out.println("Get Email");
        String expect = "Linh@gmail.com";
        String actual = doc.getEmail();
        assertEquals(expect, actual);
    }

    @Test
    public void testSetEmail() {
        System.out.println("Set Name");
        String newEmail = "new@gmail.com";
        doc.setEmail(newEmail);
        System.out.println(doc);
    }

    @Test
    public void testGetDescription() {
        System.out.println("Get Description");
        String expect = "abc";
        String actual = doc.getDescription();
        assertEquals(expect, actual);
    }

    @Test
    public void testSetDescription() {
        System.out.println("Set Description");
        String newDescription = "new abc";
        doc.setDescription(newDescription);
        System.out.println(doc);
    }
}
