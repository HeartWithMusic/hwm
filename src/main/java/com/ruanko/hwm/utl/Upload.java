package com.ruanko.hwm.utl;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传类
 * @author libaoshen PC
 *
 */
public class Upload {
	/**
	 * 保存封面图片
	 * @param imageName
	 * @param image
	 */
	public static void saveImage(String imageName, MultipartFile image){
			
			File file = new File(imageName);
			try {
				FileUtils.writeByteArrayToFile(file, image.getBytes());
			} catch (IOException e) {
				e.printStackTrace(); 
			}	
	}	
}
