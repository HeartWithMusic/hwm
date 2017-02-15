package com.ruanko.hwm.utl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FileUtils;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 上传下载类
 * @author libaoshen PC
 *
 */
public class Upload_Download {
	/**
	 * 保存封面图片
	 * @param imageName
	 * @param image
	 */
	public static void saveImage(String imageName, MultipartFile image) {

		File file = new File(imageName);
		try {
			FileUtils.writeByteArrayToFile(file, image.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method: makeFileName
	 * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
	 * @param filename
	 *            文件的原始名称
	 * @return uuid+"_"+文件的原始名称
	 */
	public static String makeFileName(String filename) { // 2.jpg
		// 为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		return UUID.randomUUID().toString() + "_" + filename;
	}

	/**
	 * 为防止一个目录下面出现太多文件，要使用hash算法打散存储
	 * 
	 * @Method: makePath
	 * @Description:
	 *
	 * @param filename
	 *            文件名，要根据文件名生成存储目录
	 * @param savePath
	 *            文件存储路径
	 * @return 新的存储目录
	 */
	public static String makePath(String filename, String savePath) {
		// 得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
		int hashcode = filename.hashCode();
		int dir1 = hashcode & 0xf; // 0--15
		int dir2 = (hashcode & 0xf0) >> 4; // 0-15
		// 构造新的保存目录
		String dir = savePath + "\\" + dir1 + "\\" + dir2; // upload\2\3
															// upload\3\5
		// File既可以代表文件也可以代表目录
		File file = new File(dir);
		// 如果目录不存在
		if (!file.exists()) {
			// 创建目录
			file.mkdirs();
		}
		return dir;
	}
	
	/**
	 * 上传歌手封面
	 * @param file
	 * @param request
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static void upload_img1(MultipartFile file, HttpServletRequest request, String name) throws FileNotFoundException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/singer/");
		//判断文件夹是否存在
		existFolder(root);
		
		if (!file.isEmpty()){
            Streams.copy(file.getInputStream(),new FileOutputStream(root + "\\" + name + ".jpg"),true);
        }
	}
	
	/**
	 * 上传音乐封面
	 * @param file
	 * @param request
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static void upload_img(MultipartFile file, HttpServletRequest request, String name) throws FileNotFoundException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/music/img");
		//判断文件夹是否存在
		existFolder(root);
		
		if (!file.isEmpty()){
            Streams.copy(file.getInputStream(),new FileOutputStream(root + "\\" + name + ".jpg"),true);
        }
	}
	/**
	 * 上传音乐歌词文件
	 * @param file
	 * @param request
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static void upload_lrc(MultipartFile file, HttpServletRequest request, String name) throws FileNotFoundException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/music/lrc");
		//判断文件夹是否存在
		existFolder(root);
		
		if (!file.isEmpty()){
            Streams.copy(file.getInputStream(),new FileOutputStream(root + "\\" + name + ".lrc"),true);
        }
	}
	/**
	 * 上传音乐文件
	 * @param file
	 * @param request
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static void upload_song(MultipartFile file, HttpServletRequest request, String name) throws FileNotFoundException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/music/song");
		//判断文件夹是否存在
		existFolder(root);
		
		if (!file.isEmpty()){
            Streams.copy(file.getInputStream(),new FileOutputStream(root + "\\" + name + ".mp3"),true);
        }
	}
	
	/**
	 * 返回音乐文件的时长
	 * @param file
	 * @return
	 */
	public static String getMusicLength(File file) {  
	    try {  
	        MP3File f = (MP3File)AudioFileIO.read(file);  
	        MP3AudioHeader audioHeader = (MP3AudioHeader)f.getAudioHeader();  
	        String time = audioHeader.getTrackLengthAsString();
	        return time;
	    } catch(Exception e) {  
	        e.printStackTrace();
		    return "";
	    }  
	}
	
	/**
	 * 将MultipartFile转换为File
	 * @param file
	 * @return
	 */
	public static File multipartfileToFile(MultipartFile file) {
        CommonsMultipartFile cf= (CommonsMultipartFile)file; 
        DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
        return fi.getStoreLocation(); 
	}
	
	/**
	 * 文件夹是否存在，若不存在则新建
	 * @param path
	 */
	public static void existFolder(String path) {
		File file =new File(path);    
		//如果文件夹不存在则创建    
		if  (!file .exists()  && !file .isDirectory()) {       
		    //System.out.println("//不存在");  
		    file .mkdir();    
		}  
	}

	public static void download() {

	}
}
