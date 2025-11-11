package model;

import java.sql.Date;

public class User {
    private int id;
    public String name;
    public String userName;
    public String password;
    public Date dateOfBirth;
    public String email;
    public String address;
    public String phoneNumber;
    public String role;
    public String note;


    public User() {
        super();
    }



    public User(int id, String name, String userName, String password, Date dateOfBirth, String email, String address,
                String phoneNumber, String role, String note) {
        super();
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.note = note;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }



    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", userName=" + userName + ", password=" + password
                + ", dateOfBirth=" + dateOfBirth + ", email=" + email + ", address=" + address + ", phoneNumber="
                + phoneNumber + ", role=" + role + ", note=" + note + "]";
    }



}
