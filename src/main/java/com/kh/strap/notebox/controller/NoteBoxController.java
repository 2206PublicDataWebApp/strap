package com.kh.strap.notebox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.notebox.service.logic.NoteBoxServiceImpl;


@Controller
public class NoteBoxController {
	@Autowired
	private NoteBoxServiceImpl nService;
}
