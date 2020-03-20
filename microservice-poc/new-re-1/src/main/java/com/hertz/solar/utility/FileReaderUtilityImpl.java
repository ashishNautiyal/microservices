package com.hertz.solar.utility;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

@Service("fileReaderUtility")
public class FileReaderUtilityImpl implements FileReaderUtility {

	@Resource
	FileFactory fileFactory;             

	public JSONObject readFileByFilePathAndFileType(String filePath, String fileType) {
		JSONObject jsonObject = null;
		try {
			FileTypeReader reader = fileFactory.getReadFileObject(filePath, fileType);
			jsonObject = reader.readFile();
		} catch (Exception e) {
			System.out.println(e);
		}

		return jsonObject;
	}

}
