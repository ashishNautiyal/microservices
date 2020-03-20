package com.hertz.solar.entity;

import java.io.Serializable;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "scada_configration")
public class ScadaConfigration implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	@Id
	@Field("_id")
	private String id;
	@Field("source")
	private String source;
	@Field("config_name")
	private String configName;
	@Field("file_type")
	private FileType fileType;
	@Field("data_mapping")
	private Map<String, Map<String, String>> dataMapping;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getConfigName() {
		return configName;
	}

	public void setConfigName(String configName) {
		this.configName = configName;
	}

	public Map<String, Map<String, String>> getDataMapping() {
		return dataMapping;
	}

	public void setDataMapping(Map<String, Map<String, String>> dataMapping) {
		this.dataMapping = dataMapping;
	}

	public FileType getFileType() {
		return fileType;
	}

	public void setFileType(FileType fileType) {
		this.fileType = fileType;
	}

}
