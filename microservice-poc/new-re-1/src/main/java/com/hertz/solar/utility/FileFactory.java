package com.hertz.solar.utility;

import org.springframework.stereotype.Service;

@Service("fileFactory")
public class FileFactory {

	public FileTypeReader getReadFileObject(String filePath, String fileType) {
		try {
			if (fileType == null) {
				return null;
			} else if (fileType.equalsIgnoreCase("csv")) {

				return new CsvReader(filePath);

			} else if (fileType.equalsIgnoreCase("xls"))

			{
				return new XLSFileReader(filePath);

			} else if (fileType.equalsIgnoreCase("xlsx")) {
				return new XLSXFileReader(filePath);
			}
		} catch (Exception e) {
			System.out.print(e);
		}

		return null;

	}

}
