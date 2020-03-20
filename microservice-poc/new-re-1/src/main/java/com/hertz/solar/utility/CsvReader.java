package com.hertz.solar.utility;

import java.io.File;
import java.io.FileReader;
import java.util.List;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import com.opencsv.CSVReader;

public class CsvReader implements FileTypeReader {

	 String filePath;

	CsvReader(String filePath) {
		this.filePath = filePath;

	}

	@Override
	public JSONObject readFile() {
		JSONObject dataObject = new JSONObject();
		File file = new File(filePath);
		if (filePath != null) {
			try {
				List<String[]> fileData = readCSVFileAllObjects(filePath);
				if (fileData != null && !fileData.isEmpty()) {
					dataObject = new JSONObject();
					int rowCount = 0;
					JSONArray objectArray = new JSONArray();
					for (String[] row : fileData) {
						int rowDataCount = 0;
						JSONArray object = new JSONArray();
						for (String rowData : row) {
							object.put(rowDataCount, rowData);
							rowDataCount++;
						}
						objectArray.put(rowCount, object);
						rowCount++;
					}
					dataObject.put("file_name", file.getName());
					dataObject.put("Scada_file", objectArray);
				}
			} catch (Exception e) {
				// logger.error("Exception in parseCSVFileForScadaAutomation() of " + e);
			}

		}
		return dataObject;
	}
	

	public static List<String[]> readCSVFileAllObjects(String filePath) {

		try (CSVReader csvReader = new CSVReader(new FileReader(filePath))) {
			List<String[]> listObject = csvReader.readAll();
			return listObject;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


}
