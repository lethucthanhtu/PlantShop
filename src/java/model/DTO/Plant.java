package src.java.model.DTO;

import java.io.Serializable;

public class Plant implements Serializable{
    private int plantID;
    private String plantName;
    private int price;
    private String imgPath;
    private String description;
    private int status;
    private int cateID;

    public Plant() {
    }

    public Plant(int plantID, String plantName, int price, String imgPath, String description, int status, int cateID) {
        this.plantID = plantID;
        this.plantName = plantName;
        this.price = price;
        this.imgPath = imgPath;
        this.description = description;
        this.status = status;
        this.cateID = cateID;
    }

    public Plant(String plantName, int price, String imgPath, String description, int status, int cateID) {
        this.plantName = plantName;
        this.price = price;
        this.imgPath = imgPath;
        this.description = description;
        this.status = status;
        this.cateID = cateID;
    }

    public int getPlantID() {
        return plantID;
    }

    public String getPlantName() {
        return plantName;
    }

    public int getPrice() {
        return price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public String getDescription() {
        return description;
    }

    public int getStatus() {
        return status;
    }

    public int getCateID() {
        return cateID;
    }

    public void setPlantID(int plantID) {
        this.plantID = plantID;
    }

    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }
    
    
}
