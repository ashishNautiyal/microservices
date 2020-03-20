package com.hertz.solar.utility;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

public class XLSXFileReader implements FileTypeReader {

	String filePath;

	XLSXFileReader(String filePath) {
		this.filePath = filePath;

	}

	@Override
	public JSONObject readFile() {
		File file = new File(filePath);
		JSONObject returnObject = new JSONObject();
		try {
			LinkedHashMap<String, XSSFSheet> sheets = readExcel(file);
			if (sheets != null && !sheets.isEmpty()) {
				JSONArray sheetArray = new JSONArray();
				int sheetCount = 0;
				for (String key : sheets.keySet()) {
					JSONObject sheetObject = new JSONObject();
					List<XSSFRow> rows = processSheet(sheets.get(key), 0);
					if (rows != null && !rows.isEmpty()) {
						JSONArray rowsData = new JSONArray();
						int rowCount = 0;
						for (XSSFRow row : rows) {
							if (row != null) {
								JSONArray rowData = new JSONArray();
								int lastCell = row.getLastCellNum();
								for (int i = 0; i <= lastCell; i++) {
									rowData.put(i, row.getCell(i));
								}
								rowsData.put(rowCount, rowData);
								rowCount++;
							}
						}
						if (rowsData.length() > 0) {
							sheetObject.put("tab_name", key);
							sheetObject.put("Sheet_Data", rowsData);
							sheetArray.put(sheetCount, sheetObject);
							sheetCount++;
						}
					}
				}
				returnObject.put("Scada_file", sheetArray);
				returnObject.put("file_name", file.getName());
			}
		} catch (Exception e) {
			// logger.error("Exception in parseXLSXFileForScadaAutomation of
			// ScadaAutomationConfigController" + e);
		}
		return returnObject;
	}

	// read excel sheet and return all sheets
	public static LinkedHashMap<String, XSSFSheet> readExcel(File filePath) {
		LinkedHashMap<String, XSSFSheet> xssfSheets = null;
		try {

			FileInputStream inputStream = new FileInputStream(filePath);
			xssfSheets = new LinkedHashMap<>();
			// Get the workbook instance for XLSX file
			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
			for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
				XSSFSheet xssfSheet = workbook.getSheetAt(i);
				xssfSheets.put(xssfSheet.getSheetName(), xssfSheet);
			}
		} catch (Exception e) {
			// logger.error(e.getMessage());
		}
		return xssfSheets;
	}

	// read all excel sheet row
	public static List<XSSFRow> processSheet(XSSFSheet xssfSheet, int skipRow) {
		List<XSSFRow> xssfRows = null;
		try {

			xssfRows = new ArrayList<>();
			for (int rownum = skipRow; rownum <= xssfSheet.getLastRowNum(); rownum++) {
				xssfRows.add(xssfSheet.getRow(rownum));
			}
		} catch (Exception e) {
			// logger.error(e.getMessage());
		}
		return xssfRows;

	}

}
