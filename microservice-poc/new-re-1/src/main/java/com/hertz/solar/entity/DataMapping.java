package com.hertz.solar.entity;

public class DataMapping {
	private ColumnMapping  date;
	
	private ColumnMapping scadaPower;
	
	private ColumnMapping windSpeed;
	
	private ColumnMapping windDirection;

	public ColumnMapping getDate() {
		return date;
	}

	public void setDate(ColumnMapping date) {
		this.date = date;
	}

	public ColumnMapping getScadaPower() {
		return scadaPower;
	}

	public void setScadaPower(ColumnMapping scadaPower) {
		this.scadaPower = scadaPower;
	}

	public ColumnMapping getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(ColumnMapping windSpeed) {
		this.windSpeed = windSpeed;
	}

	public ColumnMapping getWindDirection() {
		return windDirection;
	}

	public void setWindDirection(ColumnMapping windDirection) {
		this.windDirection = windDirection;
	}
	
	

}
