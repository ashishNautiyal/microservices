package com.hertz.solar.entity;

import java.io.Serializable;

public class FileType  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String fileTypeName;

	private String delimeter;

	private boolean hasHeader;

	private Integer headerIndex;

	private String headerText;

	private Integer dataIndex;

	public FileType(String fileTypeName, String delimeter, boolean hasHeader, Integer headerIndex, String headerText,
			Integer dataIndex) {
		this.fileTypeName = fileTypeName;
		this.delimeter = delimeter;
		this.hasHeader = hasHeader;
		this.headerIndex = headerIndex;
		this.headerText = headerText;
		this.dataIndex = dataIndex;

	}

	public String getDelimeter() {
		return delimeter;
	}

	public void setDelimeter(String delimeter) {
		this.delimeter = delimeter;
	}

	public boolean isHasHeader() {
		return hasHeader;
	}

	public void setHasHeader(boolean hasHeader) {
		this.hasHeader = hasHeader;
	}

	public Integer getHeaderIndex() {
		return headerIndex;
	}

	public void setHeaderIndex(Integer headerIndex) {
		this.headerIndex = headerIndex;
	}

	public Integer getDataIndex() {
		return dataIndex;
	}

	public void setDataIndex(Integer dataIndex) {
		this.dataIndex = dataIndex;
	}

	public String getHeaderText() {
		return headerText;
	}

	public void setHeaderText(String headerText) {
		this.headerText = headerText;
	}

	public String getFileTypeName() {
		return fileTypeName;
	}

	public void setFileTypeName(String fileTypeName) {
		this.fileTypeName = fileTypeName;
	}

}
