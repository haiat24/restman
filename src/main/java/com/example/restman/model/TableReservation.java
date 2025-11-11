package com.example.restman.model;

import java.sql.Date;

public class TableReservation {
    private int id;
    private String timeSlot;
    private String isCheckIn;
    private String bookingType;
    private Date reservationDate;
    private int customerID;

    public TableReservation() {}

    public TableReservation(String timeSlot, String isCheckIn, String bookingType, Date reservationDate, int customerID) {
        this.timeSlot = timeSlot;
        this.isCheckIn = isCheckIn;
        this.bookingType = bookingType;
        this.reservationDate = reservationDate;
        this.customerID = customerID;
    }

    // Getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }

    public String getIsCheckIn() { return isCheckIn; }
    public void setIsCheckIn(String isCheckIn) { this.isCheckIn = isCheckIn; }

    public String getBookingType() { return bookingType; }
    public void setBookingType(String bookingType) { this.bookingType = bookingType; }

    public Date getReservationDate() { return reservationDate; }
    public void setReservationDate(Date reservationDate) { this.reservationDate = reservationDate; }

    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }
}
