package model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column
    private String name;
    private String username;
    private String password;
    private String fname;
    private String lname;
    private Date dob;
    private String gender;
    private String address;
    private String email;
    private Number phone;
    private String allergies;
    private String bloodType;
    private String healthStatus;
    private String medicalHistory;

    public Patient() {
    }

    public Patient(String name, String fname, String lname, Date dob, String gender, String address, String email, Number phone, String allergies, String bloodType, String healthStatus, String medicalHistory) {
        this.name = name;
        this.fname = fname;
        this.lname = lname;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.allergies = allergies;
        this.bloodType = bloodType;
        this.healthStatus = healthStatus;
        this.medicalHistory = medicalHistory;
    }

    public Patient(String username, String name, String fname, String lname, Date dob, String gender, String address, String email, Number phone, String allergies, String bloodType, String healthStatus, String medicalHistory) {
        this.username = username;
        this.name = name;
        this.fname = fname;
        this.lname = lname;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.allergies = allergies;
        this.bloodType = bloodType;
        this.healthStatus = healthStatus;
        this.medicalHistory = medicalHistory;
    }


    @Override
    public String toString() {
        return "Patient{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", dob=" + dob +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phone=" + phone +
                ", allergies='" + allergies + '\'' +
                ", bloodType='" + bloodType + '\'' +
                ", healthStatus='" + healthStatus + '\'' +
                ", medicalHistory='" + medicalHistory + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Number getPhone() {
        return phone;
    }

    public void setPhone(Number phone) {
        this.phone = phone;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }
}
