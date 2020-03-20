package com.hertz.solar.utility;

import org.codehaus.jettison.json.JSONObject;

public interface FileReaderUtility {
	JSONObject readFileByFilePathAndFileType(String filePath, String fileType);
}
