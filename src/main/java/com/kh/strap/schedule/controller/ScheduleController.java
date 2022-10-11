package com.kh.strap.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.schedule.service.logic.ScheduleServiceImpl;


@Controller
public class ScheduleController {
	@Autowired
	private ScheduleServiceImpl scService;
}
