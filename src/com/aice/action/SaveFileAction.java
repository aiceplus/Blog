package com.aice.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class SaveFileAction extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private String savePath = "D:\\Java\\Java Project\\blog4j\\Blog\\WebContent\\res\\upload";

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String save() {
		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) request;
		File file = wrapper.getFiles("imgFile")[0];
		String fileName = wrapper.getFileNames("imgFile")[0];
		// 检查文件大小
		// if (file.length() > maxSize) {
		// String temStr = "上传文件大小超过限制。";
		// this.writeResponse(response, temStr);
		// return "no";
		// }
		// 检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1)
				.toLowerCase();
		// if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(
		// fileExt)) {
		// String temStr = "上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName)
		// + "格式。";
		// this.writeResponse(response, temStr);
		// return;
		// }

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_"
				+ new Random().nextInt(1000) + "." + fileExt;

		try {
			InputStream in = new FileInputStream(file);
			File uploadFile = new File(savePath, newFileName);
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024 * 1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}

			in.close();
			out.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return SUCCESS;
	}

	@Deprecated
	public String saveDeprecated() {
		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload");

		// 验证上传内容了类型
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 设置内存中存储文件的最大值
			factory.setSizeThreshold(maxMemSize);
			// 本地存储的数据大于 maxMemSize.
			factory.setRepository(new File("c:\\temp"));

			// 创建一个新的文件上传处理程序
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 设置最大上传的文件大小
			upload.setSizeMax(maxFileSize);
			try {
				// 解析获取的文件
				List fileItems = upload
						.parseRequest((HttpServletRequest) request);
				// 处理上传的文件
				Iterator i = fileItems.iterator();
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						// 获取上传文件的参数
						String fieldName = fi.getFieldName();
						String fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// 写入文件
						if (fileName.lastIndexOf("\\") >= 0) {
							file = new File(filePath,
									fileName.substring(fileName
											.lastIndexOf("\\")));
						} else {
							file = new File(filePath,
									fileName.substring(fileName
											.lastIndexOf("\\") + 1));
						}
						fi.write(file);
					}
				}
			} catch (Exception ex) {
				System.out.println(ex);
			}
		} else {
		}
		return SUCCESS;
	}

}
