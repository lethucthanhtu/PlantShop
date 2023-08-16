package src.java.model.DTO;

import java.io.Serializable;
import java.sql.Date;
import letu.ui.Color;

public class Order implements Serializable {
    private int orderID;
    private Date ordDate;
    private Date shipDate;
    private int status;
    private int accID;

    public Order() {
    }

    public Order(int orderID, Date ordDate, int status, int accID) {
        this.orderID = orderID;
        this.ordDate = ordDate;
        this.status = status;
        this.accID = accID;
        this.shipDate = null;
    } 

    public Order(int orderID, Date ordDate, Date shipDate, int status, int accID) {
        this.orderID = orderID;
        this.ordDate = ordDate;
        this.shipDate = shipDate;
        this.status = status;
        this.accID = accID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrdDate() {
        return ordDate;
    }

    public void setOrdDate(Date ordDate) {
        this.ordDate = ordDate;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    @Override
    public String toString() {
        return ordDate + "-" + shipDate + "-" + accID + "-" + status;
    }
    
    
    
}