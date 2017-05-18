package org.movie.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String upload(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile  file) {
		String[] strings = request.getParameterValues("checkbox");
		String fileName=file.getOriginalFilename();
		String path=request.getServletContext().getRealPath("static");
		String filePath=path+"/"+fileName;
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "upload";
	}
	
	@RequestMapping("/form")
	public String form() {
		return "form";
	}
	//有点问题
	@RequestMapping(value="/upload1",method=RequestMethod.POST)
	public String upload1(HttpServletRequest request,HttpServletResponse response,@RequestPart("file") byte[] file,@RequestParam("file") String fileName) {
		ByteArrayInputStream inputStream = new ByteArrayInputStream(file);
		FileOutputStream fileOutputStream =null;
		String path=request.getServletContext().getRealPath("static");
		String filePath=path+"/"+fileName;
		File toFile = new File(filePath);
		try {
			byte[] b=new byte[1024];
			fileOutputStream = new FileOutputStream(toFile);
			while((inputStream.read(b))!=-1){
				fileOutputStream.write(b);
			}
			fileOutputStream.flush();
			fileOutputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "upload";
	}
	
	
	//表单获取测试
	@RequestMapping(value="/upload2",method=RequestMethod.POST)
	public String upload2(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("checkbox") String[] box1,TestBean bean) {
		System.out.println(box1);
		System.out.println(bean.checkbox);
		return "upload";
	}
}
class TestBean{
	String [] checkbox;

	public String[] getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String[] checkbox) {
		this.checkbox = checkbox;
	}
	
}
