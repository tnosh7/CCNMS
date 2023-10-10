package com.application.ccnms.admin.digging.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.digging.service.AdminDiggingService;
import com.application.ccnms.digging.dto.DiggingDTO;

@Controller
@RequestMapping("/admin/digging")
public class AdminDiggingController {

	private AdminDiggingService adminDiggingService;

	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	
	@GetMapping("diggingAdd")
	public ModelAndView diggingAdd () {
		return new ModelAndView("/admin/digging/diggingAdd");
	}
	
	@PostMapping("diggingAdd")
	public @ResponseBody String diggingAdd(MultipartHttpServletRequest multipartRequest, HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName="";
		while(fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next()); // 하나의 <input type="file">를 반환한다.
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				fileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH + fileName)); 
			}
		}
		DiggingDTO diggingDTO = new DiggingDTO();
		diggingDTO.setDiggingTopic(request.getParameter("diggingTopic"));
		diggingDTO.setSubject(request.getParameter("subject"));
		diggingDTO.setContent(request.getParameter("content"));
		diggingDTO.setWriter("ModuDigging");
		diggingDTO.setFile(fileName);
		diggingDTO.setEnrollDT(new Date());
		System.out.println(diggingDTO);
		adminDiggingService.addDigging(diggingDTO);
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		return jsScript;
	}
	
	
	
	@GetMapping("diggingManagement")
	public ModelAndView diggingManagement () {
		return new ModelAndView("/admin/digging/diggingManagement");
	}
}
