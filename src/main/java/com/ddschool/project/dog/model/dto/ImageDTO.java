package com.ddschool.project.dog.model.dto;

public class ImageDTO {
	private int imageCode;
	private int dogCode;
	private String imageUrl;
	private boolean status;
	
	public ImageDTO() {
		super();
	}

	public ImageDTO(int imageCode, int dogCode, String imageUrl, boolean status) {
		super();
		this.imageCode = imageCode;
		this.dogCode = dogCode;
		this.imageUrl = imageUrl;
		this.status = status;
	}

	public int getImageCode() {
		return imageCode;
	}

	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}

	public int getDogCode() {
		return dogCode;
	}

	public void setDogCode(int dogCode) {
		this.dogCode = dogCode;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ImageDTO [imageCode=" + imageCode + ", dogCode=" + dogCode + ", imageUrl=" + imageUrl + ", status="
				+ status + "]";
	}
	
	
	

}
