package com.yedam.finalPrj.exhibition.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.finalPrj.exhibition.service.ExhibitionService;

@RestController
@RequestMapping("/exhibition/*")
public class ExhibitionRestController {

	@Autowired ExhibitionService service;
	
	HttpServletRequest request;
}
