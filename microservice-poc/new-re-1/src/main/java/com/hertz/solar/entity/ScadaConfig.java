package com.hertz.solar.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "scada_config")
public class ScadaConfig {

	@Id
	@Field("_id")
	private String id;

	@Field("source")
	private String source;

	@Field("pooling_station")
	private String poolingStation;

	@Field("scada_automation_rule")
	private String scadaAutomationRule;

	@Field("file_path")
	private String filePath;

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

	public String getPoolingStation() {
		return poolingStation;
	}

	public void setPoolingStation(String poolingStation) {
		this.poolingStation = poolingStation;
	}

	public String getScadaAutomationRule() {
		return scadaAutomationRule;
	}

	public void setScadaAutomationRule(String scadaAutomationRule) {
		this.scadaAutomationRule = scadaAutomationRule;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
