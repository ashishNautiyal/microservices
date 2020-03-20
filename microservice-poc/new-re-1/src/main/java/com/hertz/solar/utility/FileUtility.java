package com.hertz.solar.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import com.opencsv.CSVReader;

public class FileUtility {
	public static JSONObject parseCSVFileForScadaAutomation(String filePath) {
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

	public static JSONObject parseXLSFileForScadaAutomation(String filePath) {
		File file = new File(filePath);
		JSONObject returnObject = new JSONObject();
		try {
			LinkedHashMap<String, HSSFSheet> sheets = readExcelHSSF(file);
			if (sheets != null && !sheets.isEmpty()) {
				JSONArray sheetArray = new JSONArray();
				int sheetCount = 0;

				for (String key : sheets.keySet()) {
					JSONObject sheetObject = new JSONObject();
					List<HSSFRow> rows = processSheetHSSF(sheets.get(key), 0);
					if (rows != null && !rows.isEmpty()) {
						JSONArray rowsData = new JSONArray();
						int rowCount = 0;
						for (HSSFRow row : rows) {
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

	public static JSONObject parseXLSXFileForScadaAutomation(String filePath) {
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

	public static LinkedHashMap<String, HSSFSheet> readExcelHSSF(File filePath) {
		LinkedHashMap<String, HSSFSheet> xssfSheets = null;
		try {

			FileInputStream inputStream = new FileInputStream(filePath);
			xssfSheets = new LinkedHashMap<>();
			// Get the workbook instance for XLS file
			HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
			for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
				HSSFSheet xssfSheet = workbook.getSheetAt(i);
				xssfSheets.put(xssfSheet.getSheetName(), xssfSheet);
			}
		} catch (Exception e) {
			// logger.error(e.getMessage());

		}
		return xssfSheets;
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

	// read all excel sheet row
	public static List<HSSFRow> processSheetHSSF(HSSFSheet xssfSheet, int skipRow) {
		List<HSSFRow> xssfRows = null;
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

	public static CellRangeAddress isMergedRegion(XSSFSheet sheet, int row, int column) {
		try {
			int sheetMergeCount = sheet.getNumMergedRegions();
			for (int i = 0; i < sheetMergeCount; i++) {
				CellRangeAddress ca = sheet.getMergedRegion(i);
				int firstColumn = ca.getFirstColumn();
				int lastColumn = ca.getLastColumn();
				int firstRow = ca.getFirstRow();
				int lastRow = ca.getLastRow();
				if (row >= firstRow && row <= lastRow) {
					if (column >= firstColumn && column <= lastColumn) {
						return ca;
					}
				}
			}
		} catch (Exception e) {

		}
		return null;
	}

}
