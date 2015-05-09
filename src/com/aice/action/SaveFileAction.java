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
		// ����ļ���С
		// if (file.length() > maxSize) {
		// String temStr = "�ϴ��ļ���С�������ơ�";
		// this.writeResponse(response, temStr);
		// return "no";
		// }
		// �����չ��
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1)
				.toLowerCase();
		// if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(
		// fileExt)) {
		// String temStr = "�ϴ��ļ���չ���ǲ��������չ����\nֻ����" + extMap.get(dirName)
		// + "��ʽ��";
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

		// ��֤�ϴ�����������
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			// �����ڴ��д洢�ļ������ֵ
			factory.setSizeThreshold(maxMemSize);
			// ���ش洢�����ݴ��� maxMemSize.
			factory.setRepository(new File("c:\\temp"));

			// ����һ���µ��ļ��ϴ��������
			ServletFileUpload upload = new ServletFileUpload(factory);
			// ��������ϴ����ļ���С
			upload.setSizeMax(maxFileSize);
			try {
				// ������ȡ���ļ�
				List fileItems = upload
						.parseRequest((HttpServletRequest) request);
				// �����ϴ����ļ�
				Iterator i = fileItems.iterator();
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						// ��ȡ�ϴ��ļ��Ĳ���
						String fieldName = fi.getFieldName();
						String fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// д���ļ�
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
