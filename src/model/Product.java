package model;

import java.io.Serializable;

public class Product  implements Serializable{
	private int partNumber, supplierId, reorderLevel, minReorderQty, stock;
	private double unitPrice;
	private String description, colour, dimension, manufacturer, shelfLocation, status;
	
	public int getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(int partNumber) {
		this.partNumber = partNumber;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public int getReorderLevel() {
		return reorderLevel;
	}
	public void setReorderLevel(int reorderLevel) {
		this.reorderLevel = reorderLevel;
	}
	public int getMinReorderQty() {
		return minReorderQty;
	}
	public void setMinReorderQty(int minReorderQty) {
		this.minReorderQty = minReorderQty;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getShelfLocation() {
		return shelfLocation;
	}
	public void setShelfLocation(String shelfLocation) {
		this.shelfLocation = shelfLocation;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + partNumber;
		return result;
	}
	@Override
	public String toString() {
		return "Product [partNumber=" + partNumber + ", supplierId=" + supplierId + ", reorderLevel=" + reorderLevel
				+ ", minReorderQty=" + minReorderQty + ", stock=" + stock + ", unitPrice=" + unitPrice
				+ ", description=" + description + ", colour=" + colour + ", dimension=" + dimension + ", manufacturer="
				+ manufacturer + ", shelfLocation=" + shelfLocation + ", status=" + status + "]";
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (partNumber != other.partNumber)
			return false;
		return true;
	}
}
