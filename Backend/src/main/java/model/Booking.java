package model;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private int patient_id;
    private int doctor_id;
    private Time time;
    private Date date;
    private String userName;
    private String status;

//  @ManyToOne(cascade = CascadeType.ALL)
//  private Time time;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Booking() {
    }

    public Booking(int id, int patient_id, int doctor_id, Time time, Date date) {
        this.id = id;
        this.patient_id = patient_id;
        this.doctor_id = doctor_id;
        this.time = time;
        this.date = date;
    }

    public Booking(int patient_id, int doctor_id, Time time, Date date) {
        this.patient_id = patient_id;
        this.doctor_id = doctor_id;
        this.time = time;
        this.date = date;
    }

    public Booking(int patient_id, int doctor_id, Time time, Date date, String userName) {
        this.patient_id = patient_id;
        this.doctor_id = doctor_id;
        this.time = time;
        this.date = date;
        this.userName = userName;
    }
}
